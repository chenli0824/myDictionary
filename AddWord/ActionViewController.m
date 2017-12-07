//
//  ActionViewController.m
//  AddWord
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "ActionViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "DictionaryServiceImpl.h"
#import "WordDetailInfo.h"
#import "SearchWord.h"
@interface ActionViewController ()

//@property(strong,nonatomic) IBOutlet UIImageView *imageView;
@property(nonatomic,strong) NSString *word;
@property(nonatomic,strong) DictionaryServiceImpl *serviceImpl;
@property(nonatomic,strong) WordDetailInfo *detailInfo;
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UILabel *meansLabel;

@end

@implementation ActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.serviceImpl = [[DictionaryServiceImpl alloc] init];
	[self readWord];
	@weakify(self)
	[RACObserve(self, detailInfo) subscribeNext:^(id  _Nullable x) {
		@strongify(self)
		if (x) {
			[self initUI];
		}
	}];
}


-(void)fetchWordDetail{
	[[self.serviceImpl fetchWordDetail:[self.word lowercaseString]] subscribeNext:^(id  _Nullable x) {
		NSError *error;
		self.detailInfo = [MTLJSONAdapter modelOfClass:WordDetailInfo.class 
																fromJSONDictionary:x
																						 error:&error];
		if (error) {
			NSLog(@"%@",error);
		}
	}];
}

-(void)initUI{
	self.wordLabel.attributedText = [self wordAttributedString];
	self.meansLabel.text = [self meansString];
}

-(NSString *)meansString{
	if(self.detailInfo.baesInfo.symbols.count == 0) return @"";
	NSMutableString *mutableString = [NSMutableString string];
	for (Symbols *symbolsModel in self.detailInfo.baesInfo.symbols) {
		for (WordProperty *property in symbolsModel.parts) {
			[mutableString appendString:[NSString stringWithFormat:@"\n%@ ",property.part]];
			for (NSString *mean in property.means) {
				[mutableString appendString:mean];
			}
		}
	}
	return [mutableString copy];
}

-(NSAttributedString *)wordAttributedString{
	NSMutableAttributedString *wordStr = [[NSMutableAttributedString alloc] initWithString:self.detailInfo.baesInfo.word_name attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:21]}];
	if (self.detailInfo.baesInfo.symbols.count>0) {
		Symbols *symbol = self.detailInfo.baesInfo.symbols[0];
		if (!symbol.ph_am && !symbol.ph_en ) return [wordStr copy];
		NSAttributedString *phStr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"  /%@/ /%@/",symbol.ph_en,symbol.ph_am] 
																																attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
		[wordStr appendAttributedString:phStr];
	}
	return [wordStr copy];
}

-(void)readWord{
	if(self.extensionContext.inputItems.count == 0) return;
	for(NSExtensionItem *item in self.extensionContext.inputItems){
		NSLog(@"%@",item.attachments);
		if(item.attachments.count == 0) return;
		for(NSItemProvider *provider in item.attachments){
			[provider loadItemForTypeIdentifier:@"public.plain-text" options:nil
												completionHandler:^(id<NSSecureCoding>  _Nullable item, NSError * _Null_unspecified error) {
													NSLog(@"%@",item);
													if(!error){
														self.word = (NSString *)item;
														[self fetchWordDetail];
													}
												}];
		}
	}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done {
    // Return any edited content to the host app.
    // This template doesn't do anything, so we just echo the passed in items.
    [self.extensionContext completeRequestReturningItems:self.extensionContext.inputItems completionHandler:nil];
}

@end

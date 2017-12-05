//
//  WordDetailViewController.m
//  MyDictionary
//
//  Created by chenli on 03/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "WordDetailViewController.h"
#import <SVProgressHUD.h>

@interface WordDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *wordLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WordDetailViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
	[SVProgressHUD show];
	[[self.viewModel.fetchDetailCommand execute:nil] subscribeNext:^(id  _Nullable x) {
		[SVProgressHUD dismiss];
	}];
	[self bindViewModel];
}

-(void)bindViewModel{
	@weakify(self)
	[RACObserve(self.viewModel, detailInfo) subscribeNext:^(WordDetailInfo *model) {
		@strongify(self)
		if (model) {
			[self initUI];
		}
	}];
}

-(void)initUI{
	self.wordLabel.attributedText = [self wordAttributedString];
}

-(NSAttributedString *)wordAttributedString{
	NSMutableAttributedString *wordStr = [[NSMutableAttributedString alloc] initWithString:self.viewModel.detailInfo.baesInfo.word_name attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:21]}];
	if (self.viewModel.detailInfo.baesInfo.symbols.count>0) {
		Symbols *symbol = self.viewModel.detailInfo.baesInfo.symbols[0];
		NSAttributedString *phStr = [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"  /%@/ /%@/",symbol.ph_en,symbol.ph_am] 
																																attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]}];
		[wordStr appendAttributedString:phStr];
	}
	return [wordStr copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

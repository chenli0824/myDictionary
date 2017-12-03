//
//  SearchWordViewController.m
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "SearchWordViewController.h"
#import "SearchWordCell.h"
#import "SearchWord.h"
#import "DictionaryServiceImpl.h"
#import "WordDetailInfo.h"
@interface SearchWordViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *searchField;

@end

@implementation SearchWordViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"查词";
	self.tableView.estimatedRowHeight = 75;
	self.tableView.rowHeight = UITableViewAutomaticDimension;
	RAC(self.viewModel,keyWord) = self.searchField.rac_textSignal;
	
	[RACObserve(self.viewModel, wordsArray) subscribeNext:^(id  _Nullable x) {
		[self.tableView reloadData];
	}];
	
	
	
    // Do any additional setup after loading the view.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
	return self.viewModel.wordsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
	SearchWordCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchWordCell"];
	SearchWord *model = self.viewModel.wordsArray[indexPath.row];
	cell.wordLabel.text = model.key;
	NSMutableString *meansStr = [NSMutableString string];
	for (WordProperty *property in model.means) {
		NSMutableString *str = [NSMutableString string];
		for (NSString *mean in property.means) {
			[str appendString:mean];
		}
		
		[meansStr appendFormat:@"%@ %@  ",property.part,[str copy]];
	}
	cell.meansLabel.text = [meansStr copy];
	return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	SearchWord *model = self.viewModel.wordsArray[indexPath.row];
	[self.viewModel goToWordDetailView:model];
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

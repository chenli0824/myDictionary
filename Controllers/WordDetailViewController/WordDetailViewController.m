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

@end

@implementation WordDetailViewController
@dynamic viewModel;
- (void)viewDidLoad {
    [super viewDidLoad];
	[SVProgressHUD show];
	[[self.viewModel.fetchDetailCommand execute:nil] subscribeNext:^(id  _Nullable x) {
		[SVProgressHUD dismiss];
	}];
//	[[self.viewModel.fetchDetailCommand executionSignals] subscribeNext:^(RACSignal *signal) {
//		[SVProgressHUD show];
//		[signal subscribeNext:^(id  _Nullable x) {
//			[SVProgressHUD dismiss];
//		}];
//	}];
    // Do any additional setup after loading the view.
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

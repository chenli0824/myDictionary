//
//  TabBarViewController.m
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "TabBarViewController.h"
#import "DictionaryServiceImpl.h"
#import "SearchWordViewModel.h"
#import "SearchWordViewController.h"

@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	SearchWordViewModel *viewModel = [[SearchWordViewModel alloc] initWithService:[[DictionaryServiceImpl alloc] init]];
	SearchWordViewController *searchWordView = [[SearchWordViewController alloc] initWithStoryboard:@"Main" identifier:NSStringFromClass(SearchWordViewController.class) viewModel:viewModel];
	self.viewControllers = @[searchWordView];
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

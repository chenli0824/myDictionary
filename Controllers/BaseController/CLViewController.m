//
//  CLViewController.m
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "CLViewController.h"

@interface CLViewController ()
@property (nonatomic,strong,readwrite) id viewModel;
@end

@implementation CLViewController

-(instancetype)initWithViewModel:(id)viewModel{
	return [self initWithStoryboard:nil identifier:nil viewModel:viewModel];
}

-(instancetype)initWithStoryboard:(NSString *)storyboard_name identifier:(NSString *)indentifier_ viewModel:(id)viewModel_{
	UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:storyboard_name bundle:nil];
	self = [storyBoard instantiateViewControllerWithIdentifier:indentifier_];
	
	if (!self) {
		self = [super init];
	}
	_viewModel = viewModel_;
	return self;
}

-(instancetype)initWithNib:(NSString *)nib_name viewModel:(id)viewModel_{
	self = [super initWithNibName:nib_name bundle:nil];
	if (self) {
		_viewModel = viewModel_;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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

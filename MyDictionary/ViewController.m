//
//  ViewController.m
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "ViewController.h"
#import "DictionaryServiceImpl.h"
#import "SearchWord.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
//	DictionaryServiceImpl *serviceImpl = [[DictionaryServiceImpl alloc] init];
//	[[serviceImpl searchWord:@"china"] subscribeNext:^(id _Nullable value) {
//		NSArray *array = [MTLJSONAdapter modelsOfClass:SearchWord.class fromJSONArray:value error:nil];
//		NSLog(@"%@",array);
//		
//	} error:^(NSError * _Nullable error) {
//		NSLog(@"%@",error);
//	}];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}


@end

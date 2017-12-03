//
//  SearchWordViewModel.m
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "SearchWordViewModel.h"
#import "DictionaryServiceImpl.h"
#import "SearchWord.h"
#import "WordDetailViewModel.h"
#import "WordDetailViewController.h"

@interface SearchWordViewModel()
@property(nonatomic,strong,readwrite) NSArray *wordsArray;
@property(nonatomic,strong) DictionaryServiceImpl *serviceImpl;
@end

@implementation SearchWordViewModel

-(instancetype)initWithService:(id<DictionaryService>)service{
	self = [super init];
	if (self) {
		_keyWord = @"";
		_serviceImpl = (DictionaryServiceImpl *)service;
		[self initialize];
	}
	return self;
}

-(void)initialize{
	_fetchWordCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
		return [self executeSearchWord];
	}];
	
	@weakify(self)
	[RACObserve(self, keyWord) subscribeNext:^(id  _Nullable x) {
		@strongify(self)
		[self.fetchWordCommand execute:nil];
	}];
}

-(RACSignal *)executeSearchWord{
	return [[self.serviceImpl searchWord:self.keyWord] doNext:^(NSArray *array) {
		self.wordsArray = [MTLJSONAdapter modelsOfClass:SearchWord.class 
																			fromJSONArray:array 
																							error:nil];
	}];
}

-(void)goToWordDetailView:(SearchWord *)model{
	WordDetailViewModel *detailViewModel = [[WordDetailViewModel alloc] initWithService:self.serviceImpl wordModel:model];
	WordDetailViewController *detailViewController = [[WordDetailViewController alloc] initWithStoryboard:@"Main" identifier:NSStringFromClass(WordDetailViewController.class) viewModel:detailViewModel];
	[[self.serviceImpl getNavigationController] pushViewController:detailViewController animated:YES];
}
@end

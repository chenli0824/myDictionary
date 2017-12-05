//
//  WordDetailViewModel.m
//  MyDictionary
//
//  Created by chenli on 03/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "WordDetailViewModel.h"
#import "DictionaryServiceImpl.h"
#import "SearchWord.h"

@interface WordDetailViewModel()
@property(nonatomic,strong) DictionaryServiceImpl *serviceImpl;
@property(nonatomic,strong) SearchWord *wordModel;
@property(nonatomic,strong,readwrite) WordDetailInfo *detailInfo;

@end

@implementation WordDetailViewModel

-(instancetype)initWithService:(id<DictionaryService>)service{
	return [self initWithService:service wordModel:nil];
}

-(instancetype)initWithService:(id<DictionaryService>)service wordModel:(SearchWord *)model{
	self = [super init];
	if (self) {
		_serviceImpl = (DictionaryServiceImpl *)service;
		_wordModel = model;
		[self initialize];
	}
	return self;
}

-(void)initialize{
	@weakify(self)
	_fetchDetailCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
		@strongify(self)
		return [self executeFetchWordDetail];
	}];
}

-(RACSignal *)executeFetchWordDetail{
	return [[self.serviceImpl fetchWordDetail:self.wordModel.key] doNext:^(NSDictionary *value) {
		NSError *error;
		self.detailInfo = [MTLJSONAdapter modelOfClass:WordDetailInfo.class 
																fromJSONDictionary:value
																						 error:&error];
		if (error) {
			NSLog(@"%@",error);
		}
	}];
}

@end

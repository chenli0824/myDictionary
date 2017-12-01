//
//  DictionaryServiceImpl.m
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "DictionaryServiceImpl.h"
#import "CLClient.h"

@interface DictionaryServiceImpl()
@property (nonatomic,strong) CLClient *client;
@end

@implementation DictionaryServiceImpl

-(instancetype)init{
	self = [super init];
	if (self) {
		_client = [[CLClient alloc] init];
	}
	return self;
}

-(RACSignal *)searchWord:(NSString *)word{
	NSDictionary *parameters = @{@"c":@"word",
															 @"m":@"getsuggest",
															 @"nums":@"10",
															 @"timestamp":[NSString stringWithFormat:@"%ld",[[NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]] integerValue]],
															 @"client":@"6",
															 @"is_need_mean":@"1",
															 @"word":word
															 };
	NSMutableURLRequest *request = [self.client requestWithMethod:@"GET" path:nil parameters:parameters];
	return [self.client enqueueRequest:request resultKey:@"message"];
}

@end

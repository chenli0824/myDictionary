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
@property (nonatomic,strong) UINavigationController *navigationController;
@end

@implementation DictionaryServiceImpl

-(instancetype)init{
	return [self initWithNavigationController:nil];
}

-(instancetype)initWithNavigationController:(UINavigationController *)navigationControl{
	self = [super init];
	if (self) {
		_client = [[CLClient alloc] init];
		_navigationController = navigationControl;
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


-(RACSignal *)fetchWordDetail:(NSString *)word{
//	@"1,2,3,4,5,8,9,10,12,13,14,15,18,21,22,24,3003,3004,3005"
	NSDictionary *parameters = @{
															 @"a":@"getWordMean",
															 @"c":@"search",
															 @"list":@"1,15",
															 @"word":word
															 };
	NSMutableURLRequest *request = [self.client.requestSerializer requestWithMethod:@"GET" URLString:@"http://www.iciba.com/index.php" parameters:parameters error:nil];
	return [self.client enqueueRequest:request resultKey:nil];
}

-(UINavigationController *)getNavigationController{
	return _navigationController;
}
@end

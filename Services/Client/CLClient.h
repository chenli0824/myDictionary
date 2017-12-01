//
//  CLClient.h
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLClient : AFHTTPSessionManager

@property (nonatomic,strong,readonly) NSURL *apiEndpoint;

+(instancetype)sharedClient;

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method path:(NSString *)path parameters:(id)parameters;
-(NSMutableURLRequest *)multipartFormRequestWithMethod:(NSString *)method path:(NSString *)path parameters:(id)parameters files:(NSArray *)filesArray;

- (RACSignal *)enqueueRequest:(NSURLRequest *)request resultKey:(NSString *)key;

@end

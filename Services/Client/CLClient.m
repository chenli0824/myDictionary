//
//  CLClient.m
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "CLClient.h"

#if DEBUG

NSString *const BSAServerDotComAPIEndpoint = @"http://dict-mobile.iciba.com";
NSString *const BSAServerDotComBaseWebURL = @"https://www.qiantongyun.cn";
NSString *const BSAServerAPIEndpointPathComponent = @"interface/index.php";
NSString *const BSAServerBaseWebPathComponent = @"html";

#else

NSString *const BSAServerDotComAPIEndpoint = @"https://szcg.qiantongyun.cn";
NSString *const BSAServerDotComBaseWebURL = @"https://szcg.qiantongyun.cn";
NSString *const BSAServerAPIEndpointPathComponent = @"api";
NSString *const BSAServerBaseWebPathComponent = @"html";

#endif

@implementation CLClient

+(instancetype)sharedClient{
	static id client;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		client = [[self alloc] init];
	});
	return client;
}

- (instancetype)init{
	_apiEndpoint = [[NSURL URLWithString:BSAServerDotComAPIEndpoint] URLByAppendingPathComponent:BSAServerAPIEndpointPathComponent];
	self = [super initWithBaseURL:[NSURL URLWithString:_apiEndpoint.absoluteString]];
	if (self) {
		self.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", @"text/json" ,@"text/javascript",@"text/html;charset=UTF-8",@"text/plain", nil];
	}
	
	return self;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method path:(NSString *)path parameters:(id)parameters {
	NSURL *URL = nil;
	if (path) {
		URL = [self.baseURL URLByAppendingPathComponent:path];
	}
	else{
		URL = self.apiEndpoint;
	}

	NSError *requestError;
	NSMutableURLRequest *request = [self.requestSerializer requestWithMethod:method URLString:URL.absoluteString parameters:parameters error:&requestError];
	if (requestError) {
		NSLog(@"Request Error:%@",requestError);
	}
//	request.allHTTPHeaderFields = @{@"token":[GlobalData sharedInstance].loginData.token};
//	if (NSProcessInfo.processInfo.environment[OCClientResponseLoggingEnvironmentKey] != nil) {
//		NSData *data = request.HTTPBody;
//		DLog(@"HTTPBody: %@ parameters:%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding], [parameters description]);
//	}
	
	return request;
}


-(NSMutableURLRequest *)multipartFormRequestWithMethod:(NSString *)method path:(NSString *)path parameters:(id)parameters files:(NSArray *)filesArray{
	NSURL *URL = [self.baseURL URLByAppendingPathComponent:path];
	NSMutableURLRequest *request = [self.requestSerializer multipartFormRequestWithMethod:method URLString:URL.absoluteString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
		NSInteger nameTag = 1;
		for (id file in filesArray) {
			if ([file isKindOfClass:[UIImage class]]) {
				[formData appendPartWithFileData:UIImageJPEGRepresentation(file, 0.8)
																		name:@"file"
																fileName:[NSString stringWithFormat:@"%ld.jpg",nameTag] mimeType:@"images/jpeg"];
				nameTag++;
			}
		}
	} error:nil];
	
//	if (NSProcessInfo.processInfo.environment[OCClientResponseLoggingEnvironmentKey] != nil) {
//		NSData *data = request.HTTPBody;
//		DLog(@"HTTPBody: %@ parameters:%@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding], [parameters description]);
//	}
	
	return request;
}


- (RACSignal *)enqueueRequest:(NSURLRequest *)request {
	
	RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
		NSURLSessionDataTask *dataTask = [self dataTaskWithRequest:request
																						 completionHandler:^(NSURLResponse *response, id responseObject, NSError *error)
																			{
																				if (error) {
																					[subscriber sendError:error];
																				} else if ([(NSHTTPURLResponse *)response statusCode] != 200) {
																					[subscriber sendError:[NSError errorWithDomain:request.URL.path code:[responseObject[@"code"] integerValue] userInfo:@{@"message":responseObject[@"message"]}]];
																				} else {
																					[[RACSignal return:RACTuplePack(response, responseObject)] subscribe:subscriber];
																					[subscriber sendCompleted];
																					return;
																				}
																			}];
		[dataTask resume];
		return [RACDisposable disposableWithBlock:^{
			[dataTask cancel];
		}];
	}];
	
	return signal;
}

- (RACSignal *)enqueueRequest:(NSURLRequest *)request resultKey:(NSString *)key{
	return [[[self enqueueRequest:request] reduceEach:^id((NSHTTPURLResponse *respone, id responseObject)){
		if ([responseObject isKindOfClass:[UIImage class]]) {
			return [RACSignal return:responseObject];
		}
		return [self formatJSONData:responseObject elementKey:key];
	}] concat];
}

- (RACSignal *)formatJSONData:(id)responseObject elementKey:(NSString *)key{
	return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
		if ([responseObject isKindOfClass:[NSDictionary class]]) {
			if (!responseObject[key] && key!=nil) {
				[subscriber sendError:[NSError errorWithDomain:@"Invalid JSON array element" code:501 userInfo:nil]];
			}
			else{
				if (key) {
					[subscriber sendNext:responseObject[key]];
					[subscriber sendCompleted];
				}
				else{
					[subscriber sendNext:responseObject];
					[subscriber sendCompleted];
				}
				
			}
		} else {
			[subscriber sendError:[NSError errorWithDomain:@"Invalid JSON" code:500 userInfo:nil]];
		}
		
		return nil;
	}];
}

@end

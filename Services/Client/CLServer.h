//
//  CLServer.h
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLServer : NSObject
@property (nonatomic, copy, readonly) NSURL *baseURL;
@property (nonatomic, copy, readonly) NSURL *APIEndpoint;
@property (nonatomic, copy, readonly) NSURL *baseWebURL;
//
//+ (instancetype)serverWithBaseURL:(NSURL *)URL;
//+ (instancetype)dotComServer;

@end

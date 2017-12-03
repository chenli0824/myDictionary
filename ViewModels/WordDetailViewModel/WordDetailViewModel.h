//
//  WordDetailViewModel.h
//  MyDictionary
//
//  Created by chenli on 03/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DictionaryService.h"
@class SearchWord;

@interface WordDetailViewModel : NSObject
@property(nonatomic,strong,readonly) RACCommand *fetchDetailCommand;

-(instancetype)initWithService:(id<DictionaryService>)service;
-(instancetype)initWithService:(id<DictionaryService>)service wordModel:(SearchWord *)model;
@end

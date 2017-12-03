//
//  SearchWordViewModel.h
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DictionaryService.h"
@class SearchWord;

@interface SearchWordViewModel : NSObject
@property(nonatomic,strong,readonly) NSArray *wordsArray;
@property(nonatomic,strong,readonly) NSString *keyWord;
@property(nonatomic,strong,readonly) RACCommand *fetchWordCommand;
-(instancetype)initWithService:(id<DictionaryService>)service;

-(void)goToWordDetailView:(SearchWord *)model;
@end

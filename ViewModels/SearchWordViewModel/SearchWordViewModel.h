//
//  SearchWordViewModel.h
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DictionaryService.h"
@interface SearchWordViewModel : NSObject
-(instancetype)initWithService:(id<DictionaryService>)service;
@property(nonatomic,strong,readonly) NSArray *wordsArray;
@property(nonatomic,strong,readonly) NSString *keyWord;
@property(nonatomic,strong,readonly) RACCommand *fetchWordCommand;
@end

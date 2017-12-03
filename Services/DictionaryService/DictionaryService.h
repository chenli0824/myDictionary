//
//  DictionaryService.h
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DictionaryService <NSObject>


/**
 搜索单词

 @param word 单词
 @return RACSignal
 */
-(RACSignal *)searchWord:(NSString *)word;


/**
 查询单词详情

 @param word 单词
 @return RACSignal
 */
-(RACSignal *)fetchWordDetail:(NSString *)word;

-(UINavigationController *)getNavigationController;
@end

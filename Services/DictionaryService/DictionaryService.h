//
//  DictionaryService.h
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DictionaryService <NSObject>

-(RACSignal *)searchWord:(NSString *)word;
@end

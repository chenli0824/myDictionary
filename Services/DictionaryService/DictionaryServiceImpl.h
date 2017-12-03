//
//  DictionaryServiceImpl.h
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DictionaryService.h"
@interface DictionaryServiceImpl : NSObject<DictionaryService>

-(instancetype)initWithNavigationController:(UINavigationController *)navigationControl;

@end

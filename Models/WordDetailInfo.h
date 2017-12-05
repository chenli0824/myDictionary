//
//  WordDetailInfo.h
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "BaseInfo.h"
#import "Stemsaffixes.h"
@interface WordDetailInfo : MTLModel<MTLJSONSerializing>
@property (nonatomic,strong,readonly) NSString *errmsg;
@property (nonatomic,strong,readonly) NSNumber *_word_flag;
@property (nonatomic,strong,readonly) BaseInfo *baesInfo;
@property (nonatomic,strong,readonly) NSArray<Stemsaffixes *> *stems_affixes;
@property (nonatomic,strong,readonly) NSArray<NSString *> *exchanges;
@end

//
//  Stemsaffixes.h
//  MyDictionary
//
//  Created by chenli on 03/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Mantle/Mantle.h>
@interface WordValue : MTLModel<MTLJSONSerializing>
@property(nonatomic,strong,readonly) NSString *value_en;
@property(nonatomic,strong,readonly) NSString *value_cn;
@property(nonatomic,strong,readonly) NSString *word_buile;
@end


@interface Stemsaffixes : MTLModel<MTLJSONSerializing>
@property(nonatomic,strong,readonly) NSString *type;
@property(nonatomic,strong,readonly) NSString *type_value;
@property(nonatomic,strong,readonly) NSString *type_exp;
@property(nonatomic,strong,readonly) NSArray<WordValue *> *word_parts;
@end

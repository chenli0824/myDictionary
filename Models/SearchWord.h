//
//  SearchWord.h
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface WordProperty : MTLModel<MTLJSONSerializing>
@property (nonatomic,strong,readonly) NSString *part;
@property (nonatomic,strong,readonly) NSArray *means;
@end

@interface SearchWord : MTLModel<MTLJSONSerializing>
@property(nonatomic,strong,readonly) NSString *key;
@property(nonatomic,assign,readonly) NSInteger value;
@property(nonatomic,strong,readonly) NSArray<WordProperty *> *means;

@end

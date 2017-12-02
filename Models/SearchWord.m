//
//  SearchWord.m
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "SearchWord.h"

@implementation WordProperty
+(NSDictionary *)JSONKeyPathsByPropertyKey{
	return [NSDictionary mtl_identityPropertyMapWithModel:self];
}
@end
@implementation SearchWord
+(NSDictionary *)JSONKeyPathsByPropertyKey{
	return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

+(NSValueTransformer *)meansJSONTransformer{
	return [MTLJSONAdapter arrayTransformerWithModelClass:WordProperty.class];
}
@end

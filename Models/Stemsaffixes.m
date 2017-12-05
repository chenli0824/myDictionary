//
//  Stemsaffixes.m
//  MyDictionary
//
//  Created by chenli on 03/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "Stemsaffixes.h"
@implementation WordValue
+(NSDictionary *)JSONKeyPathsByPropertyKey{
	return [NSDictionary mtl_identityPropertyMapWithModel:self];
}
@end

@implementation Stemsaffixes
+(NSDictionary *)JSONKeyPathsByPropertyKey{
	return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

+(NSValueTransformer *)word_partsJSONTransformer{
	return [MTLJSONAdapter arrayTransformerWithModelClass:WordValue.class];
}
@end

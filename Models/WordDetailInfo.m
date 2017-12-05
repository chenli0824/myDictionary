//
//  WordDetailInfo.m
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "WordDetailInfo.h"

@implementation WordDetailInfo
+(NSDictionary *)JSONKeyPathsByPropertyKey{
	return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

+(NSValueTransformer *)baesInfoJSONTransformer{
	return [MTLJSONAdapter dictionaryTransformerWithModelClass:BaseInfo.class];
}

+(NSValueTransformer *)stems_affixesJSONTransformer{
	return [MTLJSONAdapter arrayTransformerWithModelClass:Stemsaffixes.class];
}
@end

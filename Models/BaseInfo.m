//
//  BaseInfo.m
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "BaseInfo.h"

@implementation Exchange
+(NSDictionary *)JSONKeyPathsByPropertyKey{
	return [NSDictionary mtl_identityPropertyMapWithModel:self];
}
@end

@implementation Symbols
+(NSDictionary *)JSONKeyPathsByPropertyKey{
	return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

+(NSValueTransformer *)partsJSONTransformer{
	return [MTLJSONAdapter arrayTransformerWithModelClass:WordProperty.class];
}
@end

@implementation BaseInfo
+(NSDictionary *)JSONKeyPathsByPropertyKey{
	return [NSDictionary mtl_identityPropertyMapWithModel:self];
}

+(NSValueTransformer *)exchangeJSONTransformer{
	return [MTLJSONAdapter transformerForModelPropertiesOfClass:Exchange.class];
}

+(NSValueTransformer *)symbolsJSONTransformer{
	return [MTLJSONAdapter transformerForModelPropertiesOfClass:Symbols.class];
}
@end

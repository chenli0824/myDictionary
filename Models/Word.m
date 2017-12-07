//
//  Word.m
//  MyDictionary
//
//  Created by chenli on 07/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import "Word.h"

@implementation Word
+(NSArray *)requiredProperties{
	return @[@"dictionary",@"word"];
}
+(NSString *)primaryKey{
	return @"word";
}
+(NSArray *)indexedProperties{
	return @[@"word"];
}
+(NSDictionary *)defaultPropertyValues{
	return @{@"repeat_count":@0};
}
@end

@implementation Dictionary
+(NSString *)primaryKey{
	return @"name";
}
+(NSArray *)requiredProperties{
	return @[@"name"];
}
+(NSDictionary *)defaultPropertyValues{
	return @{@"defaultDict":@0};
}
@end

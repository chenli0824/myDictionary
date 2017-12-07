//
//  Word.h
//  MyDictionary
//
//  Created by chenli on 07/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Realm/Realm.h>
@class Dictionary;

@interface Word : RLMObject
@property(nonatomic,strong) NSString *word;
@property(nonatomic,assign) NSInteger repeat_count;
@property(nonatomic,strong) Dictionary *dictionary;
@end
RLM_ARRAY_TYPE(Word)

@interface Dictionary : RLMObject
@property (nonatomic,strong) NSString *name;
@property (nonatomic,assign) BOOL defaultDict;
@property (nonatomic,strong) RLMArray<Word *><Word> *words;
@end

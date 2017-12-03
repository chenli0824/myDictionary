//
//  BaseInfo.h
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "SearchWord.h"

@interface Exchange : MTLModel<MTLJSONSerializing>
@property(nonatomic,strong,readonly) NSArray *word_pl;
@property(nonatomic,strong,readonly) NSArray *word_third;
@property(nonatomic,strong,readonly) NSArray *word_past;
@property(nonatomic,strong,readonly) NSArray *word_done;
@property(nonatomic,strong,readonly) NSArray *word_ing;
@property(nonatomic,strong,readonly) NSArray *word_er;
@property(nonatomic,strong,readonly) NSArray *word_est;
@property(nonatomic,strong,readonly) NSArray *word_prep;
@property(nonatomic,strong,readonly) NSArray *word_adv;
@property(nonatomic,strong,readonly) NSArray *word_verb;
@property(nonatomic,strong,readonly) NSArray *word_noun;
@property(nonatomic,strong,readonly) NSArray *word_adj;
@property(nonatomic,strong,readonly) NSArray *word_conn;
@end


@interface Symbols : MTLModel<MTLJSONSerializing>
@property(nonatomic,strong,readonly) NSString *ph_en;
@property(nonatomic,strong,readonly) NSString *ph_am;
@property(nonatomic,strong,readonly) NSString *ph_other;
@property(nonatomic,strong,readonly) NSURL *ph_en_mp3;
@property(nonatomic,strong,readonly) NSURL *ph_am_mp3;
@property(nonatomic,strong,readonly) NSURL *ph_tts_mp3;
@property(nonatomic,strong,readonly) NSArray<WordProperty *> *parts;
@end

@interface BaseInfo : MTLModel<MTLJSONSerializing>
@property(nonatomic,strong,readonly) NSString *word_name;
@property(nonatomic,strong,readonly) NSNumber *translate_type;
@property(nonatomic,strong,readonly) Exchange *exchange;
@property(nonatomic,strong,readonly) Symbols *symbols;
@end

//
//  BaseController.h
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BaseController <NSObject>

@property (nonatomic,readonly) id viewModel;

-(instancetype)initWithViewModel:(id)viewModel;
-(instancetype)initWithStoryboard:(NSString *)storyboard_name identifier:(NSString *)indentifier_ viewModel:(id)viewModel_;
-(instancetype)initWithNib:(NSString *)nib_name viewModel:(id)viewModel_;

@end

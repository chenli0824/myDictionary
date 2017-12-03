//
//  WordDetailViewController.h
//  MyDictionary
//
//  Created by chenli on 03/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLViewController.h"
#import "WordDetailViewModel.h"

@interface WordDetailViewController : CLViewController
@property(nonatomic,strong) WordDetailViewModel *viewModel;
@end

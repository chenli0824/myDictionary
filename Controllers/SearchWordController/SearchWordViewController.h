//
//  SearchWordViewController.h
//  MyDictionary
//
//  Created by chenli on 02/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLViewController.h"
#import "SearchWordViewModel.h"
@interface SearchWordViewController : CLViewController
@property (nonatomic,strong) SearchWordViewModel *viewModel;
@end

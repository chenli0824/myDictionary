//
//  AppDelegate.h
//  MyDictionary
//
//  Created by chenli on 01/12/2017.
//  Copyright © 2017 chenli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


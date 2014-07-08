//
//  LE_AppDelegate.h
//  Coupon
//
//  Created by 蓝尔科技 on 14-7-2.
//  Copyright (c) 2014年 蓝尔科技. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LEAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;



@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

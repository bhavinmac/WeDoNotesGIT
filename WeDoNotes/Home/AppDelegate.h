//
//  AppDelegate.h
//  WeDoNotes
//
//  Created by BMAC Info Tech on 15/08/13.
//  Copyright (c) 2013 Jigs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@class MBProgressHUD;
@class LoginVC;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MBProgressHUD *HUD;
}
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navMain;
@property (strong, nonatomic) LoginVC *vcLogin;


+(AppDelegate *)sharedAppDelegate;

-(void) showHUDLoadingView:(NSString *)strTitle;
-(void) hideHUDLoadingView;
-(void)showToastMessage:(NSString *)message;

- (void)saveContext;

@end

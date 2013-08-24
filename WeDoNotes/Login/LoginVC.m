//
//  LoginVC.m
//  WeDoNotes
//
//  Created by BMAC Info Tech on 21/08/13.
//  Copyright (c) 2013 Jigs. All rights reserved.
//

#import "LoginVC.h"
#import "WeDoNotesVC.h"

#import <Parse/PF_FBRequest.h>

@interface LoginVC ()

@end

@implementation LoginVC

#pragma mark
#pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark
#pragma mark - ViewLife Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=TRUE;
}

#pragma mark
#pragma mark - Actions Methods

-(IBAction)onClickFBLogin:(id)sender
{
    [[AppDelegate sharedAppDelegate]showHUDLoadingView:@"Login..."];
    NSArray *permissions = [[NSArray alloc] initWithObjects:@"user_birthday",@"email", @"publish_stream", @"offline_access",@"publish_actions",  @"user_location",  @"user_hometown",  @"user_about_me", @"user_relationships",@"user_address",@"user_relationships", nil];
    
    [PFFacebookUtils logInWithPermissions:permissions block:^(PFUser *user, NSError *error){
        [[AppDelegate sharedAppDelegate]hideHUDLoadingView];
        if (!user) {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        }
        else if (user.isNew){
            /*
            NSLog(@"User signed up and logged in through Facebook!");
            WeDoNotesVC *vcWeDoNotes=[[WeDoNotesVC alloc]initWithNibName:@"WeDoNotesVC" bundle:nil];
            [UtilityClass sharedObject].loginType=FBLogin;
            [self.navigationController pushViewController:vcWeDoNotes animated:YES];
            [vcWeDoNotes release];
             */
        }
        else {
            /*
            NSLog(@"User logged in through Facebook!");
            WeDoNotesVC *vcWeDoNotes=[[WeDoNotesVC alloc]initWithNibName:@"WeDoNotesVC" bundle:nil];
            [UtilityClass sharedObject].loginType=FBLogin;
            [self.navigationController pushViewController:vcWeDoNotes animated:YES];
            [vcWeDoNotes release];
             */
            [self setUserName:user];
        }
    }];
}

-(void)setUserName:(PFUser *)user
{
    
    PF_FBRequest *request = [PF_FBRequest requestForMe];

    [request startWithCompletionHandler:^(PF_FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            NSDictionary *userData = (NSDictionary *)result;
            NSString *name = userData[@"name"];
            [[PFUser currentUser] setObject:name forKey:@"displayName"];
            [[PFUser currentUser] saveEventually];
        }
        WeDoNotesVC *vcWeDoNotes=[[WeDoNotesVC alloc]initWithNibName:@"WeDoNotesVC" bundle:nil];
        [UtilityClass sharedObject].loginType=FBLogin;
        [self.navigationController pushViewController:vcWeDoNotes animated:YES];
        [vcWeDoNotes release];
    }];
    /*
    // Send request to Facebook
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            // result is a dictionary with the user's Facebook data
            NSDictionary *userData = (NSDictionary *)result;
            
            NSString *facebookID = userData[@"id"];
            NSString *name = userData[@"name"];
            //NSString *location = userData[@"location"][@"name"];
            //NSString *gender = userData[@"gender"];
           // NSString *birthday = userData[@"birthday"];
            //NSString *relationship = userData[@"relationship_status"];
            
            //NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
            
            // Now add the data to the UI elements
            // ...
        }
    }];
   */
}

-(IBAction)onClickNoLogin:(id)sender
{
    WeDoNotesVC *vcWeDoNotes=[[WeDoNotesVC alloc]initWithNibName:@"WeDoNotesVC" bundle:nil];
    [UtilityClass sharedObject].loginType=NoLogin;
    [self.navigationController pushViewController:vcWeDoNotes animated:YES];
    [vcWeDoNotes release];
}

#pragma mark
#pragma mark - Memory Mgmt

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)dealloc
{
    [super dealloc];
}

@end

/*
 
 - (void)viewDidLoad {
 // ...
 // Create request for user's Facebook data
 FBRequest *request = [FBRequest requestForMe];
 
 // Send request to Facebook
 [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
 if (!error) {
 // result is a dictionary with the user's Facebook data
 NSDictionary *userData = (NSDictionary *)result;
 
 NSString *facebookID = userData[@"id"];
 NSString *name = userData[@"name"];
 NSString *location = userData[@"location"][@"name"];
 NSString *gender = userData[@"gender"];
 NSString *birthday = userData[@"birthday"];
 NSString *relationship = userData[@"relationship_status"];
 
 NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
 
 // Now add the data to the UI elements
 // ...
 }
 }];
 }
 
 */

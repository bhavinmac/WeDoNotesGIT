//
//  LoginVC.h
//  WeDoNotes
//
//  Created by BMAC Info Tech on 21/08/13.
//  Copyright (c) 2013 Jigs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginVC : UIViewController<PF_FBRequestDelegate>
{
    
}

-(IBAction)onClickFBLogin:(id)sender;
-(IBAction)onClickNoLogin:(id)sender;

@end

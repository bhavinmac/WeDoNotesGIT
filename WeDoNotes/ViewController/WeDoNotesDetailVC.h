//
//  WeDoNotesDetailVC.h
//  WeDoNotes
//
//  Created by BMAC Info Tech on 21/08/13.
//  Copyright (c) 2013 Jigs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Notes;
@interface WeDoNotesDetailVC : UIViewController
{
    Notes *note;
}
@property(nonatomic,strong)IBOutlet UITextView *txtNote;
@property(nonatomic,strong)IBOutlet UIToolbar *toolNote;

@property(nonatomic,retain)Notes *note;

-(IBAction)onClickClear:(id)sender;
-(IBAction)onClickDone:(id)sender;
-(IBAction)onClickDoneNote:(id)sender;

@end

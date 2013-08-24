//
//  WeDoNotesDetailVC.m
//  WeDoNotes
//
//  Created by BMAC Info Tech on 21/08/13.
//  Copyright (c) 2013 Jigs. All rights reserved.
//

#import "WeDoNotesDetailVC.h"
#import "Notes.h"

@interface WeDoNotesDetailVC ()

@end

@implementation WeDoNotesDetailVC

@synthesize txtNote=_txtNote,toolNote=_toolNote;
@synthesize note;

#pragma mark -
#pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

#pragma mark -
#pragma mark - ViewLife Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onClickDoneNote:)]autorelease];
    self.txtNote.inputAccessoryView=self.toolNote;
    if (note) {
        self.txtNote.text=note.desc;
        self.title=note.desc;
    }
    else{
        self.title=@"New";
    }
}

#pragma mark -
#pragma mark - Actions Methods

-(IBAction)onClickClear:(id)sender
{
    self.txtNote.text=@"";
    [self.txtNote resignFirstResponder];
}
-(IBAction)onClickDone:(id)sender
{
    [self.txtNote resignFirstResponder];
}

-(IBAction)onClickDoneNote:(id)sender
{
    if (!note) {
        note=(Notes *)[[DBHelper sharedObject]createObjectForEntity:EntityNotes];
        note.dateOfCreate=[NSDate date];
    }
    note.title=self.txtNote.text;
    note.desc=self.txtNote.text;
    note.dateOfLastUpdate=[NSDate date];
    [[AppDelegate sharedAppDelegate]saveContext];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -
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

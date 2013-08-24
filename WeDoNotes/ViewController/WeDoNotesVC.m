//
//  WeDoNotesVC.m
//  WeDoNotes
//
//  Created by BMAC Info Tech on 21/08/13.
//  Copyright (c) 2013 Jigs. All rights reserved.
//

#import "WeDoNotesVC.h"
#import "SettingVC.h"
#import "WeDoNotesDetailVC.h"

#import "Notes.h"

@interface WeDoNotesVC ()

@end

@implementation WeDoNotesVC

@synthesize tblNotes=_tblNotes;

#pragma mark -
#pragma mark - Init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"WeDoNotes";
    }
    return self;
}

#pragma mark -
#pragma mark - ViewLife Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden=FALSE;
    self.navigationItem.hidesBackButton=TRUE;
    
    self.navigationItem.rightBarButtonItem=[[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onClickAdd:)]autorelease];
    
    self.navigationItem.leftBarButtonItem=[[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"btnSetting"] style:UIBarButtonItemStyleBordered target:self action:@selector(onClickSetting:)]autorelease];
    
    arrNotes=[[NSMutableArray alloc]init];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [arrNotes removeAllObjects];
    [arrNotes addObjectsFromArray:[[DBHelper sharedObject]getObjectsforEntity:EntityNotes ShortBy:@"dateOfLastUpdate" isAscending:NO]];
    [self.tblNotes reloadData];
}

#pragma mark -
#pragma mark - Actions Methods

-(void)onClickAdd:(id)sender
{
    self.navigationItem.backBarButtonItem=[[UtilityClass sharedObject]setBackbarButtonWithName:@"Notes"];
    WeDoNotesDetailVC *vcWeDoNotesDetail=[[WeDoNotesDetailVC alloc]initWithNibName:@"WeDoNotesDetailVC" bundle:nil];
    [self.navigationController pushViewController:vcWeDoNotesDetail animated:YES];
    [vcWeDoNotesDetail release];
}

-(void)onClickSetting:(id)sender
{
    self.navigationItem.backBarButtonItem=[[UtilityClass sharedObject]setBackbarButtonWithName:@"Back"];
    SettingVC *vcSetting=[[SettingVC alloc]initWithNibName:@"SettingVC" bundle:nil];
    [self.navigationController pushViewController:vcSetting animated:YES];
    [vcSetting release];
}

#pragma mark -
#pragma mark - TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [arrNotes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"MyCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    Notes *note=[arrNotes objectAtIndex:indexPath.row];
    cell.textLabel.text=note.desc;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    self.navigationItem.backBarButtonItem=[[UtilityClass sharedObject]setBackbarButtonWithName:@"Notes"];
    WeDoNotesDetailVC *vcWeDoNotesDetail=[[WeDoNotesDetailVC alloc]initWithNibName:@"WeDoNotesDetailVC" bundle:nil];
    vcWeDoNotesDetail.note=[arrNotes objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:vcWeDoNotesDetail animated:YES];
    [vcWeDoNotesDetail release];
}

#pragma mark -
#pragma mark - Memory Mgmt

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    [super dealloc];
}

@end

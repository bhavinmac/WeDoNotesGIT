//
//  WeDoNotesVC.h
//  WeDoNotes
//
//  Created by BMAC Info Tech on 21/08/13.
//  Copyright (c) 2013 Jigs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeDoNotesVC : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrNotes;
}
@property(nonatomic,strong)IBOutlet UITableView *tblNotes;

@end

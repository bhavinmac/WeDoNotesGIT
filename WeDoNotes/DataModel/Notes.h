//
//  Notes.h
//  WeDoNotes
//
//  Created by BMAC Info Tech on 24/08/13.
//  Copyright (c) 2013 Jigs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Notes : NSManagedObject

@property (nonatomic, retain) NSDate * createdAt;
@property (nonatomic, retain) NSDate * dateOfCreate;
@property (nonatomic, retain) NSDate * dateOfLastUpdate;
@property (nonatomic, retain) NSString * desc;
@property (nonatomic, retain) NSString * objectId;
@property (nonatomic, retain) NSNumber * syncStatus;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * updatedAt;

@end

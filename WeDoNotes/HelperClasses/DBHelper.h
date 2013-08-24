

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DBHelper : NSObject
{
  
}
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

+ (DBHelper *)sharedObject;

- (NSDate *)dateUsingStringFromAPI:(NSString *)dateString;
- (NSString *)dateStringForAPIUsingDate:(NSDate *)date;

-(id)createObjectForEntity:(NSString *)entityName;
-(NSMutableArray*)getObjectsforEntity:(NSString *)strEntity;
-(NSMutableArray*) getObjectsforEntity:(NSString *)strEntity ShortBy:(NSString *)strShort isAscending:(BOOL)ascending;
-(NSMutableArray*) getObjectsforEntity:(NSString *)strEntity ShortBy:(NSString *)strShort isAscending:(BOOL)ascending predicate:(NSPredicate *)predicate;

-(void) deleteObjectsForEntity:(NSString *)strEntity;
-(void)deleteObject:(NSManagedObject *)managedObject;

-(NSArray *)getShortListByKey:(NSString *)strKey;

-(NSUInteger) getObjectCountforEntity:(NSString *)strEntity;


-(void)resetCoredataforNewUser;


@end

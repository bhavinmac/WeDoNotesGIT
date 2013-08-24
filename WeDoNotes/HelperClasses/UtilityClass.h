
#import <Foundation/Foundation.h>



@interface UtilityClass : NSObject
{
    float fontSize;
    LoginType loginType;
}
@property(nonatomic,assign)float fontSize;
@property(nonatomic,assign)LoginType loginType;

//init
-(id) init;
+ (UtilityClass *)sharedObject;

//Distance convertion methods
-(double)meterToKilometer:(double)meter;
-(double)kilometerToMeter:(double)kilometer;
-(double)meterToMiles:(double)meter;
-(double)milesToMeter:(double)miles;
-(double)kilometerToMiles:(double)kilometer;
-(double)milesToKilometer:(double)miles;


//String Utillity Functions
-(NSString*) trimString:(NSString *)theString;
-(NSString *) removeNull:(NSString *) string;

//Directory Path Methods
- (NSString *)applicationDocumentDirectoryString;
- (NSString *)applicationCacheDirectoryString;
- (NSURL *)applicationDocumentsDirectoryURL;

//Scale and Rotate according to Orientation
- (UIImage *)scaleAndRotateImage:(UIImage *)image;

//Email Validation
-(BOOL)isValidEmailAddress:(NSString *)email;
-(BOOL)isvalidPassword:(NSString *)password;


//UserDefault helper

//Show Alert
-(void)showAlertWithTitle:(NSString *)strTitle andMessage:(NSString *)strMsg;

//datetime helper
- (NSDate *)stringToDate:(NSString *)dateString;
- (NSString *)DateToString:(NSDate *)date;
-(NSString *)DateToString:(NSDate *)date withFormate:(NSString *)format;
-(NSString *)DateToStringForScanQueue:(NSDate *)date;

//tableview helper
-(void)setTableViewHeightWithNoLine:(UITableView *)tbl;

//baritem helper
-(UIBarButtonItem *)setBackbarButtonWithName:(NSString *)strName;


@end

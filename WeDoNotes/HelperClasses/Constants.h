

typedef enum {
    NoLogin=0,
    FBLogin
} LoginType;

typedef enum {
    SyncStatusCreate=0,
    SyncStatusUpdate,
    SyncStatusDelete,
    SyncStatusSynced
} SyncStatus;

//Colors
#define COLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define COLOR_BACKGROUND [UIColor colorWithRed:(246.0/255) green:(255.0/255) blue:(255.0/255) alpha:1.0]
#define BackButtonColor [UIColor colorWithRed:(51.0/255) green:(153.0/255) blue:(204.0/255) alpha:1.0]
#define ColorCellSeprator [UIColor colorWithRed:(111.0/255) green:(168.0/255) blue:(93.0/255) alpha:1.0]
#define ColorLabelScore [UIColor colorWithRed:(255.0/255) green:(204.0/255) blue:(0.0/255) alpha:1.0]
#define ColorLabelSetting [UIColor colorWithRed:(255.0/255) green:(255.0/255) blue:(0.0/255) alpha:1.0]

//iPhone5 helper
#define isiPhone5 ([UIScreen mainScreen].bounds.size.height == 568.0)
#define ASSET_BY_SCREEN_HEIGHT(regular) (([[UIScreen mainScreen] bounds].size.height <= 480.0) ? regular : [regular stringByAppendingString:@"-568h"])



//Api Methods
#define METHOD_POST                     @"POST"
#define METHOD_GET                      @"GET"
#define METHOD_PUT                      @"PUT"

//Api Url

#define APIURL                          @""

//DateFormate
#define DateFormatScanQueue             @"dd. MMMM yyyy, hh:mm:ss a"//19th July 2013, 07:30:05 pm


//Fonts Helper
extern NSString *const FontRegular;
extern NSString *const FontBold;

//User Define Helper
extern NSString *const UDisAppInstalledFirstTime;

//CoreData Helper
extern NSString *const EntityNotes;


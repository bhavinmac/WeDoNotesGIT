

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

//typedef void (^DataBlock)(id response);

typedef void (^RequestCompletionBlock)(id response, NSError *error);


@interface httpHelper : NSObject<NSURLConnectionDelegate>
{
    NSMutableData *webData;

    //blocks
    /*
    DataBlock dataSuccessHandler;
    DataBlock dataFailHandler;
    */
    //for ASIRequest
    ASIFormDataRequest *ASIrequest;
    
    NSString *strReqMethod;
    
    //blocks
    RequestCompletionBlock dataBlock;
    
}
@property(nonatomic,copy)NSString *strReqMethod;

- (id) initWithRequestMethod:(NSString *)method;

-(void)getDataFromURL:(NSString *)url withBody:(NSMutableDictionary *)dictBody withBlock:(RequestCompletionBlock)block;

/*
-(void)getDataFromURL:(NSString *)url
          withReqData:(NSMutableDictionary *)dictReqData
         loginSuccess:(DataBlock)success
            loginFail:(DataBlock)fail;

-(void)getDataFromURL:(NSString *)url withParamData:(NSMutableDictionary *)dictParam getDataSuccess:(DataBlock)success getDataFail:(DataBlock)fail;
 */

@end

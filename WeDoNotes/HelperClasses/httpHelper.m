
#import "httpHelper.h"
#import "AppDelegate.h"
#import "JSON.h"

AppDelegate *appDelegate;

@implementation httpHelper

@synthesize strReqMethod;

#pragma mark -
#pragma mark - init methods

- (id) initWithRequestMethod:(NSString *)method
{   
	if ((self = [super init])) {
        self.strReqMethod=method;
        appDelegate=[AppDelegate sharedAppDelegate];
    }
	return self;
}

#pragma mark -
#pragma mark - ASIFormDataRequest

-(void)getDataFromURL:(NSString *)url withBody:(NSMutableDictionary *)dictBody withBlock:(RequestCompletionBlock)block
{
    [ASIFormDataRequest clearSession];
    NSURL *aURL = [NSURL URLWithString:url];
    ASIrequest = [ASIFormDataRequest requestWithURL:aURL];
    [ASIrequest setTimeOutSeconds:3000];
    //[ASIrequest setPostFormat:ASIURLEncodedPostFormat];
    [ASIrequest setRequestMethod:self.strReqMethod];
    
    [ASIrequest setUseCookiePersistence:NO];
    [ASIrequest setUseSessionPersistence:NO];
    [ASIrequest setShouldAttemptPersistentConnection:NO];
    
    if (block) {
        dataBlock=[block copy];
    }
    [ASIrequest addRequestHeader:@"Accept" value:@"application/json"];
    //[ASIrequest addRequestHeader:@"content-type" value:@"application/x-www-form-urlencoded"];
    
    if (dictBody) {
        SBJsonWriter *jsonWriter = [[SBJsonWriter alloc] init];
        NSString *jsonString = [jsonWriter stringWithObject:dictBody];
        [jsonWriter release];
        [ASIrequest setPostBody:[NSMutableData dataWithData:[jsonString  dataUsingEncoding:NSUTF8StringEncoding]]];
        NSLog(@"Post Body %@",jsonString);
    }
    
    [ASIrequest setDelegate:self];
    [ASIrequest startAsynchronous];
}

- (void)requestFinished:(ASIHTTPRequest *)request {
	
	NSString *receivedString = [request responseString];
    NSLog(@"requestFinished >> receivedString >> %@",receivedString);
    SBJSON *jsonParser = [[SBJSON alloc] init];
    NSMutableDictionary *dictData=[jsonParser objectWithString:receivedString error:nil];
    
    if(dataBlock)
    {
        dataBlock(dictData,nil);
    }
    
}
- (void)requestFailed:(ASIHTTPRequest *)request {
	
    if (dataBlock) {
        dataBlock(nil,request.error);
    }
}


#pragma mark -
#pragma mark - Memory Mgmt

- (void)dealloc
{
    [super dealloc];
}


/*
#pragma mark -
#pragma mark - ASIFormDataRequest

-(void)getDataFromURL:(NSString *)aURL withParamData:(NSMutableDictionary *)dictParam getDataSuccess:(DataBlock)success getDataFail:(DataBlock)fail
{
    [ASIFormDataRequest clearSession];
    NSURL *url = [NSURL URLWithString:aURL];
    ASIrequest = [ASIFormDataRequest requestWithURL:url];
    [ASIrequest setTimeOutSeconds:3000];
    [ASIrequest setPostFormat:ASIURLEncodedPostFormat];
    [ASIrequest setRequestMethod:self.strReqMethod];
    
    
    
    [ASIrequest setUseCookiePersistence:NO];
    [ASIrequest setUseSessionPersistence:NO];
    [ASIrequest setShouldAttemptPersistentConnection:NO];

    if(dictParam != nil) {
        NSArray *allKey = [dictParam allKeys];
        for(int i=0; i<[allKey count]; i++) {
            NSString *key = [allKey objectAtIndex:i];
            NSString *value =[dictParam valueForKey:key];
            
            [ASIrequest setPostValue:value forKey:key];
        }
    }
    [ASIrequest setDelegate:self];
    [ASIrequest startAsynchronous];
    
    if(success)
    {
        dataSuccessHandler = [success copy];
    }
    if(fail)
    {
        dataFailHandler = [fail copy];
    }
}


-(void)getDataFromURL:(NSString *)url
          withReqData:(NSMutableDictionary *)dictReqData
         loginSuccess:(DataBlock)success
            loginFail:(DataBlock)fail
{
    NSURL *aURL = [NSURL URLWithString:url];
    ASIrequest = [ASIFormDataRequest requestWithURL:aURL];
    [ASIrequest setTimeOutSeconds:3000];
    //    [requestMain setPostFormat:ASIMultipartFormDataPostFormat];
    [ASIrequest setRequestMethod:self.strReqMethod];
    [ASIrequest setUseCookiePersistence:NO];
    [ASIrequest setUseSessionPersistence:NO];
    [ASIrequest setShouldAttemptPersistentConnection:NO];
    
    if(dictReqData != nil) {        
        NSString *newData=[NSString stringWithFormat:@"data=%@",[dictReqData JSONRepresentation]];
        NSMutableData *requestData = [NSMutableData dataWithBytes:[newData UTF8String] length:[newData length]];
        [ASIrequest setPostBody:requestData];
    }
    
    [ASIrequest setDelegate:self];
    [ASIrequest startAsynchronous];
    
    if(success)
    {
        dataSuccessHandler = [success copy];
    }
    if(fail)
    {
        dataFailHandler = [fail copy];
    }
   
}

- (void)requestFinished:(ASIHTTPRequest *)request {
	
	NSString *receivedString = [request responseString];
    //NSLog(@"requestFinished >> receivedString >> %@",receivedString);
    SBJSON *jsonParser = [[SBJSON alloc] init];
    NSMutableDictionary *dictData=[jsonParser objectWithString:receivedString error:nil];
    
    if(dataSuccessHandler)
    {
        dataSuccessHandler(dictData);
    }

}
- (void)requestFailed:(ASIHTTPRequest *)request {
	
	//NSString *receivedString = [request responseString];
    request = nil;
    if(dataFailHandler)
    {
        dataFailHandler(request.error);
    }
}
*/

@end


/* //for image upload
 //if ([arrImages count] > 0) {
 NSData *dataImage = UIImageJPEGRepresentation([UIImage imageNamed:@""],1);
 
 NSString *strURL = @"Write Your URL Here.";
 ASIrequest = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:strURL]];
 
 [ASIrequest setTimeOutSeconds:3000];
 [ASIrequest setRequestMethod:@"POST"];
 [ASIrequest setUseCookiePersistence:NO];
 [ASIrequest setUseSessionPersistence:NO];
 [ASIrequest setShouldAttemptPersistentConnection:NO];
 
 [ASIrequest setDelegate:self];
 
 
 [ASIrequest setPostValue:@"This is sample text..." forKey:@"text"];
 
 
 //for (int i = 0; i < [arrImages count]; i++) {
 [ASIrequest addData:dataImage withFileName:@"image.jpg" andContentType:@"image/jpeg" forKey:@"image"];
 //}
 [ASIrequest startAsynchronous];
 //}
 
 */

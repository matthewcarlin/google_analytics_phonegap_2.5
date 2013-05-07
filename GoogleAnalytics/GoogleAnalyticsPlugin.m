#import "GoogleAnalyticsPlugin.h"
// Dispatch period in seconds
static const NSInteger kGANDispatchPeriodSec = 2;
@implementation GoogleAnalyticsPlugin
- (void) trackerWithTrackingId:(CDVInvokedUrlCommand*)command
{
    NSString* accountId = [command.arguments objectAtIndex:0];
    [GAI sharedInstance].debug = YES;
    [GAI sharedInstance].dispatchInterval = kGANDispatchPeriodSec;
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    [[GAI sharedInstance] trackerWithTrackingId:accountId];
}
- (void) trackEventWithCategory:(CDVInvokedUrlCommand*)command
{
    NSString* category = [optind valueForKey:@"category"];
    NSString* action = [optind valueForKey:@"action"];
    NSString* label = [optind valueForKey:@"label"];
    NSNumber* value = [optind valueForKey:@"value"];
    if (![[GAI sharedInstance].defaultTracker trackEventWithCategory:category
                                                          withAction:action
                                                           withLabel:label
                                                           withValue:value]) {
        // Handle error here
        NSLog(@"GoogleAnalyticsPlugin.trackEvent Error::");
        
    }
    NSLog(@"GoogleAnalyticsPlugin.trackEvent::%@, %@, %@, %@",category,action,label,value);
}

- (void) trackView:(CDVInvokedUrlCommand*)command
{
    NSString* pageUri = [command.arguments objectAtIndex:0];
    if (![[GAI sharedInstance].defaultTracker trackView:pageUri]) {
        // TODO: Handle error here
    }
}

- (void) hitDispatched:(NSString *)hitString
{
    NSString* callback = [NSString stringWithFormat:@"window.plugins.googleAnalyticsPlugin.hitDispatched(%@);",  hitString];
    [ self.webView stringByEvaluatingJavaScriptFromString:callback];
}
@end
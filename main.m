/***********************************************
    Compile with: clang -framework Foundation
        Or copy/paste into Xcode project
 ***********************************************/

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <AppKit/AppKit.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Class bundle = objc_getClass("NSBundle");
        
        class_replaceMethod(bundle, @selector(bundleIdentifier), 
            imp_implementationWithBlock(^ {
                return @"com.apple.finder";
            }), NULL);
        
        NSUserNotification *n = [[NSUserNotification alloc] init];
        n.title = @"Title";
        n.subtitle = @"Subtitle";
        n.informativeText = @"Informative Text";
        [[NSUserNotificationCenter defaultUserNotificationCenter] deliverNotification:n];
        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
        
    }    
    return 0;
}

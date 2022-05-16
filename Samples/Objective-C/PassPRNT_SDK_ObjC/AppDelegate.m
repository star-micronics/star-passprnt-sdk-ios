//
//  AppDelegate.m
//  PassPRNT_SDK_ObjC
//
//  Created by Star Micronics on 2016/06/23.
//  Copyright 2016-2017 (C) Star Micronics Co., Ltd. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url options:(nonnull NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    
    NSLog(@"done");

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Result"
                                                                   message:[NSString stringWithFormat:@"%@", url]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK"
                                                          style:UIAlertActionStyleDefault
                                                        handler:nil];
    [alert addAction:alertAction];
    
    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
    
    return YES;
}

+ (void)setSelectedItem:(NSString *)item AsKey:(NSString *)key {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:item forKey:key];
    
    [defaults synchronize];
}

+ (NSString *)getSelectedItemWithKey:(NSString *)key {
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    return [defaults objectForKey:key];
}

@end

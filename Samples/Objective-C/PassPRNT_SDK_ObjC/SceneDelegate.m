//
//  SceneDelegate.m
//  PassPRNT_SDK_ObjC
//
//  Created by Star Micronics on 2026/06/23.
//  Copyright 2016-2026 (C) Star Micronics Co., Ltd. All rights reserved.
//

#import "SceneDelegate.h"

@interface SceneDelegate ()

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    UIWindowScene *windowScene = (UIWindowScene *)scene;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.window.rootViewController = [storyboard instantiateInitialViewController];
    [self.window makeKeyAndVisible];

    // Handle URL passed at cold-launch time
    for (UIOpenURLContext *context in connectionOptions.URLContexts) {
        [self handleURL:context.URL];
    }
}

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts {
    for (UIOpenURLContext *context in URLContexts) {
        [self handleURL:context.URL];
    }
}

- (void)handleURL:(NSURL *)url {
    NSLog(@"done");

    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Result"
                                                                   message:[NSString stringWithFormat:@"%@", url]
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"OK"
                                                          style:UIAlertActionStyleDefault
                                                        handler:nil];
    [alert addAction:alertAction];

    [self.window.rootViewController presentViewController:alert animated:YES completion:nil];
}

- (void)sceneDidDisconnect:(UIScene *)scene {
}

- (void)sceneDidBecomeActive:(UIScene *)scene {
}

- (void)sceneWillResignActive:(UIScene *)scene {
}

- (void)sceneWillEnterForeground:(UIScene *)scene {
}

- (void)sceneDidEnterBackground:(UIScene *)scene {
}

@end

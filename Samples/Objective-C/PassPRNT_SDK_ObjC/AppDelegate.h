//
//  AppDelegate.h
//  PassPRNT_SDK_ObjC
//
//  Created by Star Micronics on 2016/06/23.
//  Copyright 2016-2017 (C) Star Micronics Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

+ (void)setSelectedItem:(NSString *)item AsKey:(NSString *)key;
+ (NSString *)getSelectedItemWithKey:(NSString *)key;

@end


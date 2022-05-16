//
//  DetailTableViewController.h
//  PassPRNT_SDK_ObjC
//
//  Created by Star Micronics on 2016/06/23.
//  Copyright 2016-2017 (C) Star Micronics Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewController : UITableViewController

@property (nonatomic, strong) NSString* detailKey;
@property (nonatomic, strong) NSString* selectedItem;
@property (nonatomic, strong) NSArray*  detailArray;

@end

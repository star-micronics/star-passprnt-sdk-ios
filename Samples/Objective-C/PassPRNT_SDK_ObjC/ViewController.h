//
//  ViewController.h
//  PassPRNT_SDK_ObjC
//
//  Created by Star Micronics on 2016/06/23.
//  Copyright 2016-2017 (C) Star Micronics Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) NSArray* sectionTitles;

@property (nonatomic, strong) NSArray* portNameArray;
@property (nonatomic, strong) NSArray* portSettingsArray;
@property (nonatomic, strong) NSArray* timeoutArray;
@property (nonatomic, strong) NSArray* sizeArray;
@property (nonatomic, strong) NSArray* drawerArray;
@property (nonatomic, strong) NSArray* drawerpulseArray;

@property (nonatomic, strong) NSArray *buzzerArray;
@property (nonatomic, strong) NSArray *buzzerchannelArray;
@property (nonatomic, strong) NSArray *buzzerrepeatArray;
@property (nonatomic, strong) NSArray *buzzerdrivetimeArray;
@property (nonatomic, strong) NSArray *buzzerdelaytimeArray;

@property (nonatomic, strong) NSArray *soundArray;
@property (nonatomic, strong) NSArray *soundstorageareaArray;
@property (nonatomic, strong) NSArray *soundnumberArray;
@property (nonatomic, strong) NSArray *soundvolumeArray;

@property (nonatomic, strong) NSArray* backArray;
@property (nonatomic, strong) NSArray* bmArray;
@property (nonatomic, strong) NSArray* gapArray;
@property (nonatomic, strong) NSArray* cutArray;
@property (nonatomic, strong) NSArray* popupArray;
@property (nonatomic, strong) NSArray* htmlArray;
@property (nonatomic, strong) NSArray* pdfArray;
@property (nonatomic, strong) NSArray* urlArray;

@property (nonatomic, strong) NSString* selectedPortName;
@property (nonatomic, strong) NSString* selectedSettings;
@property (nonatomic, strong) NSString* selectedTimeout;
@property (nonatomic, strong) NSString* selectedSize;

@property (nonatomic, strong) NSString* selectedDrawer;
@property (nonatomic, strong) NSString* selectedDrawerpulse;

@property (nonatomic, strong) NSString *selectedBuzzer;
@property (nonatomic, strong) NSString *selectedBuzzerchannel;
@property (nonatomic, strong) NSString *selectedBuzzerrepeat;
@property (nonatomic, strong) NSString *selectedBuzzerdrivetime;
@property (nonatomic, strong) NSString *selectedBuzzerdelaytime;

@property (nonatomic, strong) NSString *selectedSound;
@property (nonatomic, strong) NSString *selectedSoundstoragearea;
@property (nonatomic, strong) NSString *selectedSoundnumber;
@property (nonatomic, strong) NSString *selectedSoundvolume;

@property (nonatomic, strong) NSString* selectedBack;
@property (nonatomic, strong) NSString* selectedBm;
@property (nonatomic, strong) NSString* selectedGap;
@property (nonatomic, strong) NSString* selectedCut;
@property (nonatomic, strong) NSString* selectedPopup;
@property (nonatomic, strong) NSString* selectedHtml;
@property (nonatomic, strong) NSString* selectedPdf;
@property (nonatomic, strong) NSString* selectedUrl;

@property (nonatomic, strong) NSIndexPath* selectedIndexPath;
@property (nonatomic, strong) NSString*    selectedIndexText;

@property (nonatomic, strong) NSMutableString* urlScheme;

- (IBAction)touchUpInside_print:(id)sender;
- (IBAction)touchUpInside_about:(id)sender;
@end


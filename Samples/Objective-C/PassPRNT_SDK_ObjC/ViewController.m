//
//  ViewController.m
//  PassPRNT_SDK_ObjC
//
//  Created by Star Micronics on 2016/06/23.
//  Copyright 2016-2017 (C) Star Micronics Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "DetailTableViewController.h"
#import "AppDelegate.h"

/**
 This is Objective-C based sample project for PassPRNT.
 
 PassPRNT is called by the host application such like this sample using a URL scheme,
 accepts the printing data, and then outputs it to a Star Micronics-brand printer.
 This sample describes how to configure specified data between PassPRNT and the host application.

 The application interaction of this software uses the iOS standard URL scheme (including path and query).
 The printing layout is defined using HTML or PDF. Other printer settings use the queries described in 
 the manual is included in this package. Accordingly, this sample is intended for application/system
 developers who use HTML and/or PDF and Objective-C. A basic understanding of HTML(and/or PDF) and 
 Objective-C are assumed for the users of the manual and software.
 
 Note: that the content of this manual applies to Star PassPRNT(for iOS) Ver. 2.0, 
 and will be updated on an ongoing basis as the application is updated.
 
 Aspecially, the following methods are useful for developers who are interested in PassPRNT.
 <Jump to PassPRNT by URL Scheme>
 `- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex`
 
 <Callback from PassPRNT with printing result of PassPRNT>
 `- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation`
 
 */

@interface ViewController ()

@end

@implementation ViewController

enum {
    QUERY_portName = 0,
    QUERY_settings,
    QUERY_timeout,
    QUERY_size,
    QUERY_drawer,
    QUERY_drawerpulse,
    QUERY_buzzer,
    QUERY_buzzerchannel,
    QUERY_buzzerrepeat,
    QUERY_buzzerdrivetime,
    QUERY_buzzerdelaytime,
    QUERY_sound,
    QUERY_soundstoragearea,
    QUERY_soundnumber,
    QUERY_soundvolume,
    QUERY_back,
    QUERY_bm,
    QUERY_gap,
    QUERY_cut,
    QUERY_popup,
    QUERY_html,
    QUERY_pdf,
    QUERY_url
} list;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor clearColor];
    
    [self.tableView setTableHeaderView:view];
//    [self.tableView setTableFooterView:view];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    _sectionTitles        = @[
                            @"port", @"settings", @"timeout", @"size", @"drawer", @"drawerpulse",
                            @"buzzer", @"buzzerchannel", @"buzzerrepeat", @"buzzerdrivetime", @"buzzerdelaytime",
                            @"sound", @"soundstoragearea", @"soundnumber", @"soundvolume",
                            @"back", @"blackmark", @"gap", @"cut", @"popup", @"html", @"pdf", @"url"
                            ];
    _portNameArray        = @[@"none", @"bt:", @"tcp:", @"ble:", @"usb:"];
    _portSettingsArray    = @[@"none", @"blank", @"portable", @"portable;escpos", @"escpos"];
    _timeoutArray         = @[@"none", @"10000"];
    _sizeArray            = @[@"none", @"1", @"2", @"2w1", @"2w2", @"2w3", @"2w4", @"2w5", @"2w6", @"2w7", @"3", @"3w", @"3w2", @"4"];
    
    _drawerArray          = @[@"none", @"off", @"ahead", @"after"];
    _drawerpulseArray     = @[@"none", @"200", @"500"];
    
    _buzzerArray          = @[@"none", @"off", @"ahead", @"after"];
    _buzzerchannelArray   = @[@"none", @"channel1", @"channel2"];
    _buzzerrepeatArray    = @[@"none", @"1", @"2", @"5"];
    _buzzerdrivetimeArray = @[@"none", @"200", @"500", @"1000"];
    _buzzerdelaytimeArray = @[@"none", @"200", @"500", @"1000"];
    
    _soundArray            = @[@"none", @"off", @"ahead", @"after"];
    _soundstorageareaArray = @[@"none", @"area1", @"area2"];
    _soundnumberArray      = @[@"none", @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7"];
    _soundvolumeArray      = @[@"none", @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10",
                               @"11", @"12", @"13", @"14", @"15", @"off", @"min", @"max"];

    _backArray          = @[@"passprntsdk://"];
    _bmArray            = @[@"none", @"disable", @"enable", @"enableAndDetectAtPowerOn"];
    _gapArray           = @[@"none", @"disable", @"enable", @"enableAndDetectAtPowerOn"];
    _cutArray           = @[@"none", @"partial", @"full", @"tearbar", @"nocut"];
    _popupArray         = @[@"none", @"enable", @"disable"];
    
    _htmlArray         = [[NSArray alloc]initWithArray:[self getFileListArrayWith:@".html"]];     //@[@"none"];
    _pdfArray          = [[NSArray alloc]initWithArray:[self getFileListArrayWith:@".pdf"]];      //@[@"none"];
    
    _urlArray          = @[@"none",
                           @"https://www.star-m.jp/products/s_print/sdk/passprnt/sample/resource/receipt_sample.html",
                           @"https://www.star-m.jp/products/s_print/sdk/passprnt/sample/resource/receipt_sample.pdf"];
    
    /*** Note:If you want to retain query parameters, please remove the line below. ***/
    [self resetSelectedQueryParameter];
}

- (void)refleshConfiguredData {
    for (long i = 0; i < _sectionTitles.count; i++) {
        NSString *text = [AppDelegate getSelectedItemWithKey:[NSString stringWithFormat:@"%ld", i]];
        
        switch (i) {
            case QUERY_portName:
                _selectedPortName         = (text != nil) ? text : _portNameArray[0];
                break;
            case QUERY_settings:
                _selectedSettings         = (text != nil) ? text : _portSettingsArray[0];
                break;
            case QUERY_timeout:
                _selectedTimeout          = (text != nil) ? text : _timeoutArray[0];
                break;
            case QUERY_size:
                _selectedSize             = (text != nil) ? text : _sizeArray[0];
                break;
            case QUERY_drawer:
                _selectedDrawer           = (text != nil) ? text : _drawerArray[0];
                break;
            case QUERY_drawerpulse:
                _selectedDrawerpulse      = (text != nil) ? text : _drawerpulseArray[0];
                break;
            case QUERY_buzzer:
                _selectedBuzzer           = (text != nil) ? text : _buzzerArray[0];
                break;
            case QUERY_buzzerchannel:
                _selectedBuzzerchannel    = (text != nil) ? text : _buzzerchannelArray[0];
                break;
            case QUERY_buzzerrepeat:
                _selectedBuzzerrepeat     = (text != nil) ? text : _buzzerrepeatArray[0];
                break;
            case QUERY_buzzerdrivetime:
                _selectedBuzzerdrivetime  = (text != nil) ? text : _buzzerdrivetimeArray[0];
                break;
            case QUERY_buzzerdelaytime:
                _selectedBuzzerdelaytime  = (text != nil) ? text : _buzzerdelaytimeArray[0];
                break;
            case QUERY_sound:
                _selectedSound            = (text != nil) ? text : _soundArray[0];
                break;
            case QUERY_soundstoragearea:
                _selectedSoundstoragearea = (text != nil) ? text : _soundstorageareaArray[0];
                break;
            case QUERY_soundnumber:
                _selectedSoundnumber      = (text != nil) ? text : _soundnumberArray[0];
                break;
            case QUERY_soundvolume:
                _selectedSoundvolume      = (text != nil) ? text : _soundvolumeArray[0];
                break;
            case QUERY_back:
                _selectedBack             = (text != nil) ? text : _backArray[0];
                break;
            case QUERY_bm:
                _selectedBm               = (text != nil) ? text : _bmArray[0];
                break;
            case QUERY_gap:
                _selectedGap              = (text != nil) ? text : _gapArray[0];
                break;
            case QUERY_cut:
                _selectedCut              = (text != nil) ? text : _cutArray[0];
                break;
            case QUERY_popup:
                _selectedPopup            = (text != nil) ? text : _popupArray[0];
                break;
            case QUERY_html:
                _selectedHtml             = (text != nil) ? text : _htmlArray[0];
                break;
            case QUERY_pdf:
                _selectedPdf              = (text != nil) ? text : _pdfArray[0];
                break;
            case QUERY_url:
                _selectedUrl              = (text != nil) ? text : _urlArray[0];
                break;
        }
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self refleshConfiguredData];
    [self.tableView reloadData];
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)getFileListArrayWith:(NSString *)extention {
    NSMutableArray *mutableArray = [[NSMutableArray alloc]init];
    
    [mutableArray addObject:@"none"];
    
    NSFileManager *fm   = [[NSFileManager alloc]init];
    NSString      *path = [[NSBundle mainBundle]bundlePath];
    
    for (NSString *str in [fm contentsOfDirectoryAtPath:path error:nil]) {
        NSLog(@"%@", str);
        if ([str hasSuffix:extention]) {
            [mutableArray addObject:str];
        }
    }
    return mutableArray;
}

#pragma mark - TableView

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger count = 1;
    
    return count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _sectionTitles.count;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return _sectionTitles[section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault
                                     reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
//    NSString *text = [AppDelegate getSelectedItemWithKey:[NSString stringWithFormat:@"%ld", (long)indexPath.section]];
    switch (indexPath.section) {
        case QUERY_portName:
            cell.textLabel.text = _selectedPortName;
            break;
        case QUERY_settings:
            cell.textLabel.text = _selectedSettings;
            break;
        case QUERY_timeout:
            cell.textLabel.text = _selectedTimeout;
            break;
        case QUERY_size:
            cell.textLabel.text = _selectedSize;
            break;
        case QUERY_drawer:
            cell.textLabel.text = _selectedDrawer;
            break;
        case QUERY_drawerpulse:
            cell.textLabel.text = _selectedDrawerpulse;
            break;
        case QUERY_buzzer:
            cell.textLabel.text = _selectedBuzzer;
            break;
        case QUERY_buzzerchannel:
            cell.textLabel.text = _selectedBuzzerchannel;
            break;
        case QUERY_buzzerrepeat:
            cell.textLabel.text = _selectedBuzzerrepeat;
            break;
        case QUERY_buzzerdrivetime:
            cell.textLabel.text = _selectedBuzzerdrivetime;
            break;
        case QUERY_buzzerdelaytime:
            cell.textLabel.text = _selectedBuzzerdelaytime;
            break;
        case QUERY_sound:
            cell.textLabel.text = _selectedSound;
            break;
        case QUERY_soundstoragearea:
            cell.textLabel.text = _selectedSoundstoragearea;
            break;
        case QUERY_soundnumber:
            cell.textLabel.text = _selectedSoundnumber;
            break;
        case QUERY_soundvolume:
            cell.textLabel.text = _selectedSoundvolume;
            break;
        case QUERY_back:
            cell.textLabel.text = _selectedBack;
            break;
        case QUERY_bm:
            cell.textLabel.text = _selectedBm;
            break;
        case QUERY_gap:
            cell.textLabel.text = _selectedGap;
            break;
        case QUERY_cut:
            cell.textLabel.text = _selectedCut;
            break;
        case QUERY_popup:
            cell.textLabel.text = _selectedPopup;
            break;
        case QUERY_html:
            cell.textLabel.text = _selectedHtml;
            break;
        case QUERY_pdf:
            cell.textLabel.text = _selectedPdf;
            break;
        case QUERY_url:
            cell.textLabel.text = _selectedUrl;
            break;
        default:
            cell.textLabel.text = @"unknown";
            break;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _selectedIndexPath = indexPath;
    _selectedIndexText = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    
    [self performSegueWithIdentifier:@"pushDetailView" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"pushDetailView"]) {
        
        DetailTableViewController *detailTableViewController = segue.destinationViewController;
        
        detailTableViewController.selectedItem = _selectedIndexText;
        detailTableViewController.detailKey    = [NSString stringWithFormat:@"%ld", (long)_selectedIndexPath.section];
        
        switch (_selectedIndexPath.section) {
            case QUERY_portName:
                detailTableViewController.detailArray  = _portNameArray;
                break;
            case QUERY_settings:
                detailTableViewController.detailArray  = _portSettingsArray;
                break;
            case QUERY_timeout:
                detailTableViewController.detailArray  = _timeoutArray;
                break;
            case QUERY_size:
                detailTableViewController.detailArray  = _sizeArray;
                break;
            case QUERY_drawer:
                detailTableViewController.detailArray  = _drawerArray;
                break;
            case QUERY_drawerpulse:
                detailTableViewController.detailArray  = _drawerpulseArray;
                break;
            case QUERY_buzzer:
                detailTableViewController.detailArray  = _buzzerArray;
                break;
            case QUERY_buzzerchannel:
                detailTableViewController.detailArray  = _buzzerchannelArray;
                break;
            case QUERY_buzzerrepeat:
                detailTableViewController.detailArray  = _buzzerrepeatArray;
                break;
            case QUERY_buzzerdrivetime:
                detailTableViewController.detailArray  = _buzzerdrivetimeArray;
                break;
            case QUERY_buzzerdelaytime:
                detailTableViewController.detailArray  = _buzzerdelaytimeArray;
                break;
            case QUERY_sound:
                detailTableViewController.detailArray  = _soundArray;
                break;
            case QUERY_soundstoragearea:
                detailTableViewController.detailArray  = _soundstorageareaArray;
                break;
            case QUERY_soundnumber:
                detailTableViewController.detailArray  = _soundnumberArray;
                break;
            case QUERY_soundvolume:
                detailTableViewController.detailArray  = _soundvolumeArray;
                break;
            case QUERY_back:
                detailTableViewController.detailArray  = _backArray;
                break;
            case QUERY_bm:
                detailTableViewController.detailArray  = _bmArray;
                break;
            case QUERY_gap:
                detailTableViewController.detailArray  = _gapArray;
                break;
            case QUERY_cut:
                detailTableViewController.detailArray  = _cutArray;
                break;
            case QUERY_popup:
                detailTableViewController.detailArray  = _popupArray;
                break;
            case QUERY_html:
                detailTableViewController.detailArray  = _htmlArray;
                break;
            case QUERY_pdf:
                detailTableViewController.detailArray  = _pdfArray;
                break;
            case QUERY_url:
                detailTableViewController.detailArray  = _urlArray;
                break;
            default:
                detailTableViewController.selectedItem = nil;
                detailTableViewController.detailArray  = nil;
                break;
        }
    }
}

#pragma mark - tap button action

- (IBAction)touchUpInside_print:(id)sender {

    _urlScheme = [[NSMutableString alloc]initWithString:@"starpassprnt://v1/print/nopreview?"];
    
    for (long i = 0; i < _sectionTitles.count; i++) {
        NSLog(@"%@", _sectionTitles[i]);
        
        NSString *text = nil;
        
        switch (i) {
            case QUERY_timeout:
                text = _selectedTimeout;
                break;
            case QUERY_size:
                text = _selectedSize;
                break;
            case QUERY_drawer:
                text = _selectedDrawer;
                break;
            case QUERY_drawerpulse:
                text = _selectedDrawerpulse;
                break;
            case QUERY_buzzer:
                text = _selectedBuzzer;
                break;
            case QUERY_buzzerchannel:
                text = _selectedBuzzerchannel;
                break;
            case QUERY_buzzerrepeat:
                text = _selectedBuzzerrepeat;
                break;
            case QUERY_buzzerdrivetime:
                text = _selectedBuzzerdrivetime;
                break;
            case QUERY_buzzerdelaytime:
                text = _selectedBuzzerdelaytime;
                break;
            case QUERY_sound:
                text = _selectedSound;
                break;
            case QUERY_soundstoragearea:
                text = _selectedSoundstoragearea;
                break;
            case QUERY_soundnumber:
                text = _selectedSoundnumber;
                break;
            case QUERY_soundvolume:
                text = _selectedSoundvolume;
                break;
            case QUERY_portName:
                text = [self encodeHtmlDataWith:_selectedPortName];
                break;
            case QUERY_settings:
            {
                if ([_selectedSettings isEqualToString:@"blank"]) {
                    text = @"";
                } else {
                    text = [self encodeHtmlDataWith:_selectedSettings];
                }
                break;
            }
            case QUERY_back:
                text = [self encodeHtmlDataWith:_selectedBack];
                break;
            case QUERY_bm:
                text = _selectedBm;
                break;
            case QUERY_gap:
                text = _selectedGap;
                break;
            case QUERY_cut:
                text = _selectedCut;
                break;
            case QUERY_popup:
                text = _selectedPopup;
                break;
            case QUERY_html:
            {
                if ([_selectedHtml isEqualToString:@"none"]) {
                    text = @"none";
                    break;
                }
                NSString     *path    = [[NSBundle mainBundle]pathForResource:[_selectedHtml stringByDeletingPathExtension] ofType:@"html"];
                NSFileHandle *fh      = [NSFileHandle fileHandleForReadingAtPath:path];
                NSData       *html    = [fh readDataToEndOfFile];
                NSString     *htmlStr = [[NSString alloc] initWithData:html encoding:NSUTF8StringEncoding];

                text = [self encodeHtmlDataWith:htmlStr];
            }
                break;
            case QUERY_pdf:
            {
                if ([_selectedPdf isEqualToString:@"none"]) {
                    text = @"none";
                    break;
                }
                NSString *path = [[NSBundle mainBundle] pathForResource:[_selectedPdf stringByDeletingPathExtension] ofType:@"pdf"];
                NSURL    *url  = [NSURL fileURLWithPath:path];

                NSString *base64Str = [self encodedBase64StringWithPath:url];
                text = [self encodeHtmlDataWith:base64Str];
//                text = [self encodeHtmlDataWith:[[[NSData alloc]initWithContentsOfURL:url]base64EncodedStringWithOptions:0]];
            }
                break;
        case QUERY_url:
            {
                if ([_selectedUrl isEqualToString:@"none"]) {
                    text = @"none";
                    break;
                }
                text = [self encodeHtmlDataWith:_selectedUrl];
            }
            break;
        }
        
        if ([text isEqualToString:@"none"]) {
            continue;
        }
        
        [_urlScheme appendString:_sectionTitles[i]];
        [_urlScheme appendString:@"="];
        [_urlScheme appendString:text];
        [_urlScheme appendString:@"&"];
    }
    
    [_urlScheme deleteCharactersInRange:NSMakeRange(_urlScheme.length - 1, 1)];
    
    NSLog(@"***** Scheme **********");
    NSLog(@"%@", _urlScheme);
    NSLog(@"Length: %lu", (unsigned long)_urlScheme.length);
    NSLog(@"***** end *************");
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Send"
                                                                   message:[NSString stringWithFormat:@"%@", _urlScheme]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
        [UIApplication.sharedApplication openURL:[NSURL URLWithString:self->_urlScheme]
                                         options:@{}
                               completionHandler:^(BOOL success) {
            NSLog(@"Result: %d", success);
        }];
    }];
    
    [alert addAction:okAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel"
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (IBAction)touchUpInside_about:(id)sender {
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    NSString *build = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"About"
                                                                   message:[NSString stringWithFormat:@"Version: %@\nBuild: %@", version, build]
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    
    [alert addAction:okAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - encoding method
- (NSString *)encodeHtmlDataWith:(NSString *)utf8String {
    //Reserved characters defined by RFC 3986
    NSString *genDelims = @":/?#[]@";
    NSString *subDelims = @"!$&'()*+,;=";
    NSString *reservedCharacters = [NSString stringWithFormat:@"%@%@",
                                    genDelims,
                                    subDelims];
    
    NSMutableCharacterSet * allowedCharacterSet = [NSCharacterSet URLQueryAllowedCharacterSet].mutableCopy;
    [allowedCharacterSet removeCharactersInString:reservedCharacters];
    
    return [utf8String stringByAddingPercentEncodingWithAllowedCharacters:allowedCharacterSet] ? : utf8String;
}

- (NSString *)encodedBase64StringWithPath:(NSURL *)url {
    return [[[NSData alloc]initWithContentsOfURL:url]base64EncodedStringWithOptions:0];
}

#pragma mark - initialization
- (void)resetSelectedQueryParameter {
    [AppDelegate setSelectedItem:_portNameArray[0]         AsKey:[NSString stringWithFormat:@"%d", QUERY_portName]];
    [AppDelegate setSelectedItem:_portSettingsArray[0]     AsKey:[NSString stringWithFormat:@"%d", QUERY_settings]];
    [AppDelegate setSelectedItem:_timeoutArray[0]          AsKey:[NSString stringWithFormat:@"%d", QUERY_timeout]];
    [AppDelegate setSelectedItem:_sizeArray[0]             AsKey:[NSString stringWithFormat:@"%d", QUERY_size]];
     
    [AppDelegate setSelectedItem:_drawerArray[0]           AsKey:[NSString stringWithFormat:@"%d", QUERY_drawer]];
    [AppDelegate setSelectedItem:_drawerpulseArray[0]      AsKey:[NSString stringWithFormat:@"%d", QUERY_drawerpulse]];
     
    [AppDelegate setSelectedItem:_buzzerArray[0]           AsKey:[NSString stringWithFormat:@"%d", QUERY_buzzer]];
    [AppDelegate setSelectedItem:_buzzerchannelArray[0]    AsKey:[NSString stringWithFormat:@"%d", QUERY_buzzerchannel]];
    [AppDelegate setSelectedItem:_buzzerrepeatArray[0]     AsKey:[NSString stringWithFormat:@"%d", QUERY_buzzerrepeat]];
    [AppDelegate setSelectedItem:_buzzerdrivetimeArray[0]  AsKey:[NSString stringWithFormat:@"%d", QUERY_buzzerdrivetime]];
    [AppDelegate setSelectedItem:_buzzerdelaytimeArray[0]  AsKey:[NSString stringWithFormat:@"%d", QUERY_buzzerdelaytime]];
     
    [AppDelegate setSelectedItem:_soundArray[0]            AsKey:[NSString stringWithFormat:@"%d", QUERY_sound]];
    [AppDelegate setSelectedItem:_soundstorageareaArray[0] AsKey:[NSString stringWithFormat:@"%d", QUERY_soundstoragearea]];
    [AppDelegate setSelectedItem:_soundnumberArray[0]      AsKey:[NSString stringWithFormat:@"%d", QUERY_soundnumber]];
    [AppDelegate setSelectedItem:_soundvolumeArray[0]      AsKey:[NSString stringWithFormat:@"%d", QUERY_soundvolume]];
    
    [AppDelegate setSelectedItem:_backArray[0]            AsKey:[NSString stringWithFormat:@"%d", QUERY_back]];
    [AppDelegate setSelectedItem:_bmArray[0]              AsKey:[NSString stringWithFormat:@"%d", QUERY_bm]];
    [AppDelegate setSelectedItem:_gapArray[0]             AsKey:[NSString stringWithFormat:@"%d", QUERY_gap]];
    [AppDelegate setSelectedItem:_cutArray[0]             AsKey:[NSString stringWithFormat:@"%d", QUERY_cut]];
    [AppDelegate setSelectedItem:_popupArray[0]           AsKey:[NSString stringWithFormat:@"%d", QUERY_popup]];
    [AppDelegate setSelectedItem:_htmlArray[0]            AsKey:[NSString stringWithFormat:@"%d", QUERY_html]];
    [AppDelegate setSelectedItem:_pdfArray[0]             AsKey:[NSString stringWithFormat:@"%d", QUERY_pdf]];
    [AppDelegate setSelectedItem:_urlArray[0]             AsKey:[NSString stringWithFormat:@"%d", QUERY_url]];
}

@end

************************************************************
      Star PassPRNT iOS SDK Ver 2.3.0
         Readme_En.txt          Star Micronics Co., Ltd. 
************************************************************

 1. Overview
 2. Contents
 3. Scope
 4. Copyright
 5. Release History


=============
 1. Overview
=============
   This package contains iOS SDK for PassPRNT.
   "PassPRNT" is an application intervening outer applications (hereinafter 
   called "Coordinating App" and Star Device (hereinafter called "Device").
   This App transfers to the printer the print data converted from all Coordinating
   App information including receipt design, paper width and other related data.
   Therefore the Coordinating App needs no designing or development to establish
   communication with the printer.
   Similarly printer status and print result are monitored as well so that 
   Coordinating App is not required on such control.

   Receipt design put out of this system is supported by HTML/PDF layout, so there is
   no need to understand the device unique command specifications.
   The other transferred data is also distributed as a part of query based on
   the standard URL specifications.

   e.g.:
    starpassprnt://v1/print/nopreview?html=<HTML layout>&size=3&drawer=on&back=<Coordinating App>

   Please refer to document including this package for details.


=============
 2. Contents
=============
  PassPRNT_iOS_SDK_Ver2.3.0
  |
  | Readme_En.txt                       // Release Note(English)
  | Readme_Jp.txt                       // Release Note(Japanese)
  | SoftwareLicenseAgreement.pdf        // Software License Agreement(English)
  | SoftwareLicenseAgreement_jp.pdf     // Software License Agreement(Japanese)
  | UsersManual_iOS.url                 // Shortcut to User Manual
  |
  +- Samples
     |- Objective-C
     |  +- PassPRNT_SDK_ObjC.xcodeproj  // Sample program (Objective-C)
     |
     +- FileMaker
        |- PassPRNT_v2.0_2inch.fmp12    // project file for sample program(2inch design)
        |- PassPRNT_v2.0_3inch.fmp12    // project file for sample program(3inch design)
        +- PassPRNT_v2.0_4inch.fmp12    // project file for sample program(4inch design)


=================
 3. Scope
=================
  [OS]
    iOS 11.0 - 15.0.2

  [Software]
    PassPRNT Ver2.5.0

  [Printer Model]
    SM-L200     (Ver 1.1 or later - StarPRNT mode)
    SM-S210I *1 (Ver 3.0 or later - StarPRNT mode)
                (Ver 2.5 or later - ESC/POS mode)
    SM-S220I *2 (Ver 3.0 or later - StarPRNT mode)
                (Ver 2.1 or later - ESC/POS mode)
    SM-S230I *2 (Ver 1.0 or later - StarPRNT mode)
                (Ver 1.0 or later - ESC/POS mode)
    SM-L300     (Ver 1.0 or later - StarPRNT mode)
    SM-T300I    (Ver 3.0 or later - StarPRNT mode)
                (Ver 2.5 or later - ESC/POS mode)
    SM-T400I    (Ver 3.0 or later - StarPRNT mode)
                (Ver 2.5 or later - ESC/POS mode)
    TSP650II    (Ver 2.1 or later)
    TSP700II    (Ver 5.1 or later)
    TSP800II    (Ver 2.1 or later)
    TSP100IIIBI (Ver 1.0 or later)
    TSP100IIIW  (Ver 1.4 or later)
    TSP100IIILAN(Ver 1.3 or later)
    TSP100IIIU  (Ver 1.0 or later)
    TSP100IV    (Ver 1.0 or later)
    FVP10       (Ver 1.3 or later)
    BSC10    *2 (Ver 1.0 or later)
    mPOP        (Ver 1.0.1 or later)
    mC-Print2   (Ver 1.0 or later)
    mC-Print3   (Ver 1.0 or later)

     *1-JP model only
     *2-US EU model only

  [Interface]
    Bluetooth: TSP series, FVP10, BSC10 (IFBD-HB03/HB04 Ver 1.0.0 or later)
             : Portable series except SM-L200 and SM-L300
             : mPOP, mC-Print2, mC-Print3
    Bluetooth Low Energy : SM-L200, SM-L300
    Ethernet : TSP series, FVP10, BSC10 (IFBD-HE05/HE06 Ver 1.0.1 or later)
    USB      : TSP100III, mC-Print2, mC-Print3

==============
 4. Copyright
==============
  Copyright 2015-2021 Star Micronics Co., Ltd. All rights reserved.

====================
 5. Release History
====================
 Ver 2.3.0
  2021/10/29  : Added TSP100IV support.
                Added Buzzer (BU01) and Melody Speaker (mC-Sound) support.

 Ver 2.2
  2020/01/23 : Added Web Download Print function ('Url' query).
               Support Dark Mode.

 Ver 2.1
  2018/07/02 : Added Printer models (mC-Print2/mC-Print3)
               Added Drawer activation time and Paper cut function
               Fixed issues

 Ver 2.0
  2017/10/31 : Added a printer model (SM-L300) and an interface (TSP100III U)
               Deprecated query "bmposition" feature
               Fixed issues

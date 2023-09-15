************************************************************
      Star PassPRNT iOS SDK Ver 2.5.0
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

  PassPRNT_iOS_SDK_Ver2.5.0
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
    iOS 13.0 - 16.6

  [Software]
    PassPRNT Ver 2.8.0

  [Printer Model]
    Please refer to Users Manual.

==============
 4. Copyright
==============

  Copyright 2015-2023 Star Micronics Co., Ltd. All rights reserved.

====================
 5. Release History
====================

 Ver 2.5.0
  2023/09/07  : Added `2w6` and `2w7` to `size` query.
                Updated target OS and target software.

 Ver 2.4.0
  2023/04/10  : Added `gap` query.
                Added `1` and `2w5` to `size` query.
                Updated target OS and target software.

 Ver 2.3.0
  2021/10/29  : Added Buzzer (BU01) and Melody Speaker (mC-Sound) support.

 Ver 2.2
  2020/01/23  : Added Web Download Print function ('Url' query).
                Supported Dark Mode.

 Ver 2.1
  2018/07/02  : Added Drawer activation time and Paper cut function
                Fixed issues

 Ver 2.0
  2017/10/31  : Deprecated query "bmposition" feature
                Fixed issues

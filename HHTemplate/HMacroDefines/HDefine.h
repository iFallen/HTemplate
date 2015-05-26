
//
//  HDefine.h
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#ifndef HHTemplate_HDefine_h
#define HHTemplate_HDefine_h

//MAKR:Headers
#import "HRequestUtils.h"

//MARK:Defines


#define FONT_NAME_HTC   @"Heiti TC"
#define FONT_NAME_A     @"Arial"
//自己添加otf字体 ，文件太大
//#define FONT_NAME_FangSong   @"AdobeFangsongStd-Regular"
//#define FONT_NAME_KaiTi      @"AdobeKaitiStd-Regular"

#define IOS7_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending)
#define IOS8_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending)

#define FOUR_INCH_OR_LATER ([[UIScreen mainScreen] bounds].size.height >= 568)

#define COLOR_RGB(_R,_G,_B,_A) [UIColor colorWithRed:_R/255.0f green:_G/255.0f blue:_B/255.0f alpha:_A]

#define TEST_COLOR      COLOR_RGB(255, 0, 0, 0.35)
#define CLEAR_COLOR     [UIColor clearColor]
#define WHITE_COLOR     [UIColor whiteColor]
#define TEXT_COLOR      COLOR_RGB(50, 50, 50, 1.0)
#define SUB_TEXT_COLOR  COLOR_RGB(160, 160, 160, 1.0)
#define HBACK_COLOR     COLOR_RGB(238, 238, 238, 1.0)
#define HSeprator_Color COLOR_RGB(214, 214, 214, 1.0)
#define HBorder_Color   COLOR_RGB(161, 161, 161, 1.0)

#define HDevice_Height [UIScreen mainScreen].bounds.size.height

#endif


#ifdef DEBUG

#define NSLog(FORMAT, ...) fprintf(stderr,"%s:%d----->  \t%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil

#endif


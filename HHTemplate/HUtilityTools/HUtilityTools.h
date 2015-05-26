//
//  HUtilityTools.h
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HUtilityTools : NSObject

+(void)showAAlertMessage:(NSString *)msg
                   title:(NSString *)title;

+(void)showAAlertMessage:(NSString *)msg
                   title:(NSString *)title
            buttonAction:(void(^)())buttonAction;

+(void)showASingleText:(NSString *)text
                  font:(UIFont *)font
                inView:(UIView *)sView
     autoHidAfterDelay:(NSTimeInterval)fDelay;

+(void)showStatusBarNetworkingActivity:(BOOL)bShow;

/**
 *  版本号
 *
 *  @return <#return value description#>
 */
+(NSString *)getBunldVersion;

/**
 *  编译次数
 *
 *  @return <#return value description#>
 */
+(NSString *)getBunldBuild;

+(UIColor *)randomColor;

+(void)clearBadgeNumber;

@end

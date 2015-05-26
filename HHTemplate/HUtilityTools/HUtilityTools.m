//
//  HUtilityTools.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "HUtilityTools.h"
#import "HStringUtils.h"
#import <MBProgressHUD/MBProgressHUD.h>

@implementation HUtilityTools

+(void)showAAlertMessage:(NSString *)msg title:(NSString *)title{
    NSString * strT = title;
    if ([HStringUtils isTextEmpty:title]) {
        strT = @"提示";
    }
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:strT message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
}

+(void)showAAlertMessage:(NSString *)msg title:(NSString *)title buttonAction:(void (^)())buttonAction{
    
}

+(void)showASingleText:(NSString *)text font:(UIFont *)font inView:(UIView *)sView autoHidAfterDelay:(NSTimeInterval)fDelay{
    MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:sView animated:YES];
    [hud setMode:MBProgressHUDModeText];
    if (font) {
        [hud setDetailsLabelFont:font];
    }
    [hud setRemoveFromSuperViewOnHide:YES];
    [hud setDetailsLabelText:text];
    [hud hide:YES afterDelay:fDelay];
}

+(void)showStatusBarNetworkingActivity:(BOOL)bShow{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:bShow];
}


+(NSString *)getBunldVersion{
    return [NSString stringWithFormat:@"%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];//
}

+(NSString *)getBunldBuild{
    return [NSString stringWithFormat:@"%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]];//编译次数
}

+(void)clearBadgeNumber{
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
}

+(UIColor *)randomColor{
    return [UIColor colorWithRed:(arc4random() % 255) / 255. green:(arc4random() % 255) / 255. blue:(arc4random() % 255) / 255. alpha:1.];
}

@end

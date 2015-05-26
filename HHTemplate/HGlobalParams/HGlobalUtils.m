//
//  HGlobalUtils.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "HGlobalUtils.h"
#import "HUtilityTools.h"
@implementation HGlobalUtils

static BOOL bLuanched = NO;
static BOOL bCalled = NO;

+(BOOL)isLaunchedAppBefore{
    [HGlobalUtils checkIsNewVersion];
    if (!bCalled) {
        bCalled = YES;
        bLuanched = [[NSUserDefaults standardUserDefaults] boolForKey:@"bLuanched"];
        //访问过之后保存状态
        if (!bLuanched) {
            [HGlobalUtils setisLaunchedBefore:YES];
        }
    }
    return bLuanched;
}

+(void)setisLaunchedBefore:(BOOL)bLaunched{
    [[NSUserDefaults standardUserDefaults] setBool:bLaunched forKey:@"bLuanched"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(void)checkIsNewVersion{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"HLastBunldBuild"]) {
        NSString * nowBB = [HUtilityTools getBunldBuild];
        NSString * lastBB = [[NSUserDefaults standardUserDefaults] objectForKey:@"HLastBunldBuild"];
        if (![nowBB isEqualToString:lastBB]) {//重新加载引导页面
            [HGlobalUtils setisLaunchedBefore:NO];
            [[NSUserDefaults standardUserDefaults] setObject:[HUtilityTools getBunldBuild] forKey:@"HLastBunldBuild"];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:[HUtilityTools getBunldBuild] forKey:@"HLastBunldBuild"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}


@end

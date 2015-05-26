//
//  HGlobalUtils.h
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HGlobalUtils : NSObject

/**
 *  处理程序第一次执行
 *
 *  @return return value description
 */
+(BOOL)isLaunchedAppBefore;
+(void)setisLaunchedBefore:(BOOL)bLaunched;

/**
 *  检测是不是新版本，如果是新版本 重新加载引导页面！！！
 */
+(void)checkIsNewVersion;

@end

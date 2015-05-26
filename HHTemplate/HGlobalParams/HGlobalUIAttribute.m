//
//  HGlobalUIAttribute.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "HGlobalUIAttribute.h"
#import "HDefine.h"

@implementation HGlobalUIAttribute

+(void)setNavigationBarAppearance{
    [[UINavigationBar appearance] setBarTintColor:TEST_COLOR];//background color
    [[UINavigationBar appearance] setTintColor:WHITE_COLOR];//BarItem按钮 文字颜色
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIColor whiteColor],
                                NSForegroundColorAttributeName,   [UIFont systemFontOfSize:16], NSFontAttributeName,nil];
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
}

+(void)setTabBarAppearance{
    [[UITabBar appearance] setBarTintColor:WHITE_COLOR];
    [[UITabBar appearance] setTintColor:TEXT_COLOR];
    [[UITabBarItem appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: TEST_COLOR, NSForegroundColorAttributeName, nil]
                                             forState: UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys: TEXT_COLOR, NSForegroundColorAttributeName, nil]
                                             forState: UIControlStateNormal];
}

@end

//
//  HConfigUtils.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/22/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "HConfigUtils.h"

static NSDictionary * dicConfig = nil;
@implementation HConfigUtils

+(NSDictionary *)getConfigDic{
    if (dicConfig == nil) {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"HAPIConfig" ofType:@"plist"];
        dicConfig = [[NSDictionary alloc] initWithContentsOfFile:path];
    }
    return dicConfig;
}

+(NSString *)getAPIRequetURL{
    NSDictionary * dicT = [self getConfigDic];
    NSAssert(dicT != nil, @"Bundle config plist failed");
    if ([dicT[@"Publish"] isEqualToString:@"1"]) {
        return dicT[@"PublishURL"];
    }
    return dicConfig[@"DevelopURL"];
}

+(NSString *)getFileUploadPath{
    NSDictionary * dicT = [self getConfigDic];
    NSAssert(dicT != nil, @"Bundle config plist failed");
    return dicT[@"UploadURL"];
}

+(NSString *)getRemoteResourcePath{
    NSDictionary * dicT = [self getConfigDic];
    NSAssert(dicT != nil, @"Bundle config plist failed");
    NSAssert(dicT != nil, @"Bundle config plist failed");
    return dicT[@"ResourceURL"];
}

@end

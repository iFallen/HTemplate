//
//  HStringUtils.h
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HStringUtils : NSObject

/**
 *  判断某个字符串是否匹配某个正则
 *
 *  @param baseString    待检测字符串
 *  @param regularString 正则
 *
 *  @return return value description
 */
+(BOOL)isString:(NSString*)baseString MatchingRegularString:(NSString*)regularString;

/**
 *  6-20位字母+数字
 *
 *  @param password <#password description#>
 *
 *  @return <#return value description#>
 */
+(BOOL)isPasswordValid:(NSString*)password;

/**
 *  只判断数字位数，第一位为1
 *
 *  @param mobile mobile description
 *
 *  @return return value description
 */
+(BOOL)isMobileValid:(NSString*)mobile;

/**
 *  <#Description#>
 *
 *  @param email <#email description#>
 *
 *  @return <#return value description#>
 */
+(BOOL)isEmailValid:(NSString *)email;

/**
 *  字符串是否为空
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
+(BOOL)isTextEmpty:(NSString*)str;

/**
 *  生产UUID
 *
 *  @return <#return value description#>
 */
+(NSString *)generateUUIDString;

/**
 *  计算字符串尺寸
 *
 *  @param string    string description
 *  @param font      font description
 *  @param limitSize limitSize description
 *
 *  @return <#return value description#>
 */
+(CGSize)caculateStringSizeWithString:(NSString *)string
                                 font:(UIFont *)font
                            limitSize:(CGSize)limitSize;

@end

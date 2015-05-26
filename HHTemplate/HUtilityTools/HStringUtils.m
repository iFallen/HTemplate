//
//  HStringUtils.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "HStringUtils.h"
#define PASSWORD_REG @"^(?![^a-zA-Z]+$)(?!\\D+$).{6,20}$" //6-20位字母+数字
#define MOBILE_REG   @"[1]\\d{10}$"
#define EMAIL_REG    @"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"

@implementation HStringUtils

+(BOOL)isString:(NSString *)baseString MatchingRegularString:(NSString *)regularString{
    NSPredicate *regextestPredicate= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regularString];
    return [regextestPredicate evaluateWithObject:baseString];
}

+(NSString *)generateUUIDString{
    CFUUIDRef uuid_ref = CFUUIDCreate(nil);
    CFStringRef uuid_string_ref= CFUUIDCreateString(nil, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_string_ref);
    return uuid;
}

+(BOOL)isPasswordValid:(NSString *)password{
    return [HStringUtils isString:password MatchingRegularString:PASSWORD_REG];
}

+(BOOL)isEmailValid:(NSString *)email{
    return [HStringUtils isString:email MatchingRegularString:email];
}

+(BOOL)isMobileValid:(NSString *)mobile{
    return [HStringUtils isString:mobile MatchingRegularString:MOBILE_REG];
}

+(BOOL)isTextEmpty:(NSString *)str{
    if (str == nil || (id)str == [NSNull null]) {
        return YES;
    }else{
        if (![str respondsToSelector:@selector(length)]) {
            return YES;
        }
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([str length]) {
            return NO;
        }
    }
    return YES;
}

+(CGSize)caculateStringSizeWithString:(NSString *)string font:(UIFont *)font limitSize:(CGSize)limitSize{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    //    CGSizeMake(100, MAXFLOAT)
    CGSize textSize = [string boundingRectWithSize:limitSize options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil].size;
    return textSize;
}

@end

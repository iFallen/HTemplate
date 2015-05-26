//
//  HTextFiled.h
//  HHTemplate
//
//  Created by 梁军 胡 on 5/18/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HTextFiledTypePassword,
    HTextFiledTypeText,
    HTextFiledTypeNumbers,
    HTextFiledTypeLetters,
    HTextFiledTypeEmail,
} HTextFiledType;

@interface HTextFiled : UIView<UITextFieldDelegate>

-(instancetype)initWithFrame:(CGRect)frame;


@property (nonatomic,strong) UITextField * textField;

@property (nonatomic,assign) int minLength;
@property (nonatomic,assign) int maxLength;

@property (nonatomic,assign) BOOL allowEmpty;

@property (nonatomic,assign,readonly) BOOL inputRight;

@property (nonatomic,assign) HTextFiledType textFType;

/**
 *  左对齐光标里左边间距
 *
 *  @param offsetX offsetX description
 */
- (void)setLeftOffsetWidth:(float)offsetX;

- (void)setReturnKeyType:(UIReturnKeyType)type;
/**
 *  设置预制内容 文本 和 颜色
 *
 *  @param text  text description
 *  @param color color description
 */
-(void)setPlaceHolderText:(NSString *)text color:(UIColor *)color;

@end

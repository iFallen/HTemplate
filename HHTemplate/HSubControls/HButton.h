//
//  HButton.h
//  HHTemplate
//
//  Created by 梁军 胡 on 5/19/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    HButtonTypeCountDown,
    HButtonTypeTitle,
} HButtonType;

typedef void(^HBAction)(void);

@class HButton;

@protocol HButtonDelegate <NSObject>

@optional
-(void)HButtonActionTimeCountFinished:(HButton *)hbtn;

@end


@interface HButton : UIView
{
    UIView   * maskView;
    NSString * originTitle;
    NSTimer  * countDownTimer;
    int  curCount;
}

@property (nonatomic,copy) HBAction bAcion;

@property (nonatomic,strong) UIButton * controlButton;
@property (nonatomic,assign) HButtonType type;//默认为title
@property (nonatomic,assign) int tCount;//倒计时时长 默认60s

@property (nonatomic,assign) id<HButtonDelegate> delegate;

-(id)initWithFrame:(CGRect)frame title:(NSString *)title buttonAction:(HBAction)action;

-(void)setTitleText:(NSString *)text forState:(UIControlState)state;
-(void)setTitleColor:(UIColor *)color forState:(UIControlState)state;
-(void)setTitleFont:(UIFont *)font;
-(void)setBorderColor:(UIColor *)color;
-(void)setBorderWidth:(CGFloat)width;

@end

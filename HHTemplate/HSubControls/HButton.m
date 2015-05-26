//
//  HButton.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/19/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "HButton.h"

@implementation HButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self baseInit];
        [self setBackgroundColor:[UIColor clearColor]];
        _controlButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_controlButton setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_controlButton setBackgroundColor:[UIColor clearColor]];
        [_controlButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:14.]];
        [_controlButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_controlButton addTarget:self action:@selector(HButtonInnerAction) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_controlButton];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame title:(NSString *)title buttonAction:(HBAction)action{
    if (self = [super initWithFrame:frame]) {
        originTitle = title;
        [self baseInit];
        [self setBackgroundColor:[UIColor clearColor]];
        _controlButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_controlButton setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_controlButton setBackgroundColor:[UIColor clearColor]];
        [_controlButton.titleLabel setFont:[UIFont fontWithName:@"Arial" size:14.]];
        [_controlButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        if (title && [title length]) {
            [_controlButton setTitle:title forState:UIControlStateNormal];
        }
        [_controlButton addTarget:self action:@selector(HButtonInnerAction) forControlEvents:UIControlEventTouchUpInside];
        if (action) {
            _bAcion = action;
        }
        [self addSubview:_controlButton];
    }
    return self;
}

-(void)baseInit{
    
    [self setBorderWidth:.5];
    [self setBorderColor:[UIColor greenColor]];
    
    _type = HButtonTypeTitle;
    _tCount = 60;
    curCount = _tCount;
    countDownTimer = nil;
    maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [maskView setBackgroundColor:[UIColor colorWithWhite:1. alpha:.35]];
    [maskView setHidden:YES];
    [maskView setAlpha:0.];
    [self addSubview:maskView];
}

-(void)setTCount:(int)tCount{
    _tCount = tCount;
    curCount = tCount;
}

-(void)HButtonInnerAction{
    NSLog(@"action....");
    if (_bAcion) {
        _bAcion();
    }
    if (_type == HButtonTypeCountDown) {
        if (countDownTimer == nil) {
            countDownTimer =[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(setCountDownAction) userInfo:nil repeats:YES];
            [countDownTimer setFireDate:[NSDate distantFuture]];
        }
        [self startCountDown];
    }
}


-(void)startCountDown{
    [self setButtonEnable:NO];
    [countDownTimer setFireDate:[NSDate date]];
}

-(void)stopCountDown{
    [countDownTimer invalidate];
    countDownTimer = nil;
}

-(void)setCountDownAction{
    if (curCount <= 0) {
        [countDownTimer setFireDate:[NSDate distantFuture]];
        curCount = _tCount;
        [self setButtonEnable:YES];
        [self setTitleText:originTitle forState:UIControlStateNormal];
        if (_delegate && [_delegate respondsToSelector:@selector(HButtonActionTimeCountFinished:)]) {
            [_delegate HButtonActionTimeCountFinished:self];
        }
        
    }else{
        NSLog(@"count down...%d",curCount);
        [self setTitleText:[NSString stringWithFormat:@"(%02ds后重试)",curCount--] forState:UIControlStateNormal];
    }
}

-(void)setButtonEnable:(BOOL)enable{
    if (enable) {
        [UIView animateWithDuration:.2 animations:^{
            [maskView setAlpha:0.];
        } completion:^(BOOL finished) {
            [maskView setHidden:YES];
        }];
    }else{
        [maskView setHidden:NO];
        [self bringSubviewToFront:maskView];
        [UIView animateWithDuration:.2 animations:^{
            [maskView setAlpha:1.];
        } completion:^(BOOL finished) {
            
        }];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setTitleText:(NSString *)text forState:(UIControlState)state{
    if (_controlButton) {
        [_controlButton setTitle:text forState:UIControlStateNormal];
    }
}

-(void)setTitleColor:(UIColor *)color forState:(UIControlState)state{
    if (_controlButton) {
        [_controlButton setTitleColor:color forState:state];
    }
}

-(void)setTitleFont:(UIFont *)font{
    if (_controlButton) {
        [_controlButton.titleLabel setFont:font];
    }
}

-(void)setBorderColor:(UIColor *)color{
    [self.layer setBorderColor:color.CGColor];
}

-(void)setBorderWidth:(CGFloat)width{
    [self.layer setBorderWidth:width];
}

@end

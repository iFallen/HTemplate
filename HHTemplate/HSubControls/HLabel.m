//
//  HLabel.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/19/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "HLabel.h"

@implementation HLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        [self setFont:[UIFont fontWithName:@"Arial" size:14.]];
        [self setTextColor:[UIColor blackColor]];
        [self setTextAlignment:NSTextAlignmentCenter];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame textAlignment:(NSTextAlignment)alignment
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:[UIColor clearColor]];
        [self setFont:[UIFont fontWithName:@"Arial" size:14.]];
        [self setTextColor:[UIColor blackColor]];
        [self setTextAlignment:alignment];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

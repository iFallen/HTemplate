//
//  HTextFiled.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/18/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "HTextFiled.h"

#define HTTEmail_Reg  @"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"

#define TextColor [UIColor colorWithRed:0.25 green:0.25 blue:0.25 alpha:1.]

@implementation HTextFiled

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _allowEmpty = NO;
        _inputRight = YES;
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_textField setClearButtonMode:UITextFieldViewModeWhileEditing];
        [_textField setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
        [_textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
        [_textField setAutocorrectionType:UITextAutocorrectionTypeNo];
        [_textField setFont:[UIFont systemFontOfSize:12.0f]];
        [_textField setTextColor:TextColor];
        [_textField setDelegate:self];
        [_textField setBackgroundColor:[UIColor clearColor]];
        [_textField setReturnKeyType:UIReturnKeyNext];
        
        [self setLeftOffsetWidth:5.];
        
        [self addSubview:_textField];
    }
    return self;
}

/**
 *  Description
 *
 *  @param offsetX <#offsetX description#>
 */
-(void)setLeftOffsetWidth:(float)offsetX{
    [_textField setLeftView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, offsetX, 0)]];
    [_textField.leftView setUserInteractionEnabled:NO];
    [_textField setLeftViewMode:UITextFieldViewModeAlways];
}

-(void)setReturnKeyType:(UIReturnKeyType)type{
    [_textField setReturnKeyType:type];
}

-(void)setPlaceHolderText:(NSString *)text color:(UIColor *)color{
    [_textField setAttributedPlaceholder:[[NSAttributedString alloc] initWithString:text attributes:@{NSForegroundColorAttributeName: color}]];
}

-(void)setTextFType:(HTextFiledType)textFType{
//    if (_textFType != textFType) {
        _textFType = textFType;
        switch (_textFType) {
            case HTextFiledTypeText:
                break;
            case HTextFiledTypeNumbers:
            {
                [_textField setKeyboardType:UIKeyboardTypePhonePad];
            }
                break;
            case HTextFiledTypePassword:
            {
                [_textField setSecureTextEntry:YES];
            }
                break;
            case HTextFiledTypeEmail:
            {
                
            }
                break;
            default:
                break;
        }
//    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

//MARK:UITextFieldDelegate
#define NUMBERS @"0123456789"
#define LETTERS @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self setClearBorder];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    _inputRight = YES;
    __weak typeof(self) bSelf = self;
    NSString * text = textField.text;
    if (text.length) {
        if (text.length < _minLength) {
            _inputRight = NO;
            [self showErrorAnimation:^{
                [bSelf setRedBorder];
            }];
        }
        switch (_textFType) {
            case HTextFiledTypeEmail://Email
            {
                NSPredicate * regextestPredicate= [NSPredicate predicateWithFormat:@"SELF MATCHES %@", HTTEmail_Reg];
                BOOL isEval =  [regextestPredicate evaluateWithObject:textField.text];
                if ( !isEval ) {
                    [self showErrorAnimation:^{
                        [bSelf setRedBorder];
                    }];
                }
            }
                break;
                
            default:
                break;
        }
    }else{
        if (_allowEmpty) {
            _inputRight = YES;
        }else{
            _inputRight = NO;
            [self showErrorAnimation:^{
                [bSelf setRedBorder];
            }];
        }
    }
    
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    _inputRight = YES;
    NSLog(@"%lu",(unsigned long)range.location);
    //长度
    if (_maxLength > 0) {
        
        if (range.location >= _maxLength) {
            _inputRight = NO;
            [self showErrorAnimation:nil];
            return NO;
        }
    }
    switch (_textFType) {
        case HTextFiledTypeNumbers://数字
        {
            NSCharacterSet * cs;
            cs = [[NSCharacterSet characterSetWithCharactersInString:NUMBERS] invertedSet];
            NSString * filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(! basicTest) {
                _inputRight = NO;
                [self showErrorAnimation:nil];
                return NO;
            }
        }
            break;
        case HTextFiledTypeLetters://字母
        {
            NSCharacterSet * cs;
            cs = [[NSCharacterSet characterSetWithCharactersInString:LETTERS] invertedSet];
            NSString * filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
            BOOL basicTest = [string isEqualToString:filtered];
            if(! basicTest) {
                _inputRight = NO;
                [self showErrorAnimation:nil];
                return NO;
            }
        }
            break;
        default:
            break;
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

-(void)showErrorAnimation:(void(^)())finished{
    [self setRedBorder];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setClearBorder];
        if (finished) {
            finished();
        }
    });
}

-(void)setRedBorder{
    [_textField.layer setBorderWidth:1.];
    [_textField.layer setBorderColor:[UIColor redColor].CGColor];
}

-(void)setClearBorder{
    [_textField.layer setBorderColor:[UIColor clearColor].CGColor];
}

@end

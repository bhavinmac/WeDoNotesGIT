//
//  UITextField+Additions.m
//  My ECO
//
//  Created by Jignesh on 20/07/13.
//  Copyright (c) 2013 Jignesh. All rights reserved.
//

#import "UITextField+Additions.h"

@implementation UITextField (Additions)

- (void)setPrefixText:(NSString *)prefix
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:self.font.fontName size:self.font.pointSize]];
    [label setTextColor:self.textColor];
    [label setAlpha:1.0];
    [label setText:prefix];
    
    CGSize prefixSize = [prefix sizeWithFont:label.font];
    label.frame = CGRectMake(0, 0, prefixSize.width, self.frame.size.height);
    
    [self setLeftView:label];
    [self setLeftViewMode:UITextFieldViewModeAlways];
    [label release];
}

- (void)setSuffixText:(NSString *)suffix
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont fontWithName:self.font.fontName size:self.font.pointSize]];
    [label setTextColor:self.textColor];
    [label setAlpha:1.0];
    [label setText:suffix];
    
    CGSize suffixSize = [suffix sizeWithFont:label.font];
    label.frame = CGRectMake(0, 0, suffixSize.width, self.frame.size.height);
    
    [self setRightView:label];
    [self setRightViewMode:UITextFieldViewModeAlways];
    [label release];
}

@end

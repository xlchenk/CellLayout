//
//  UILabel+Common.m
//  Isoft_oa
//
//  Created by 陈晓龙 on 17/1/18.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import "UILabel+Common.h"
@implementation UILabel (Common)
//创建标签
+ (instancetype)labelWithTextFont:(UIFont *)font textColor:(UIColor *)textColor{
    UILabel *label = [self new];
    label.font = font;
    label.numberOfLines = 0;
    label.textColor = textColor;
    return label;
}
@end

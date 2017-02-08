//
//  AutoCellHeight.h
//  CellLayout
//
//  Created by 陈晓龙 on 17/2/8.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "InfoDataModel.h"
@interface AutoCellHeight : NSObject
- (void)cacheHeitht:(CGFloat)height withCalculateHeightModel:(InfoDataModel *)model;

//根据model.hash 值 获取 缓存中的高度
- (CGFloat)heightForAutoCell:(InfoDataModel *)model;
@end

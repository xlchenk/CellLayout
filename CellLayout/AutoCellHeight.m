//
//  AutoCellHeight.m
//  CellLayout
//
//  Created by 陈晓龙 on 17/2/8.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import "AutoCellHeight.h"
@interface AutoCellHeight()
@property (strong, nonatomic, readonly) NSCache *cache;
@end
@implementation AutoCellHeight
- (instancetype)init{
    self = [super init];
    if (self) {
        [self initConfig];
    }
    return self;
}
- (void)initConfig{
    NSCache * cache = [[NSCache alloc]init];
    cache.countLimit = 200;
    _cache = cache;
}
- (void)cacheHeitht:(CGFloat)height withCalculateHeightModel:(InfoDataModel *)model{
    NSAssert(model != nil, @"Cell Model can't  nil");
    NSAssert(height >= 0, @"cell height must greater than or equal to 0");
   //NSAssert(condition, <#desc, ...#>)condition yes时继续执行 为no时 抛出异常描述
    [self.cache setObject:[NSNumber numberWithFloat:height] forKey:@(model.hash)];

}


//获取缓存中的高度
- (CGFloat)heightForAutoCell:(InfoDataModel *)model{
    NSNumber * cellHeight = [self.cache objectForKey:@(model.hash)];
    if (cellHeight) {
        return cellHeight.floatValue;
    }else{
        return -1;
    }
}
@end

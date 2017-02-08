//
//  InfoDataModel.m
//  CellLayout
//
//  Created by 陈晓龙 on 17/2/8.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import "InfoDataModel.h"

@implementation InfoDataModel

- (instancetype)initWithDic:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.title = dict[@"title"];
        self.time = dict[@"time"];
        self.content = dict[@"content"];
        self.username = dict[@"username"];
        self.imageName = dict[@"imageName"];
    }
    return self;
}

+ (InfoDataModel *)modelWithDict:(NSDictionary *)dict{
    InfoDataModel * model = [[InfoDataModel alloc]initWithDic:dict];
    return model;
}
@end

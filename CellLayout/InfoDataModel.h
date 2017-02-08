//
//  InfoDataModel.h
//  CellLayout
//
//  Created by 陈晓龙 on 17/2/8.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoDataModel : NSObject
@property(nonatomic, strong) NSString *title;
@property(nonatomic, strong) NSString *content;
@property(nonatomic, strong) NSString *username;
@property(nonatomic, strong) NSString *time;
@property(nonatomic, strong) NSString *imageName;

+ (InfoDataModel *)modelWithDict:(NSDictionary *)dict;
@end

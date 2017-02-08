//
//  CustomAutoLayoutCell.m
//  CellLayout
//
//  Created by 陈晓龙 on 17/2/7.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import "CustomAutoLayoutCell.h"
#import <Masonry.h>
#import "UILabel+Common.h"
@implementation CustomAutoLayoutCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat w = [UIScreen mainScreen].bounds.size.width;
        // 应该始终要加上这一句
        // 不然在6/6plus上就不准确了
        self.titlelb = [UILabel labelWithTextFont:[UIFont systemFontOfSize:15] textColor:[UIColor blackColor]];
        [self.contentView addSubview:self.titlelb];
        self.titlelb.preferredMaxLayoutWidth = w - 30;
        [self.titlelb mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.mas_equalTo(15);
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-15);
            make.height.mas_lessThanOrEqualTo(20);
        }];
        self.contentlb = [UILabel labelWithTextFont:[UIFont systemFontOfSize:17] textColor:[UIColor blackColor]];
        self.contentlb.preferredMaxLayoutWidth = w - 30;
        self.contentlb.numberOfLines = 0;
        [self.contentlb sizeToFit];
        [self.contentView addSubview:self.contentlb];
        
        [self.contentlb mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.left.mas_equalTo(15);
            make.top.equalTo(self.titlelb.mas_bottom);
            make.right.mas_equalTo(-15);
           make.height.mas_lessThanOrEqualTo(260);
        }];
        self.showImv = [[UIImageView alloc]init];
        [self.contentView addSubview:self.showImv];
        [self.showImv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.contentlb.mas_bottom);
        }];
        
        self.usernamelb = [UILabel labelWithTextFont:[UIFont systemFontOfSize:18] textColor:self.contentlb.textColor];
        
        [self.contentView addSubview:self.usernamelb];
        [self.usernamelb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@15);
            make.top.equalTo(self.showImv.mas_bottom).with.offset(5);
            make.width.equalTo(@100);
            make.bottom.equalTo(@-10);
        }];
        
        self.timelb = [UILabel labelWithTextFont:[UIFont systemFontOfSize:18] textColor:self.usernamelb.textColor];
        [self.contentView addSubview:self.timelb];
        [self.timelb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-15);
            make.top.equalTo(self.usernamelb.mas_top);
            make.width.equalTo(@100);
            make.bottom.equalTo(self.usernamelb.mas_bottom);
        }];
    }
    return self;
}

- (void)setDataModel:(InfoDataModel *)model indexPath:(NSIndexPath *)indexPatah{
    self.titlelb.text = model.title;
    self.contentlb.text = model.content;
    self.timelb.text = model.time;
    self.usernamelb.text = model.username;
    self.showImv.image = model.imageName.length>0?[UIImage imageNamed:model.imageName]:nil;
}

@end

//
//  CustomAutoLayoutCell.h
//  CellLayout
//
//  Created by 陈晓龙 on 17/2/7.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoDataModel.h"
@interface CustomAutoLayoutCell : UITableViewCell
@property(nonatomic,strong)UILabel * titlelb;
@property(nonatomic,strong)UILabel * contentlb;
@property(nonatomic,strong)UILabel * usernamelb;
@property(nonatomic,strong)UILabel * timelb;
@property(nonatomic,strong)UIImageView * showImv;
- (void)setDataModel:(InfoDataModel *)model indexPath:(NSIndexPath *)indexPatah;
@end

//
//  ViewController.m
//  CellLayout
//
//  Created by 陈晓龙 on 17/2/6.
//  Copyright © 2017年 陈晓龙. All rights reserved.
//

#import "ViewController.h"
#import "CustomAutoLayoutCell.h"
#import "InfoDataModel.h"
#import "AutoCellHeight.h"
#import <Masonry.h>
#define cellId @"identifier"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tableView;
@property(nonatomic,strong)NSMutableArray * dataSource;

@end

@implementation ViewController
{
    AutoCellHeight * cellHeightCalculator;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    [self createTableView];
}

- (void)initData{
    cellHeightCalculator = [[AutoCellHeight alloc]init];
    _dataSource = [[NSMutableArray alloc]init];
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData * data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    NSArray * array = dict[@"data"];
    NSMutableArray *muArray = [NSMutableArray array];
    for (NSDictionary * dict in array) {
        InfoDataModel * model = [InfoDataModel modelWithDict:dict];
        [muArray addObject:model];
    }
    _dataSource = muArray;
    
}

- (void)createTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH,SCREEN_HEIGHT ) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 100;
    [_tableView registerClass:[CustomAutoLayoutCell class] forCellReuseIdentifier:cellId];
    [self.view addSubview:_tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomAutoLayoutCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    InfoDataModel * model = [self.dataSource objectAtIndex:indexPath.row];
    [cell setDataModel:model indexPath:indexPath];
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    InfoDataModel * model = [self.dataSource objectAtIndex:indexPath.row];
    //首先获取缓存中的高度
    CGFloat cellHeight = [cellHeightCalculator heightForAutoCell:model];
    if (cellHeight>0) {
        NSLog(@"获取缓存中的高度");
        return cellHeight;
    }else{
        NSLog(@"计算高度");
    }
    
    CustomAutoLayoutCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    [cell setDataModel:model indexPath:indexPath];
    CGFloat fittingHeight = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;
    CGFloat h = fittingHeight+2*1/[UIScreen mainScreen].scale;//必须加上上下分割线的高度
    NSLog(@"cell高度：：%f",h);
    //将获取的高度缓存起来
    [cellHeightCalculator cacheHeitht:h withCalculateHeightModel:model];
    return h;
}

@end

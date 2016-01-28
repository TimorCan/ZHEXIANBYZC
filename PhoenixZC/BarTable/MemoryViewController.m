//
//  MemoryViewController.m
//  PhoenixZC
//
//  Created by juxi-ios on 16/1/27.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import "MemoryViewController.h"
#import "MemoryTableViewCell.h"
#import "SNChart.h"
@interface MemoryViewController ()<UITableViewDelegate,UITableViewDataSource,SNChartDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)SNChart * chart;
@end

@implementation MemoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.tableView registerClass:[MemoryCell class] forCellReuseIdentifier:@"MemoryCell"];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone ;
    [self.tableView registerNib:[UINib nibWithNibName:@"MemoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"MemoryTableViewCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    MemoryTableViewCell * cell = (MemoryTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"MemoryTableViewCell" forIndexPath:indexPath];
    cell.selectionStyle = 0;
    cell.titleLabel.text = @"BX7 新品上市销售技巧1";
    cell.lasttimeLabel.text = @"第一次学习时间：2015.9.15";
    cell.thatTimeLabel.text = @"上次复习时间:2015.12.25";
    cell.learnButton.layer.cornerRadius = 5 ;
    cell.learnButton.clipsToBounds =YES;
    cell.learnButton.tag = indexPath.row +100;
    [cell.learnButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    cell.contentVView.clipsToBounds =YES;
    
    
    
    //防止多次绘图彪内存
    __block NSInteger snChartNUM = 0; //记录是否已经绘制SNchart
    [cell.contentVView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[SNChart class]]) {
            snChartNUM ++;
        }
        
    }];
    if (snChartNUM == 0) {
        _chart = [[SNChart alloc] initWithFrame:CGRectMake(-20, 0,320, 80) withDataSource:self andChatStyle:SNChartStyleLine];
        _chart.curve = YES;//曲线 折线开关
        [_chart showInView:cell.contentVView];
    }
   
    return cell;
}
- (NSArray *)chatConfigYValue:(SNChart *)chart {
    return @[@"1",@"0",@"1",@"1",@"0",@"1",@"1",@"1"];
}

- (NSArray *)chatConfigXValue:(SNChart *)chart {
    return @[@"",@"20分钟",@"1小时",@"9小时",@"1天",@"2天",@"6天",@"1个月"];
}

-(void)buttonClicked:(UIButton *)btn
{
    NSLog(@"第%ld个button被点击了",btn.tag -100);
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

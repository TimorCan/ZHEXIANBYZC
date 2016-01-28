//
//  LastLeainingViewController.m
//  PhoenixZC
//
//  Created by juxi-ios on 16/1/27.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import "LastLeainingViewController.h"
#import "LearnRecordCell.h"
@interface LastLeainingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSArray * dataArray;
@end

@implementation LastLeainingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _dataArray = @[@(0.6),@(0.75),@(0.1),@(0.35)];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone ;
    
    [self.tableView registerClass:[LearnRecordCell class] forCellReuseIdentifier:@"LearnRecordCell"];
//    [self.tableView registerNib:[UINib nibWithNibName:@"LearnRecordCell" bundle:nil] forCellReuseIdentifier:@"LearnRecordCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    LearnRecordCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LearnRecordCell"];
    cell.selectionStyle = 0;
    cell.textlabels.text = [NSString stringWithFormat:@"BX7 新品上市销售技巧%ld",(long)indexPath.row +1];
 
    CGFloat progress = [[self.dataArray objectAtIndex:indexPath.row] floatValue];
    
    [UIView animateWithDuration:0.5 animations:^{
        cell.progresslabels.frame = CGRectMake(0, 0, cell.backlabels.frame.size.width*progress, cell.backlabels.frame.size.height);
    } completion:^(BOOL finished) {
        cell.progressTextLabel.text =[NSString stringWithFormat:@"当前进度：%.f%%",progress*100];
    }];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
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

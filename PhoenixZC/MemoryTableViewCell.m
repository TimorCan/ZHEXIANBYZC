//
//  MemoryTableViewCell.m
//  PhoenixZC
//
//  Created by juxi-ios on 16/1/27.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import "MemoryTableViewCell.h"
#import "SNChart.h"

@interface MemoryTableViewCell()<SNChartDataSource>


@end
@implementation MemoryTableViewCell

- (void)awakeFromNib {
    // Initialization code
   

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

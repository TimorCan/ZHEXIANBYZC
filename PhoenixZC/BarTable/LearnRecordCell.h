//
//  LearnRecordCell.h
//  PhoenixZC
//
//  Created by juxi-ios on 16/1/28.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LearnRecordCell : UITableViewCell


@property(nonatomic,strong)UILabel * textlabels; //大标题

@property(nonatomic,strong)UILabel * backlabels;//进度灰度背景

@property (nonatomic,strong)UILabel *progresslabels; //进度

@property(nonatomic,strong)UIView * backGroundView; //灰度背景

@property(nonatomic,strong)UILabel * progressTextLabel; //进度文字

@end

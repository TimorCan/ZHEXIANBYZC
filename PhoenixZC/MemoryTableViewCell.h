//
//  MemoryTableViewCell.h
//  PhoenixZC
//
//  Created by juxi-ios on 16/1/27.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MemoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *lasttimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *thatTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *contentVView;
@property (weak, nonatomic) IBOutlet UIButton *learnButton;
@end

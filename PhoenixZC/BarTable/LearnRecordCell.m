//
//  LearnRecordCell.m
//  PhoenixZC
//
//  Created by juxi-ios on 16/1/28.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import "LearnRecordCell.h"

#define SCREEN_WIDTH_ZC ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT_ZC ([[UIScreen mainScreen] bounds].size.height)

// 颜色
#define COLOR_RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
@implementation LearnRecordCell

- (void)awakeFromNib {
    // Initialization code
//    @property(nonatomic,strong)UILabel * textlabels; //大标题
//    
//    @property(nonatomic,strong)UILabel * backlabels;//进度灰度背景
//    
//    @property (nonatomic,strong)UILabel *progresslabels; //进度
//    
//    @property(nonatomic,strong)UIView * backGroundView; //灰度背景
//    
//    @property(nonatomic,strong)UILabel * progressTextLabel; //进度文字
}


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
//    [super initWithStyle:style reuseIdentifier:reuseIdentifier];
   self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.clipsToBounds=YES;
        self.backGroundView = [[UIView alloc]initWithFrame:CGRectMake(5, 5,SCREEN_WIDTH_ZC-10 , 110)];
        self.backGroundView.layer.cornerRadius = 5 ;
        self.backGroundView.clipsToBounds=YES;
        self.backGroundView.backgroundColor = COLOR_RGBA(166, 166, 166, 0.2f);
        [self addSubview:self.backGroundView];
        
        self.textlabels = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 25)];
        [self addSubview:_textlabels];
        
        
        self.backlabels = [[UILabel alloc]initWithFrame:CGRectMake( self.textlabels.frame.origin.x+5, self.textlabels.frame.origin.y+self.textlabels.frame.size.height+20, SCREEN_WIDTH_ZC-30, 35)];
        self.backlabels.backgroundColor =[UIColor lightGrayColor];
        self.backlabels.layer.cornerRadius = 5 ;
        self.backlabels.clipsToBounds=YES;
        [self addSubview:self.backlabels];
        
        self.progresslabels =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.backlabels.frame.size.width*0, self.backlabels.frame.size.height)];
        self.progresslabels.backgroundColor = COLOR_RGBA(108, 170, 80, 1.f);
        [self.backlabels addSubview:self.progresslabels];
        
        self.progressTextLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 180, 25)];
        self.progressTextLabel.font =[UIFont systemFontOfSize:13.f];
        self.progressTextLabel.textColor = [UIColor whiteColor];
        self.progressTextLabel.center = CGPointMake(self.backlabels.center.x, self.backlabels.center.y);
        [self addSubview:self.progressTextLabel];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

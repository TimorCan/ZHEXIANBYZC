//
//  ChartTableBar.m
//  PhoenixZC
//
//  Created by juxi-ios on 16/1/27.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import "ChartTableBar.h"
#import "LastLeainingViewController.h"
#import "MemoryViewController.h"
@implementation ChartTableBar
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tabBar.delegate =self;
    
    self.delegate =self;
    self.title = @"你该复习的课程";
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSLog(@"tabbar==%@,item==%@",tabBar,item);
    
    if (item == [self.tabBar.items objectAtIndex:0]) {
        self.title = @"你该复习的课程";

    }
    else
    {
        self.title = @"上次学习记录";
    }
    
   
    
}

@end

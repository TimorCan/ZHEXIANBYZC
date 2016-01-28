//
//  ViewController.m
//  PhoenixZC
//
//  Created by juxi-ios on 16/1/27.
//  Copyright © 2016年 周灿. All rights reserved.
//

#import "ViewController.h"
#import "ChartTableBar.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view, typically from a nib.
    
    //跳转代码
      /********************************************/
    UIStoryboard * story =[UIStoryboard storyboardWithName:@"ChartStoryboard" bundle:nil];
    ChartTableBar * tabBar =[story instantiateViewControllerWithIdentifier:@"ChartTableBar"];
    //导航用这个注释的，把下面注释掉-
     [self.navigationController pushViewController:tabBar animated:YES];
    
    
//    UIWindow * window =[UIApplication sharedApplication].delegate.window;
//    window.rootViewController = tabBar;
    
    //跳转代码
    
  /********************************************/

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

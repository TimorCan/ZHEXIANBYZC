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
    
    UIStoryboard * story =[UIStoryboard storyboardWithName:@"ChartStoryboard" bundle:nil];
    ChartTableBar * tabBar =[story instantiateViewControllerWithIdentifier:@"ChartTableBar"];
    
    
    UIWindow * window =[UIApplication sharedApplication].delegate.window;
    
    window.rootViewController = tabBar;
    
//    [self.navigationController pushViewController:tabBar animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

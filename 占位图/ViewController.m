//
//  ViewController.m
//  占位图
//
//  Created by 胡高广 on 2017/9/13.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "ViewController.h"
#import "UIView+frameAdjust.h"

#import "NoNetWorkViewController.h"
#import "NoDataViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"占位图";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    //两个按钮
    UIButton *networkNoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    networkNoBtn.frame = CGRectMake(100, 100, 150, 100);
    [networkNoBtn setTitle:@"无网络的占位图" forState:(UIControlStateNormal)];
    networkNoBtn.backgroundColor = [UIColor brownColor];
    [networkNoBtn addTarget:self action:@selector(networkNoBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:networkNoBtn];
    
    UIButton *tableNoBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    tableNoBtn.frame = CGRectMake(100, CGRectGetMaxY(networkNoBtn.frame) + 50, 150, 100);
    [tableNoBtn setTitle:@"无数据的占位图" forState:(UIControlStateNormal)];
    tableNoBtn.backgroundColor = [UIColor brownColor];
    [tableNoBtn addTarget:self action:@selector(tableNoBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:tableNoBtn];
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark -- 按钮的点击事件
- (void)networkNoBtn
{
    NoNetWorkViewController *nonetworkVC = [[NoNetWorkViewController alloc] init];
    [self.navigationController pushViewController:nonetworkVC animated:YES];
}

- (void)tableNoBtn
{
    NoDataViewController *nodataVC = [[NoDataViewController alloc] init];
    [self.navigationController pushViewController:nodataVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  HggNoNetworkView.m
//  占位图
//
//  Created by 胡高广 on 2017/9/13.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "HggNoNetworkView.h"
#import "UIView+frameAdjust.h"
#import "SVProgressHUD.h"

#import "FileManager.h"
@implementation HggNoNetworkView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //搭建UI
        [self setUpUI];
    }
    return self;
}

/**  搭建UI  **/
- (void)setUpUI
{
    self.backgroundColor = [UIColor whiteColor];
    
    //404图片放中间
    UIImageView *noNetworkImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 125, 125)];
    noNetworkImageView.center = CGPointMake(self.frame.size.width / 2, self.height / 2);
    [self addSubview:noNetworkImageView];
    noNetworkImageView.image = [UIImage imageNamed:@"网络异常"];
    
    // 重新查看按钮
    UIButton *checkButton = [[UIButton alloc]initWithFrame:CGRectMake(0, noNetworkImageView.maxY + 24, 115, 30)];
    checkButton.centerX = self.width / 2;
    [self addSubview:checkButton];
    [checkButton.titleLabel setFont:[UIFont systemFontOfSize:15]];
    checkButton.backgroundColor = [UIColor colorWithRed:0.00 green:0.76 blue:0.66 alpha:1.00];
    [checkButton setTitle:@"重新查看" forState:UIControlStateNormal];
    [checkButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [checkButton addTarget:self action:@selector(checkNetworkButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    // 图片上面的两个label
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)]; label1.text = @"刷新一下返回店铺!";
    label1.font = [UIFont systemFontOfSize:14];
    label1.textColor = [UIColor colorWithRed:0.00 green:0.77 blue:0.68 alpha:1.00];
    label1.backgroundColor = [UIColor clearColor];
    label1.textAlignment = NSTextAlignmentCenter; [label1 sizeToFit];
    label1.centerX = self.width / 2;
    label1.maxY = noNetworkImageView.y - 21;
    [self addSubview:label1];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 15)];
    label2.text = @"您似乎迷路了";
    label2.font = [UIFont systemFontOfSize:19];
    label2.textColor = [UIColor colorWithRed:0.00 green:0.77 blue:0.67 alpha:1.00];
    label2.backgroundColor = [UIColor clearColor];
    label2.textAlignment = NSTextAlignmentCenter; [label2 sizeToFit];
    label2.centerX = self.width / 2;
    label2.maxY = label1.y - 12;
    [self addSubview:label2];
    

}

/** 重新查看按钮点击 */
- (void)checkNetworkButtonClicked{
    
    NSLog(@"jjj");
    FileManager *maa = [FileManager shareFileManager];
    
    
    if (maa.netState == 2 || maa.netState == 1) {
        // 如果有网，view消失，并且让代理方执行代理方法
        for (HggNoNetworkView *view in [self getCurrentViewController].view.subviews) {
            if ([view isMemberOfClass:[HggNoNetworkView class]]) {
                [view removeFromSuperview];
            }
        }
        // 重新加载数据
        if ([self.delegate respondsToSelector:@selector(reloadData)])
        {
            [self.delegate reloadData];
        }
    }else{
            // 如果没网，toast提示
            [SVProgressHUD showWithStatus:@"请检查你的网络连接"];
        }
}

//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentViewController
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end

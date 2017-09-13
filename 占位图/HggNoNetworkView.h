//
//  HggNoNetworkView.h
//  占位图
//
//  Created by 胡高广 on 2017/9/13.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CheckNetworkDelegate <NSObject>
@optional

/** 重新加载数据 */
- (void)reloadData;

@end
@interface HggNoNetworkView : UIView
@property (nonatomic,weak) id<CheckNetworkDelegate> delegate;

/** 占位图的重新加载按钮点击时回调 */

@end

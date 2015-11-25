//
//  LPTabBar.h
//  纯代码 主框架
//
//  Created by yc on 15/4/20.
//  Copyright (c) 2015年 wghl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPButton.h"
@class LPTabBar;
@protocol LPTabBarDelegate <NSObject>

@optional
- (void)tabBar:(LPTabBar *)tabBar didSelectIndex:(NSUInteger)selIndex;

@end

@interface LPTabBar : UIView

@property (weak, nonatomic) id<LPTabBarDelegate> delegate;

+ (instancetype)tabBar;


- (void)addTabBarButtonWithItem:(UITabBarItem *)item;

/*
 在外面修改tabbar具体选定的那个 一般是用在让用户登录的时候 没登录成功返回的时候用
 
 - (void)loginViewControllerBackCick
 {
 self.tabBarController.selectedIndex = 0; // 想要回到第几个主界面
 
 for (UIView *cover in self.tabBarController.view.subviews) {
 
 if ([cover isKindOfClass:[LPTabBar class]]) {
 
 LPButton *btn = cover.subviews[self.tabBarController.selectedIndex];
 LPButton *currentBtn = cover.subviews[2];  // 当前是第几个主界面
 
 btn.selected = YES;
 
 currentBtn.selected = NO;
 }
 
 
 }
 }
 
 */

@end

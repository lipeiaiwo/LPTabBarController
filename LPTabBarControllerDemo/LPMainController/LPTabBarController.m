//
//  LPTabBarController.m
//  纯代码 主框架
//
//  Created by yc on 15/4/20.
//  Copyright (c) 2015年 wghl. All rights reserved.
//

#import "LPTabBarController.h"
#import "LPTabBar.h"


@interface LPTabBarController ()<LPTabBarDelegate>
@property (weak, nonatomic) LPTabBar *customTabBar;

@end

@implementation LPTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addUpTabar];
    
    [self setUpAllChildViewController];
    
}

- (void)setUpAllChildViewController
{
#warning 需要修改的地方
    // 每个具体的控制器  这里全部用UITableViewController 演示
    // 到时候替换成自己对应的控制器就可以了
    // image 是没有选中的时候的图片 selImage就是选中的时候的图片 titile就是导航栏的title
    // 注意image的尺寸 最好能和我的一样
    /* 例如:
    HomeViewController *vc1 = [[HomeViewController alloc] init];
    [self setUpOneChildViewController:vc1 image:[UIImage imageNamed:@"1-2"] selImage:[UIImage imageNamed: @"1-1"] title:@"首页"]; */
    
    UITableViewController *vc1 = [[UITableViewController alloc] init];
    [self setUpOneChildViewController:vc1 image:[UIImage imageNamed:@"1-2"] selImage:[UIImage imageNamed: @"1-1"] title:@"首页"];
    
    UITableViewController *vc2 = [[UITableViewController alloc] init];
    [self setUpOneChildViewController:vc2 image:[UIImage imageNamed:@"2-2"] selImage:[UIImage imageNamed: @"2-1"] title:@"投资大厅"];
    
    UITableViewController *vc3 = [[UITableViewController alloc] init];
    [self setUpOneChildViewController:vc3 image:[UIImage imageNamed:@"4-2"] selImage:[UIImage imageNamed: @"4-1"] title:@"我的账户"];
    
    UITableViewController *vc4 = [[UITableViewController alloc] init];
    [self setUpOneChildViewController:vc4 image:[UIImage imageNamed:@"3-2"] selImage:[UIImage imageNamed: @"3-1"] title:@"更多"];
    
    // 添加一根Top线 一定要最后添加 不要可以删除
    UIViewController *vc5 = [[UIViewController alloc] init];
    [self setUpOneChildViewController:vc5 image:nil selImage:nil title:nil];
    
}


- (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title
{
    if (!image) {
        
        [self.customTabBar addTabBarButtonWithItem:nil];
        
        return;
    }
    
    vc.navigationItem.title = title;
    vc.tabBarItem.image = image;
    selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = selImage;
    
    #warning 需要修改的地方
    // 添加自定义的导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];

    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];
}

- (void)addUpTabar
{
    LPTabBar *tabar = [LPTabBar tabBar];
    
    self.customTabBar = tabar;
    
    tabar.delegate = self;
    
    tabar.frame = self.tabBar.frame;
    
    tabar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundImage"]];
    
    [self.view addSubview:tabar];
    
    [self.tabBar removeFromSuperview];
    
}

- (void)tabBar:(LPTabBar *)tabBar didSelectIndex:(NSUInteger)selIndex
{
    self.selectedIndex = selIndex;
}


@end

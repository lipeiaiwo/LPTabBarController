
这个是一套纯代码的主框架,使用非常简单,只需要创建对应的控制器,然后就可以了.

使用步骤:

1.在AppDelegate里面写上
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    LPTabBarController *tabBar = [[LPTabBarController alloc] init];
    
    self.window.rootViewController = tabBar;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}



2.再在LPTabBarController.m里面填上自己对应的控制器,几个控制器都可以

    // 到时候替换成自己对应的控制器就可以了
    // image 是没有选中的时候的图片 selImage就是选中的时候的图片 titile就是导航栏的title
    HomeViewController *vc1 = [[HomeViewController alloc] init];
    [self setUpOneChildViewController:vc1 image:[UIImage imageNamed:@"1-2"] selImage:[UIImage imageNamed: @"1-1"] title:@"首页"];
    
    InvestViewController *vc2 = [[InvestViewController alloc] init];
    [self setUpOneChildViewController:vc2 image:[UIImage imageNamed:@"2-2"] selImage:[UIImage imageNamed: @"2-1"] title:@"投资大厅"];
    
    AccountViewController *vc3 = [[AccountViewController alloc] init];
    [self setUpOneChildViewController:vc3 image:[UIImage imageNamed:@"4-2"] selImage:[UIImage imageNamed: @"4-1"] title:@"我的账户"];
    
    MoreViewController *vc4 = [[MoreViewController alloc] init];
    [self setUpOneChildViewController:vc4 image:[UIImage imageNamed:@"3-2"] selImage:[UIImage imageNamed: @"3-1"] title:@"更多"];
    
    
    
    3. 如果有自定义导航控制器就替换下 在LPTabBarController.m - (void)setUpOneChildViewController:(UIViewController *)vc image:(UIImage *)image selImage:(UIImage *)selImage title:(NSString *)title方法里面
    
    // 替换成为自己的控制器
    SLNavigationController *nav = [[SLNavigationController alloc] initWithRootViewController:vc];
    
    
    4.在添加一张tabar的背景图片 在LPTabBarController.m
    #warning 添加Tabard的背景图片
    tabar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"backgroundImage"]];
    
    
    
    到此就全部结束了. 具体的请看demo.里面更详细.

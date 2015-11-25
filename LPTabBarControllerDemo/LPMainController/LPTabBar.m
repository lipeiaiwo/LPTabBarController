//
//  LPTabBar.m
//  纯代码 主框架
//
//  Created by yc on 15/4/20.
//  Copyright (c) 2015年 wghl. All rights reserved.
//

#import "LPTabBar.h"
#import "LPButton.h"

@interface LPTabBar ()

@property (weak, nonatomic) UIButton *agoBtn;

@end

@implementation LPTabBar

+ (instancetype)tabBar
{
    LPTabBar *table = [[LPTabBar alloc] init];
    
    return table;
}

- (void)addTabBarButtonWithItem:(UITabBarItem *)item
{
    if (!item) { // 添加一根Top线
    
#warning top线的颜色
    UIImageView *backImage = [[UIImageView alloc] initWithImage:[self rgbToImage:210 g:210 b:210]];
    
        backImage.frame = self.bounds;
        
        CGRect frame = backImage.frame;
        frame.size.height = 1;
        backImage.frame = frame;
    
        [self addSubview:backImage];
        
        return;
    }
    
    NSUInteger count = self.subviews.count;
    
    UIButton *btn = [LPButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:item.title forState:UIControlStateNormal];
    
    if (count == 0) {

        btn.selected = YES;
    }
    
    [btn setImage:item.image forState:UIControlStateNormal];
    
    [btn setImage:item.selectedImage forState:UIControlStateSelected];
    
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
    
    [self addSubview:btn];
    
    
}

// rgb 转图片
- (UIImage *)rgbToImage:(CGFloat)r g:(CGFloat)g b:(CGFloat)b
{
    CGSize imageSize = CGSizeMake(100, 100);
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [[UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0] set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return pressedColorImg;
}

- (void)clickBtn:(UIButton *)btn
{
    for (UIView *view in self.subviews) {
        
        if ([view.class isSubclassOfClass:[LPButton class]]) {
            
            LPButton *tempBtn = (LPButton *)view;
            
            if (tempBtn.tag == btn.tag) {
                
                btn.selected = YES;
                
            }else{
                
                tempBtn.selected = NO;
            }
            
        }
        
    }
    
    if ([self.delegate respondsToSelector:@selector(tabBar:didSelectIndex:)]) {
        
        [self.delegate tabBar:self didSelectIndex:btn.tag - 888];
    }
    
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    NSUInteger count = 0;
    
    for (UIView *view in self.subviews) {
        
        if ([view isKindOfClass:[LPButton class]]) {
            
            count ++;
        }
    }
    
    
    CGFloat btnW = self.bounds.size.width / count;
    CGFloat btnH = self.bounds.size.height;

    
    for (int i = 0;i < count;i++) {
        
        UIButton *btn = self.subviews[i];
        
        CGFloat btnX = i * btnW;
        
        btn.frame = CGRectMake(btnX, 0, btnW, btnH);
        
        btn.tag = i + 888;
        
    }
    
    
}


@end

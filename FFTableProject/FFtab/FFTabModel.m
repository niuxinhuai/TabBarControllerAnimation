//
//  FFTabModel.m
//  FFTableProject
//
//  Created by 牛新怀 on 2017/11/17.
//  Copyright © 2017年 牛新怀. All rights reserved.
//

#import "FFTabModel.h"

@implementation FFTabModel

+ (NSArray<UIImage *>*)tabNormalImageArray{
    NSArray * normalArray = @[[FFTabModel imageViewWithName:@"01mr"],
                              [FFTabModel imageViewWithName:@"02mr"],
                              [FFTabModel imageViewWithName:@"mr03"]];
    return normalArray;
}

+ (NSArray<UIImage *>*)tabSelectImageArray{
    NSArray * selectArray = @[[FFTabModel imageViewWithName:@"01xz"],
                              [FFTabModel imageViewWithName:@"02xz"],
                              [FFTabModel imageViewWithName:@"xz03"]];
    return selectArray;
}

+ (NSArray<NSString *>*)tabTitleArray{
    NSArray * titleArray = @[@"推荐",
                             @"轻读",
                             @"我的"];
    return titleArray;
}

+ (UIImage *)imageViewWithName:(NSString *)imageName{
    UIImage *indexPic = [UIImage imageNamed:imageName];
    UIImage *indexPicT = [indexPic imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return indexPicT;
}

+ (UINavigationController *)className:(NSString *)classNamed
                             tabTitle:(NSString *)title
                       tabNormalImage:(UIImage *)normalImage
                       tabSelectImage:(UIImage *)selectImage{
    UIViewController * vc = [[NSClassFromString(classNamed) alloc]init];
    vc.tabBarItem.title = title;
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor redColor]} forState:UIControlStateSelected];
    vc.tabBarItem.image =normalImage;
    vc.tabBarItem.selectedImage = selectImage;
    vc.title = title;
    UINavigationController * navCtr = [[UINavigationController alloc]initWithRootViewController:vc];
    return navCtr;
    
}

+ (void)selectTabBarDoScaleAnimationWithView:(UIView *)animationView{
    //需要实现的帧动画,这里根据需求自定义
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.0,@1.1,@0.9,@1.05,@0.95,@1.02,@1.0];
    animation.duration = 0.6;
    animation.calculationMode = kCAAnimationCubic;
    //把动画添加上去就OK了
    [animationView.layer addAnimation:animation forKey:nil];
}

@end

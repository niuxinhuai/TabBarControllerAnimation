//
//  FFTabBar.m
//  FFTableProject
//
//  Created by 牛新怀 on 2017/11/17.
//  Copyright © 2017年 牛新怀. All rights reserved.
//

#import "FFTabBar.h"
#import <objc/runtime.h>
#import "FFTabModel.h"

@implementation FFTabBar

- (void)layoutSubviews{
    [super layoutSubviews];
    for (UIControl *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabBarButton addTarget:self action:@selector(tabBarButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        //为保证动画不会重复以及点击动画的正确性，特增加selectTabBarTag， 保证selectTabBarTag和当前tabBarController.selectedIndex一致。
        self.selectTabBarTag = 1;
    }
    return self;
}

- (void)tabBarButtonClick:(UIControl *)tabBarButton
{
    NSInteger index = [self.items indexOfObject:self.selectedItem];
    if (index != self.selectTabBarTag) {
        for (UIView *imageView in tabBarButton.subviews) {
            if ([imageView isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
                [FFTabModel selectTabBarDoScaleAnimationWithView:imageView];
            }
        }
    }
    
    self.selectTabBarTag = index;
}

#pragma mark - Associated Object
- (void)setSelectTabBarTag:(NSInteger)object{
    objc_setAssociatedObject(self, @selector(selectTabBarTag), @(object), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

- (NSInteger)selectTabBarTag{
    return [objc_getAssociatedObject(self, @selector(selectTabBarTag)) integerValue];
}

@end

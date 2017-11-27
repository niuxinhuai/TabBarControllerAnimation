//
//  FFTabModel.h
//  FFTableProject
//
//  Created by 牛新怀 on 2017/11/17.
//  Copyright © 2017年 牛新怀. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface FFTabModel : NSObject

/**
 tab默认图片数组

 @return return value description
 */
+ (NSArray<UIImage *>*)tabNormalImageArray;

/**
 tab选中状态下的图片数组

 @return return value description
 */
+ (NSArray<UIImage *>*)tabSelectImageArray;

/**
 tab文字数组

 @return return value description
 */
+ (NSArray<NSString *>*)tabTitleArray;

/**
 根据图片名字参数获取图片UIImage

 @param imageName 图片名字
 @return return value description
 */
+ (UIImage *)imageViewWithName:(NSString *)imageName;

/**
 获取导航视图

 @param classNamed vcName
 @param title tab标题
 @param normalImage tab默认状态下的图片
 @param selectImage tab选中状态下的图片
 @return return value description
 */
+ (UINavigationController *)className:(NSString *)classNamed
                             tabTitle:(NSString *)title
                       tabNormalImage:(UIImage *)normalImage
                       tabSelectImage:(UIImage *)selectImage;

/**
 tabBar点击动画
 
 @param animationView 做动画的视图
 */
+ (void)selectTabBarDoScaleAnimationWithView:(UIView *)animationView;


@end

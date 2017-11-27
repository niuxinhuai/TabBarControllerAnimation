//
//  FFTabBarController.m
//  FFTableProject
//
//  Created by 牛新怀 on 2017/11/17.
//  Copyright © 2017年 牛新怀. All rights reserved.
//

#import "FFTabBarController.h"
#import "FFTabBar.h"
#import "FFTabModel.h"
@interface FFTabBarController ()

@end

@implementation FFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configTab];
}

- (void)configTab{
    FFTabBar * tab = [[FFTabBar alloc]init];
    //kvc实质是修改了系统的_tabBar
    [self setValue:tab forKeyPath:@"tabBar"];
    NSMutableArray * navMutableArray = [[NSMutableArray alloc]init];
    [[FFTabModel tabNormalImageArray] enumerateObjectsUsingBlock:^(UIImage * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UINavigationController * navCtr = [FFTabModel className:@"ViewController"
                                                       tabTitle:[FFTabModel tabTitleArray][idx]
                                                 tabNormalImage:[FFTabModel tabNormalImageArray][idx]
                                                 tabSelectImage:[FFTabModel tabSelectImageArray][idx]];
        [navMutableArray addObject:navCtr];
    }];
    self.viewControllers = navMutableArray;
    self.selectedIndex = 1;
}

@end

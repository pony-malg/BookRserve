//
//  PublicTool.m
//  BookRserve
//
//  Created by jay on 2019/3/30.
//  Copyright © 2019 jay. All rights reserved.
//

#import "PublicTool.h"
#import "MainViewController.h"
#import "TabTwoViewController.h"
#import "TabThreeViewController.h"
#import "ViewController.h"
#import <MBProgressHUD.h>
#import "RegisterViewController.h"


@implementation PublicTool

+ (UIColor *)getColor{
    return [UIColor colorWithRed:254/255.f green:19/255.f blue:31/255.f alpha:1];
}
+ (void)gotoMainViewControlelr{
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor colorWithRed:232/255.f green:232/255.f blue:232/255.f alpha:1]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12],NSForegroundColorAttributeName:[UIColor colorWithRed:254/255.f green:19/255.f blue:31/255.f alpha:1]} forState:UIControlStateSelected];
    
    MainViewController *oneVC = [[MainViewController alloc] init];
    oneVC.title = @"发布";
    UINavigationController *mainNav = [[UINavigationController alloc] initWithRootViewController:oneVC];
    [mainNav.tabBarItem setImage:[[UIImage imageNamed:@"tabIssue"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [mainNav.tabBarItem setSelectedImage:[[UIImage imageNamed:@"tabIssueSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    TabTwoViewController *twoVC = [[TabTwoViewController alloc] init];
    twoVC.title = @"广场";
    UINavigationController *subNav = [[UINavigationController alloc] initWithRootViewController:twoVC];
    [subNav.tabBarItem setImage:[[UIImage imageNamed:@"look"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [subNav.tabBarItem setSelectedImage:[[UIImage imageNamed:@"lookSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    TabThreeViewController *threeVC = [[TabThreeViewController alloc] init];
    threeVC.title = @"读书会";
    UINavigationController *meNav = [[UINavigationController alloc] initWithRootViewController:threeVC];
    [meNav.tabBarItem setImage:[[UIImage imageNamed:@"read"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [meNav.tabBarItem setSelectedImage:[[UIImage imageNamed:@"readSelected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    UITabBarController *tabbarCon = [[UITabBarController alloc] init];
    tabbarCon.viewControllers = @[mainNav,subNav,meNav];
    
    [[[UIApplication sharedApplication] delegate] window].rootViewController = tabbarCon;
}
+ (void)gotoLoginViewControlelr{
    ViewController *vc = [[ViewController alloc] init];
    
    [[[UIApplication sharedApplication] delegate] window].rootViewController = vc;
}
+ (void)gotoRegisterViewControllerWith:(id)target{
    RegisterViewController *vc = [[RegisterViewController alloc] init];
    [target presentViewController:vc animated:YES completion:nil];
}
+ (void)backLoginViewControllerWith:(id)target{
    [target dismissViewControllerAnimated:YES completion:nil];
}
+ (void)showHUDWithText:(NSString *)text{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window] animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = text;
    hud.removeFromSuperViewOnHide = YES;
    [hud hideAnimated:YES afterDelay:0.7];
}

@end

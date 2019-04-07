//
//  ViewController.m
//  BookRserve
//
//  Created by jay on 2019/3/30.
//  Copyright © 2019 jay. All rights reserved.
//

#import "ViewController.h"
#import "PublicTool.h"
#import "CocoaSecurity.h"
#import "NetWorkTool.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    [self setData];
}
- (void)setData{
    
}
- (void)configUI{
    self.loginViewVc = [LoginView new];
    self.loginViewVc.frame = self.view.bounds;
    [self.view addSubview:self.loginViewVc];
    
    
    self.loginViewVc.myBlock = ^(NSString * _Nonnull account, NSString * _Nonnull pwd) {
        [NetWorkTool getLoginWithUsername:account userPwd:pwd completionBlock:^(NSDictionary * _Nonnull dic) {
            if ([[dic objectForKey:@"resault"] isEqualToString:@"true"]) {
                [[NSUserDefaults standardUserDefaults] setObject:account forKey:@"username"];
                [[NSUserDefaults standardUserDefaults] setObject:[dic objectForKey:@"token"] forKey:@"token"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [PublicTool gotoMainViewControlelr];
                [PublicTool showHUDWithText:@"登录成功"];
            }else{
                [PublicTool showHUDWithText:@"账号或密码错误"];
            }
        }];
    };
//    NSString *plainStr = @"lilei123";
//    CocoaSecurityResult *md5 = [CocoaSecurity md5:plainStr];
    
    __weak typeof(self)weakSelf = self;
    self.loginViewVc.myRegisterBlock = ^{
        [PublicTool gotoRegisterViewControllerWith:weakSelf];
    };
    
}

@end

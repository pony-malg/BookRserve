//
//  RegisterViewController.m
//  BookRserve
//
//  Created by jay on 2019/4/2.
//  Copyright © 2019 jay. All rights reserved.
//

#import "RegisterViewController.h"
#import "PublicTool.h"
#import "NetWorkTool.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
}
- (void)configUI{
    self.reView = [RegisterView new];
    self.reView.frame = self.view.bounds;
    [self.view addSubview:self.reView];
    __weak typeof(self)weakSelf = self;
    self.reView.backLoingBlock = ^(NSString * _Nonnull userNa, NSString * _Nonnull pwd) {
        [NetWorkTool getRegisterWithUsername:userNa userPwd:pwd completionBlock:^(NSDictionary * _Nonnull dic) {
            if ([[dic objectForKey:@"resault"] isEqualToString:@"true"]) {
                [PublicTool backLoginViewControllerWith:weakSelf];
                [PublicTool showHUDWithText:@"注册成功"];
            }else{
            [PublicTool showHUDWithText:@"发生未知错误"];
            }
        }];
        
    };
    self.reView.canBlock = ^{
        [PublicTool backLoginViewControllerWith:weakSelf];
    };
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

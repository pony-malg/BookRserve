//
//  LoginView.m
//  BookRserve
//
//  Created by jay on 2019/3/30.
//  Copyright © 2019 jay. All rights reserved.
//

#import "LoginView.h"
#import <Masonry.h>
#import "PublicTool.h"


@implementation LoginView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}
- (void)configUI{
    // 背景图
    self.bgImageView = [[UIImageView alloc] init];
    self.bgImageView.backgroundColor = [UIColor orangeColor];
    self.bgImageView.image = [UIImage imageNamed:@"bgLogo"];
    self.bgImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.bgImageView.alpha = 1;
    [self addSubview:self.bgImageView];
    [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    // 用户名
    UIView *userView = [UIView new];
    [self addSubview:userView];
    [userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(self.mas_centerY).offset(-100);
        make.height.mas_equalTo(40);
    }];
    UIImageView *userImg = [[UIImageView alloc] init];
    userImg.image = [UIImage imageNamed:@"yonghu"];
    [userView addSubview:userImg];
    [userImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
        make.left.equalTo(userView);
        make.centerY.equalTo(userView);
    }];
    UIView *line1 = [UIView new];
    line1.backgroundColor = [UIColor whiteColor];
    [userView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(userView);
        make.left.right.equalTo(userView);
        make.height.mas_equalTo(0.5);
    }];
    self.accountTextField = [[UITextField alloc] init];
    NSAttributedString *placeholder1 = [[NSAttributedString alloc] initWithString:@"请输入账号" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.accountTextField.attributedPlaceholder = placeholder1;
    self.accountTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.accountTextField.borderStyle = UITextBorderStyleNone;
    self.accountTextField.font = [UIFont boldSystemFontOfSize:16];
    self.accountTextField.textColor = [UIColor whiteColor];
    [userView addSubview:self.accountTextField];
    [self.accountTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(userView);
        make.left.equalTo(userImg.mas_right).offset(10);
    }];
    // 密码
    UIView *pwdView = [UIView new];
    [self addSubview:pwdView];
    [pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userView.mas_bottom).offset(15);
        make.left.right.height.equalTo(userView);
    }];
    UIImageView *pwdImg = [[UIImageView alloc] init];
    pwdImg.image = [UIImage imageNamed:@"mima"];
    [pwdView addSubview:pwdImg];
    [pwdImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
        make.left.equalTo(pwdView);
        make.centerY.equalTo(pwdView);
    }];
    UIView *line2 = [UIView new];
    line2.backgroundColor = [UIColor whiteColor];
    [pwdView addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(pwdView);
        make.left.right.equalTo(pwdView);
        make.height.mas_equalTo(0.5);
    }];
    self.pwdTextField = [[UITextField alloc] init];
    NSAttributedString *placeholder2 = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.pwdTextField.attributedPlaceholder = placeholder2;
    self.pwdTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.pwdTextField.borderStyle = UITextBorderStyleNone;
    self.pwdTextField.font = [UIFont boldSystemFontOfSize:16];
    self.pwdTextField.textColor = [UIColor whiteColor];
    self.pwdTextField.secureTextEntry = YES;
    [pwdView addSubview:self.pwdTextField];
    [self.pwdTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(pwdView);
        make.left.equalTo(pwdImg.mas_right).offset(10);
    }];
    //登录
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.loginBtn.layer.borderWidth = 0.5;
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
    [self.loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(pwdView);
        make.top.equalTo(pwdView.mas_bottom).offset(50);
        make.height.mas_equalTo(40);
    }];
    //注册
    self.registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.registerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.registerBtn.layer.borderWidth = 0.5;
    self.registerBtn.layer.cornerRadius = 5;
    self.registerBtn.layer.masksToBounds = YES;
    [self.registerBtn setTitle:@"注册新用户" forState:UIControlStateNormal];
    [self.registerBtn addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.registerBtn];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(pwdView);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(40);
    }];
}
- (void)loginBtnClick{
    if (self.accountTextField.text.length == 0 || self.pwdTextField.text.length == 0) {
        [PublicTool showHUDWithText:@"账号密码不能为空"];
        return;
    }
    NSString *passWordRegex = @"^[a-zA-Z0-9-_]{6,16}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    if (![passWordPredicate evaluateWithObject:self.accountTextField.text]) {
        [PublicTool showHUDWithText:@"用户名格式不正确"];
        return;
    }
    //    登陆密码
    if (![passWordPredicate evaluateWithObject:self.pwdTextField.text]) {
        [PublicTool showHUDWithText:@"密码格式不正确"];
        return;
    }
    if (self.myBlock) {
        self.myBlock(self.accountTextField.text, self.pwdTextField.text);
    }
}
- (void)registerBtnClick{
    if (self.myRegisterBlock) {
        self.myRegisterBlock();
    }
}

@end

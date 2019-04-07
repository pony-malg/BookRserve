//
//  RegisterView.m
//  BookRserve
//
//  Created by jay on 2019/4/2.
//  Copyright © 2019 jay. All rights reserved.
//

#import "RegisterView.h"
#import <Masonry.h>
#import "PublicTool.h"

@implementation RegisterView

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
        make.top.equalTo(self.mas_centerY).multipliedBy(0.5);
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
    NSAttributedString *placeholder1 = [[NSAttributedString alloc] initWithString:@"用户名" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
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
    UILabel *tipOne = [UILabel new];
    tipOne.textColor = [UIColor colorWithRed:236/255.f green:236/255.f blue:236/255.f alpha:0.5];
    tipOne.text = @"6-16位字母、数字或“_”、“-”组成";
    tipOne.textAlignment = NSTextAlignmentRight;
    tipOne.font = [UIFont systemFontOfSize:12];
    [self addSubview:tipOne];
    [tipOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userView.mas_bottom);
        make.left.right.equalTo(self.accountTextField);
        make.height.mas_equalTo(15);
    }];
    // 密码
    UIView *pwdView = [UIView new];
    [self addSubview:pwdView];
    [pwdView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(userView.mas_bottom).offset(25);
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
    NSAttributedString *placeholder2 = [[NSAttributedString alloc] initWithString:@"设置密码" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
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
    UILabel *tipTwo = [UILabel new];
    tipTwo.textColor = [UIColor colorWithRed:236/255.f green:236/255.f blue:236/255.f alpha:0.5];
    tipTwo.text = @"6-16位字母、数字或“_”、“-”组成";
    tipTwo.textAlignment = NSTextAlignmentRight;
    tipTwo.font = [UIFont systemFontOfSize:12];
    [self addSubview:tipTwo];
    [tipTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdView.mas_bottom);
        make.left.right.equalTo(self.pwdTextField);
        make.height.mas_equalTo(15);
    }];
    // 确认密码
    UIView *pwdSureView = [UIView new];
    [self addSubview:pwdSureView];
    [pwdSureView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(pwdView.mas_bottom).offset(25);
        make.left.right.height.equalTo(userView);
    }];
    UIImageView *pwdSureImg = [[UIImageView alloc] init];
    pwdSureImg.image = [UIImage imageNamed:@"mimaSure"];
    [pwdSureView addSubview:pwdSureImg];
    [pwdSureImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(20);
        make.left.equalTo(pwdSureView);
        make.centerY.equalTo(pwdSureView);
    }];
    UIView *line3 = [UIView new];
    line3.backgroundColor = [UIColor whiteColor];
    [pwdSureView addSubview:line3];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(pwdSureView);
        make.left.right.equalTo(pwdSureView);
        make.height.mas_equalTo(0.5);
    }];
    self.pwdSureTextField = [[UITextField alloc] init];
    NSAttributedString *placeholder3 = [[NSAttributedString alloc] initWithString:@"确认密码" attributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]}];
    self.pwdSureTextField.attributedPlaceholder = placeholder3;
    self.pwdSureTextField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.pwdSureTextField.borderStyle = UITextBorderStyleNone;
    self.pwdSureTextField.font = [UIFont boldSystemFontOfSize:16];
    self.pwdSureTextField.textColor = [UIColor whiteColor];
    self.pwdSureTextField.secureTextEntry = YES;
    [pwdSureView addSubview:self.pwdSureTextField];
    [self.pwdSureTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.equalTo(pwdSureView);
        make.left.equalTo(pwdSureImg.mas_right).offset(10);
    }];
    //注册
    self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.loginBtn.layer.borderWidth = 0.5;
    self.loginBtn.layer.cornerRadius = 5;
    self.loginBtn.layer.masksToBounds = YES;
    [self.loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.loginBtn addTarget:self action:@selector(loginBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.loginBtn];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(pwdSureView);
        make.top.equalTo(pwdSureView.mas_bottom).offset(50);
        make.height.mas_equalTo(40);
    }];
    //取消cancelBtn
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.cancelBtn.layer.borderWidth = 0.5;
    self.cancelBtn.layer.cornerRadius = 5;
    self.cancelBtn.layer.masksToBounds = YES;
    [self.cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [self.cancelBtn addTarget:self action:@selector(cancelBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(pwdSureView);
        make.top.equalTo(self.loginBtn.mas_bottom).offset(10);
        make.height.mas_equalTo(40);
    }];
}
    
- (void)loginBtnClick{
    //    这里要判断用户名
    if (self.accountTextField.text.length<=0) {
        [PublicTool showHUDWithText:@"用户名不能为空"];
        return;
    }
    
    NSString *passWordRegex = @"^[a-zA-Z0-9-_]{6,16}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    if (![passWordPredicate evaluateWithObject:self.accountTextField.text]) {
        [PublicTool showHUDWithText:@"用户名格式不正确"];
        return;
    }
    //    登陆密码
    if (self.pwdTextField.text.length<=0) {
        [PublicTool showHUDWithText:@"密码不能为空"];
        return;
    }
    if (![passWordPredicate evaluateWithObject:self.pwdTextField.text]) {
       [PublicTool showHUDWithText:@"密码格式不正确"];
        return;
    }
    //    确认密码
    if (self.pwdSureTextField.text.length<=0) {
        [PublicTool showHUDWithText:@"请确认密码"];
    }
    if (![self.pwdSureTextField.text isEqualToString:self.pwdTextField.text]) {
        [PublicTool showHUDWithText:@"两次密码输入不一致"];
        return;
    }
    if (self.backLoingBlock) {
        self.backLoingBlock(self.accountTextField.text, self.pwdTextField.text);
    }
}
- (void)cancelBtnClick{
    if (self.canBlock) {
        self.canBlock();
    }
}
@end

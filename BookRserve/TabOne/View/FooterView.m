//
//  FooterView.m
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import "FooterView.h"
#import "PublicTool.h"
#import <Masonry.h>

@implementation FooterView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}
- (void)configUI{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [PublicTool getColor];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    [btn setTitle:@"发布" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(issueButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.bottom.equalTo(self).offset(-20);
    }];
}
- (void)issueButtonClick{
    if (self.myFooterButtonBlock) {
        self.myFooterButtonBlock();
    }
}
@end

//
//  HeaderView.m
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import "HeaderView.h"
#import <Masonry.h>
#import "PublicTool.h"

@implementation HeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self configUI];
    }
    return self;
}
- (void)configUI{
    self.bookJoin = [UIButton buttonWithType:UIButtonTypeCustom];
    self.bookJoin.layer.borderColor = [[PublicTool getColor] CGColor];
    self.bookJoin.layer.borderWidth = 1;
    self.bookJoin.tag = 1051;
    self.bookJoin.titleLabel.numberOfLines = 2;
    self.bookJoin.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.bookJoin.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.bookJoin setTitleColor:[PublicTool getColor] forState:UIControlStateNormal];
    [self.bookJoin setTitle:@"我参加的\n读书会" forState:UIControlStateNormal];
    self.bookJoin.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.bookJoin addTarget:self action:@selector(bookJoinClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.bookJoin];
    
    
    self.bookSell = [UIButton buttonWithType:UIButtonTypeCustom];
    self.bookSell.layer.borderColor = [[PublicTool getColor] CGColor];
    self.bookSell.layer.borderWidth = 1;
    self.bookSell.tag = 1052;
    self.bookSell.titleLabel.numberOfLines = 2;
    self.bookSell.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.bookSell.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.bookSell setTitleColor:[PublicTool getColor] forState:UIControlStateNormal];
    [self.bookSell setTitle:@"我发布的\n书单" forState:UIControlStateNormal];
    self.bookSell.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.bookSell addTarget:self action:@selector(bookJoinClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.bookSell];

    
    
    self.bookBuy = [UIButton buttonWithType:UIButtonTypeCustom];
    self.bookBuy.layer.borderColor = [[PublicTool getColor] CGColor];
    self.bookBuy.layer.borderWidth = 1;
    self.bookBuy.tag = 1053;
    self.bookBuy.titleLabel.numberOfLines = 2;
    self.bookBuy.titleLabel.adjustsFontSizeToFitWidth = YES;
    self.bookBuy.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.bookBuy setTitleColor:[PublicTool getColor] forState:UIControlStateNormal];
    [self.bookBuy setTitle:@"我拍下的\n书单" forState:UIControlStateNormal];
    self.bookBuy.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.bookBuy addTarget:self action:@selector(bookJoinClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.bookBuy];
    
     
    
    [@[self.bookJoin,self.bookSell,self.bookBuy] mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:30 leadSpacing:30 tailSpacing:30];
    [@[self.bookJoin,self.bookSell,self.bookBuy] mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(30);
        make.height.mas_equalTo(60);
    }];
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [PublicTool getColor];
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bookBuy.mas_bottom).offset(10);
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.mas_equalTo(1);
    }];
    
    UIButton *sellBookBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sellBookBtn.layer.borderColor = [[PublicTool getColor] CGColor];
    sellBookBtn.layer.borderWidth = 1;
    sellBookBtn.layer.cornerRadius = 20;
    sellBookBtn.layer.masksToBounds = YES;
    sellBookBtn.tag = 1054;
    [sellBookBtn setTitle:@"发布我的二手书" forState:UIControlStateNormal];
    [sellBookBtn setTitleColor:[PublicTool getColor] forState:UIControlStateNormal];
    [sellBookBtn addTarget:self action:@selector(bookJoinClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:sellBookBtn];
    [sellBookBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView).offset(20);
        make.left.right.equalTo(lineView);
        make.height.mas_equalTo(40);
    }];
    
    UIView *bottonLineView = [UIView new];
    bottonLineView.backgroundColor = [UIColor whiteColor];
    [self addSubview:bottonLineView];
    [bottonLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sellBookBtn.mas_bottom).offset(20);
        make.left.right.equalTo(self);
        make.height.mas_equalTo(3);
    }];
    UILabel *listLabel  = [[UILabel alloc] init];
    listLabel.text = @"   我发布的书单:";
    [self addSubview:listLabel];
    [listLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottonLineView.mas_bottom);
        make.left.right.equalTo(bottonLineView);
        make.bottom.equalTo(self);
    }];
}

- (void)bookJoinClick:(UIButton *)sender{
    if (self.myHeadBlock) {
        self.myHeadBlock(sender.tag);
    }
}
@end

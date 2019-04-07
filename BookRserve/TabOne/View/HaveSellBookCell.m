//
//  HaveSellBookTableViewCell.m
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import "HaveSellBookCell.h"
#import <Masonry.h>
#import "PublicTool.h"

@implementation HaveSellBookCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configUI];
    }
    return self;
}

- (void)configUI{
    self.bookName = [[UILabel alloc] init];
    //self.bookName.backgroundColor = [UIColor yellowColor];
    self.bookName.text = @"书名：";
    [self.contentView addSubview:self.bookName];
    [self.bookName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        make.height.mas_equalTo(40);
    }];
    self.issueTime = [[UILabel alloc] init];
    //self.issueTime.backgroundColor = [UIColor yellowColor];
    self.issueTime.text = @"发布时间：";
    [self.contentView addSubview:self.issueTime];
    [self.issueTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bookName.mas_bottom).offset(5);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        make.height.mas_equalTo(40);
    }];
    self.addressBook = [[UILabel alloc] init];
    //self.addressBook.backgroundColor = [UIColor yellowColor];
    self.addressBook.text = @"发布地址：";
    [self.contentView addSubview:self.addressBook];
    [self.addressBook mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.issueTime.mas_bottom).offset(5);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        make.height.mas_equalTo(40);
    }];
    self.buyer = [[UILabel alloc] init];
    //self.buyer.backgroundColor = [UIColor yellowColor];
    self.buyer.text = @"购买人姓名：";
    [self.contentView addSubview:self.buyer];
    [self.buyer mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressBook.mas_bottom).offset(5);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-20);
        make.height.mas_equalTo(40);
    }];
    //打电话button
    UIButton *telBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [telBtn setTitle:@"与TA沟通" forState:UIControlStateNormal];
    [telBtn addTarget:self action:@selector(telBtnClick) forControlEvents:UIControlEventTouchUpInside];
    telBtn.backgroundColor = [PublicTool getColor];
    [self.contentView addSubview:telBtn];
    [telBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buyer.mas_bottom).offset(5);
        make.right.equalTo(self.contentView).offset(-20);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(100);
    }];
    self.buyerTel = [[UILabel alloc] init];
    //self.buyerTel.backgroundColor = [UIColor yellowColor];
    self.buyerTel.text = @"购买人电话：";
    [self.contentView addSubview:self.buyerTel];
    [self.buyerTel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buyer.mas_bottom).offset(5);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(telBtn.mas_left).offset(-5);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
}
- (void)telBtnClick{
    
    if (self.mySellBlock) {
        self.mySellBlock(self.buyerTel.text);
    }
}
@end

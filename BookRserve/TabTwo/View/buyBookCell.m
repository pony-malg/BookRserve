//
//  buyBookCell.m
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import "buyBookCell.h"
#import <Masonry.h>
#import "PublicTool.h"

@implementation buyBookCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
- (void)configUI{
    UIView *bgUpView = [[UIView alloc] init];
    bgUpView.backgroundColor = [UIColor colorWithRed:246/255.f green:246/255.f blue:246/255.f alpha:1];
    [self.contentView addSubview:bgUpView];
    [bgUpView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(90);
    }];
    
    self.bookName = [[UILabel alloc] init];
    //self.bookName.text = @"书名：《科学配比 均衡膳食》";
    self.bookName.font = [UIFont systemFontOfSize:15];
    [bgUpView addSubview:self.bookName];
    [self.bookName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgUpView).offset(10);
        make.right.equalTo(bgUpView).offset(-20);
        make.left.equalTo(bgUpView).offset(20);
        make.height.mas_equalTo(20);
    }];
    
    self.authorLabel = [[UILabel alloc] init];
    //self.authorLabel.text = @"作者：易中天";
    self.authorLabel.font = [UIFont systemFontOfSize:15];
    [bgUpView addSubview:self.authorLabel];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bookName.mas_bottom).offset(6);
        make.right.equalTo(bgUpView).offset(-20);
        make.left.equalTo(bgUpView).offset(20);
        make.height.mas_equalTo(20);
    }];
    
    self.house = [[UILabel alloc] init];
    //self.house.text = @"出版社：同济大学出版社";
    self.house.font = [UIFont systemFontOfSize:15];
    [bgUpView addSubview:self.house];
    [self.house mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authorLabel.mas_bottom).offset(6);
        make.right.equalTo(bgUpView).offset(-20);
        make.left.equalTo(bgUpView).offset(20);
        make.bottom.equalTo(bgUpView).offset(-10);
    }];
    
    self.dealBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.dealBtn.layer.cornerRadius = 5;
    self.dealBtn.layer.masksToBounds = YES;
    self.dealBtn.backgroundColor = [PublicTool getColor];
    [self.dealBtn setTitle:@"拍下" forState:UIControlStateNormal];
    self.dealBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.dealBtn addTarget:self action:@selector(dealBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.dealBtn];
    [self.dealBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgUpView.mas_bottom).offset(10);
        make.right.equalTo(self.contentView).offset(-20);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    self.oldDegree = [[UILabel alloc] init];
    //self.oldDegree.text = @"7成新";
    [self.contentView addSubview:self.oldDegree];
    [self.oldDegree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgUpView.mas_bottom).offset(10);
        make.right.equalTo(self.dealBtn.mas_left).offset(-10);
        make.left.equalTo(self.contentView).offset(20);
        make.height.mas_equalTo(30);
    }];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.font = [UIFont systemFontOfSize:13];
    //self.timeLabel.text = @"2019-09-89";
    self.timeLabel.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.oldDegree.mas_bottom).offset(10);
        make.right.equalTo(self.contentView).offset(-20);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    self.Person = [[UILabel alloc] init];
    //self.Person.text = @"发布人：谵语哟";
    [self.contentView addSubview:self.Person];
    [self.Person mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel);
        make.left.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.timeLabel.mas_left);
        make.height.mas_equalTo(30);
    }];
    
    self.addressLabel = [[UILabel alloc] init];
    //self.addressLabel.text = @"地址：日系喽觉得老骥伏枥";
    [self.contentView addSubview:self.addressLabel];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-20);
        make.left.equalTo(self.contentView).offset(20);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.height.mas_equalTo(30);
    }];
    
    self.teleLabel = [[UILabel alloc] init];
    //self.teleLabel.text = @"联系方式:123452345";
    [self.contentView addSubview:self.teleLabel];
    [self.teleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.Person.mas_bottom).offset(10);
        make.right.equalTo(self.contentView).offset(-20);
        make.left.equalTo(self.contentView).offset(20);
        make.bottom.equalTo(self.addressLabel.mas_top).offset(-10);
    }];
}
- (void)dealBtnClick:(UIButton *)sender{
    if (self.buyBookBlock) {
        self.buyBookBlock();
    }
}
@end

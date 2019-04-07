//
//  MyBookCell.m
//  BookRserve
//
//  Created by jay on 2019/4/2.
//  Copyright © 2019 jay. All rights reserved.
//

#import "MyBookCell.h"
#import <Masonry.h>
#import "PublicTool.h"

@implementation MyBookCell

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
        make.left.equalTo(bgUpView).offset(25);
        make.height.mas_equalTo(20);
    }];
    
    self.authorLabel = [[UILabel alloc] init];
    //self.authorLabel.text = @"作者：易中天";
    self.authorLabel.font = [UIFont systemFontOfSize:15];
    [bgUpView addSubview:self.authorLabel];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bookName.mas_bottom).offset(6);
        make.right.equalTo(bgUpView).offset(-20);
        make.left.equalTo(bgUpView).offset(25);
        make.height.mas_equalTo(20);
    }];
    
    self.house = [[UILabel alloc] init];
    //self.house.text = @"出版社：同济大学出版社";
    self.house.font = [UIFont systemFontOfSize:15];
    [bgUpView addSubview:self.house];
    [self.house mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.authorLabel.mas_bottom).offset(6);
        make.right.equalTo(bgUpView).offset(-20);
        make.left.equalTo(bgUpView).offset(25);
        make.bottom.equalTo(bgUpView).offset(-10);
    }];
    
    self.time = [[UILabel alloc] init];
    //self.time.text = @"发布时间：3029-09-34";
    [self.contentView addSubview:self.time];
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgUpView.mas_bottom).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.left.equalTo(self.contentView).offset(25);
        make.height.mas_equalTo(30);
    }];
    
    self.address = [[UILabel alloc] init];
    //self.address.text = @"发布地址:日新楼-三楼";
    [self.contentView addSubview:self.address];
    [self.address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.time.mas_bottom).offset(10);
        make.right.equalTo(self.contentView).offset(-20);
        make.left.equalTo(self.contentView).offset(25);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    UIView *verticalLine = [UIView new];
    verticalLine.backgroundColor = [PublicTool getColor];
    [self.contentView addSubview:verticalLine];
    [verticalLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(self.contentView).offset(15);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(1);
    }];
}

@end

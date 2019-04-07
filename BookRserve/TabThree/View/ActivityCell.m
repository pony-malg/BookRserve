//
//  ActivityCell.m
//  GraduateProj
//
//  Created by jay on 2019/2/18.
//  Copyright © 2019 mlg. All rights reserved.
//

#import "ActivityCell.h"
#import <MBProgressHUD.h>
#import <Masonry.h>
#import "PublicTool.h"

@implementation ActivityCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self configUI];
    }
    return self;
}

- (void)configUI{
    self.localImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"didian"]];
    [self.contentView addSubview:self.localImage];
    [self.localImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.contentView).offset(15);
        make.height.width.mas_equalTo(16);
    }];
    
    self.loacalLabel = [[UILabel alloc] init];
    //self.loacalLabel.backgroundColor = [UIColor yellowColor];
    self.loacalLabel.numberOfLines = 0;
    self.loacalLabel.font = [UIFont systemFontOfSize:15];
    //self.loacalLabel.text = @"活动地点：田家炳活动中心4楼352室";
    [self.contentView addSubview:self.loacalLabel];
    [self.loacalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.localImage.mas_right).offset(10);
        make.top.equalTo(self.localImage);
        make.right.equalTo(self.contentView).offset(-15);
    }];
    
    self.detailImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"huodong"]];
    [self.contentView addSubview:self.detailImage];
    [self.detailImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.localImage);
        make.top.equalTo(self.loacalLabel.mas_bottom).offset(10);
        make.height.width.mas_equalTo(16);
    }];
    
    self.detailLabel = [[UILabel alloc] init];
    self.detailLabel.numberOfLines = 0;
    self.detailLabel.font = [UIFont systemFontOfSize:15];
    //self.detailLabel.text = @"活动内容：关于《红楼梦》的赏析。";
   // self.detailLabel.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.detailImage);
        make.left.equalTo(self.detailImage.mas_right).offset(10);
        make.right.equalTo(self.loacalLabel);
    }];
    
    self.timeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shijian"]];
    [self.contentView addSubview:self.timeImage];
    [self.timeImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.localImage);
        make.top.equalTo(self.detailLabel.mas_bottom).offset(10);
        make.height.width.mas_equalTo(16);
    }];
    
    self.timeLabel = [[UILabel alloc] init];
    self.timeLabel.numberOfLines = 0;
    self.timeLabel.font = [UIFont systemFontOfSize:15];
    self.timeLabel.text = @"活动时间：3月29号 16:30";
    //self.timeLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeImage);
        make.left.equalTo(self.timeImage.mas_right).offset(10);
        make.right.equalTo(self.loacalLabel);
    }];
    
    self.personImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"faqiren"]];
    [self.contentView addSubview:self.personImage];
    [self.personImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.localImage);
        make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
        make.height.width.mas_equalTo(16);
    }];
    
    self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.addBtn.backgroundColor = [PublicTool getColor];
    self.addBtn.layer.cornerRadius = 3;
    self.addBtn.layer.masksToBounds = YES;
    [self.contentView addSubview:self.addBtn];
    self.addBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.addBtn setTitle:@"点击参与" forState:UIControlStateNormal];
    [self.addBtn addTarget:self action:@selector(addButtonMethod) forControlEvents:UIControlEventTouchUpInside];
    [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.personImage);
        make.right.equalTo(self.loacalLabel);
        make.width.mas_equalTo(60);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
    
    self.personLabel = [[UILabel alloc] init];
    self.personLabel.numberOfLines = 0;
    self.personLabel.font = [UIFont systemFontOfSize:15];
    //self.personLabel.text = @"发起人：郭老师";
    //self.personLabel.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:self.personLabel];
    [self.personLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.personImage);
        make.left.equalTo(self.personImage.mas_right).offset(10);
        make.right.equalTo(self.addBtn.mas_left).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
    }];
}
- (void)addButtonMethod{
    if (self.addClick) {
        self.addClick();
    }
}
@end

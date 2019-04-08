//
//  AboutUsView.m
//  PhysicalTest
//
//  Created by jay on 2019/3/28.
//  Copyright © 2019 jay. All rights reserved.
//

#import "AboutUsView.h"
#import <Masonry.h>

@interface AboutUsView ()

@end

@implementation AboutUsView

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}
- (void)configUI{
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *iconImageView = [[UIImageView alloc] init];
    iconImageView.backgroundColor = [UIColor lightGrayColor];
    iconImageView.layer.cornerRadius = 10;
    iconImageView.image = [UIImage imageNamed:@"logo图片"];
    iconImageView.layer.masksToBounds = YES;
    [self.view addSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(84);
        make.size.mas_equalTo(CGSizeMake(200, 200));
    }];
    
    UILabel *versonLabel = [[UILabel alloc] init];
    versonLabel.text = @"二手书发布与淘书平台，同时不定期发布线下读书会。供用户参与交流，一起分享读书的乐趣。";
    versonLabel.numberOfLines = 0;
    versonLabel.font = [UIFont boldSystemFontOfSize:15];
    versonLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:versonLabel];
    [versonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImageView.mas_bottom).offset(5);
        make.left.right.equalTo(iconImageView);
        make.height.mas_equalTo(80);
    }];
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

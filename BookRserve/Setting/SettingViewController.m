//
//  SettingViewController.m
//  BookRserve
//
//  Created by jay on 2019/4/8.
//  Copyright © 2019 jay. All rights reserved.
//

#import "SettingViewController.h"
#import "PublicTool.h"
#import <Masonry.h>
#import "AboutUsView.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,copy)NSArray *arr;

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self configUI];
    
}
- (void)setData{
    _arr = @[@"关于我们",@"退出登录"];
}
- (void)configUI{
    self.view.backgroundColor = [UIColor whiteColor];
    _myTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    _myTable.estimatedRowHeight = 50;
    _myTable.tableHeaderView = [self getHeaderImageView];
    [_myTable registerClass:[UITableViewCell class] forCellReuseIdentifier:@"setCell"];
    [self.view addSubview:_myTable];
}
- (UIView *)getHeaderImageView{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 220)];
    UIImageView *headImage = [[UIImageView alloc] init];
    headImage.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-150)/2, 20, 150, 150);
    headImage.backgroundColor = [PublicTool getColor];
    headImage.image = [UIImage imageNamed:@"headImage"];
    headImage.layer.cornerRadius = 75;
    headImage.layer.masksToBounds = true;
    [bgView addSubview:headImage];
    
    UILabel *nameLab = [[UILabel alloc] initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-150)/2, 180, 150, 30)];
    NSUserDefaults *users = [NSUserDefaults standardUserDefaults];
    nameLab.text = [users objectForKey:@"username"];
    nameLab.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:nameLab];
    return bgView;
}
- (UIView *)getHeaderView{
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 60)];
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.layer.cornerRadius = 5;
    nameLabel.layer.borderWidth = 1;
    nameLabel.layer.borderColor = [[PublicTool getColor] CGColor];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.layer.masksToBounds = YES;
    nameLabel.adjustsFontSizeToFitWidth = YES;
    NSUserDefaults *users = [NSUserDefaults standardUserDefaults];
    nameLabel.text = [users objectForKey:@"username"];
    nameLabel.textColor = [PublicTool getColor];
    [bgView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView).offset(40);
        make.top.equalTo(bgView).offset(10);
        make.bottom.equalTo(bgView).offset(-10);
        make.width.mas_equalTo(120);
    }];
    UIButton *outBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    outBtn.layer.cornerRadius = 5;
    outBtn.layer.masksToBounds = YES;
    outBtn.layer.borderColor = [[UIColor whiteColor] CGColor];
    outBtn.layer.borderWidth = 1;
    [outBtn setTitle:@"退出" forState:UIControlStateNormal];
    outBtn.backgroundColor = [UIColor colorWithRed:213/255.f green:213/255.f blue:213/255.f alpha:1];
    [outBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [outBtn addTarget:self action:@selector(outLoginClick) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:outBtn];
    [outBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bgView).offset(-20);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(30);
        make.centerY.equalTo(bgView);
    }];
    return bgView;
}
- (void)outLoginClick{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"是否退出登录" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"username"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [PublicTool gotoLoginViewControlelr];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    [alert addAction:action1];
    [alert addAction:action2];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}
#pragma mark - table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"setCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [self.arr objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        AboutUsView *vc = [[AboutUsView alloc] init];
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:YES];
        self.hidesBottomBarWhenPushed = NO;
    }else{
        [self outLoginClick];
    }
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

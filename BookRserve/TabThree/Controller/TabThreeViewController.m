//
//  TabThreeViewController.m
//  BookRserve
//
//  Created by jay on 2019/3/30.
//  Copyright © 2019 jay. All rights reserved.
//

#import "TabThreeViewController.h"
#import "ActivityCell.h"
#import <Masonry.h>
#import "PublicTool.h"
#import "NetWorkTool.h"
#import "PartyModel.h"
#import "GetPartyModel.h"
#import "YYModel.h"
#import <MBProgressHUD.h>

@interface TabThreeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *arr;

@end

@implementation TabThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setData];
    [self configUI];
    
}
- (void)setData{
    [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window] animated:YES];
    
    _arr = [NSMutableArray array];
    [NetWorkTool getPartyWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] completionBlock:^(NSDictionary * _Nonnull dic) {
        GetPartyModel *getP = [GetPartyModel yy_modelWithDictionary:dic];
        for (PartyModel *party in getP.partys) {
            [self.arr addObject:party];
        }
        //主线程刷新数据
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myTable reloadData];
            [MBProgressHUD hideHUDForView:[[[UIApplication sharedApplication] delegate] window]  animated:YES];
        });
    }];
}
- (void)configUI{
    self.view.backgroundColor = [UIColor whiteColor];
    _myTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    _myTable.tableHeaderView = [self getHeaderView];
    [self.view addSubview:_myTable];
    [_myTable registerClass:[ActivityCell class] forCellReuseIdentifier:@"activityCell"];
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
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityCell *cell = [[ActivityCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"activityCell"];
    PartyModel *p = [_arr objectAtIndex:indexPath.row];
    cell.loacalLabel.text = [NSString stringWithFormat:@"活动地点：%@",[p.address stringByRemovingPercentEncoding]];
    cell.detailLabel.text = [NSString stringWithFormat:@"活动内容：%@",[p.content stringByRemovingPercentEncoding]];
    cell.timeLabel.text = [NSString stringWithFormat:@"活动时间：%@",p.time];
    cell.personLabel.text = [NSString stringWithFormat:@"发起人：%@",[p.leading stringByRemovingPercentEncoding]];
    if ([p.isJoined isEqualToString:@"0"]) {//未参与
        [cell.addBtn setTitle:@"点击参与" forState:UIControlStateNormal];
        cell.addBtn.userInteractionEnabled = YES;
        cell.addBtn.backgroundColor = [PublicTool getColor];
    }else{
        [cell.addBtn setTitle:@"已参与" forState:UIControlStateNormal];
        cell.addBtn.userInteractionEnabled = NO;
        cell.addBtn.backgroundColor = [UIColor orangeColor];
    }
    cell.addClick = ^{
        //参与读书会
        [NetWorkTool takePartInWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] UUID:p.UUID completionBlock:^(NSDictionary * _Nonnull dic) {
            if ([[dic objectForKey:@"resault"] isEqualToString:@"true"]) {
                //参与成功后，刷新
                [self.arr removeAllObjects];
                [NetWorkTool getPartyWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] completionBlock:^(NSDictionary * _Nonnull dic) {
                    GetPartyModel *getP = [GetPartyModel yy_modelWithDictionary:dic];
                    for (PartyModel *party in getP.partys) {
                        [self.arr addObject:party];
                    }
                    //主线程刷新数据
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.myTable reloadData];
                    });
                }];
            }
        }];
        
    };
    return cell;
}

@end

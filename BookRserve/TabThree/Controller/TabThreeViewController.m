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
#import "ZKVerifyAlertView.h"

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
    
    [self.view addSubview:_myTable];
    [_myTable registerClass:[ActivityCell class] forCellReuseIdentifier:@"activityCell"];
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
        [cell.addBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        cell.addBtn.backgroundColor = [PublicTool getColor];
    }else{
        [cell.addBtn setTitle:@"已参与" forState:UIControlStateNormal];
        cell.addBtn.userInteractionEnabled = NO;
        [cell.addBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        cell.addBtn.backgroundColor = [UIColor whiteColor];
    }
    cell.addClick = ^{
        ZKVerifyAlertView *verifyView = [[ZKVerifyAlertView alloc] initWithMaximumVerifyNumber:3 results:^(ZKVerifyState state) {
            if (state == ZKVerifyStateSuccess) {
                //参与读书会
                [NetWorkTool takePartInWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] UUID:p.UUID completionBlock:^(NSDictionary * _Nonnull dic) {
                    if ([[dic objectForKey:@"resault"] isEqualToString:@"true"]) {
                        //参与成功后，刷新
                        //刷新成功后，显示成功-----------
                        [PublicTool showHUDWithText:@"参与成功"];
                        
                        [self.arr removeAllObjects];
                        [NetWorkTool getPartyWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] completionBlock:^(NSDictionary * _Nonnull dic) {
                            GetPartyModel *getP = [GetPartyModel yy_modelWithDictionary:dic];
                            for (PartyModel *party in getP.partys) {
                                [self.arr addObject:party];
                            }
                            //主线程刷新数据
                            dispatch_async(dispatch_get_main_queue(), ^{
                                [self.myTable reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
                            });
                        }];
                    }
                }];
            }
        }];
        [verifyView show];
    };
    return cell;
}

@end

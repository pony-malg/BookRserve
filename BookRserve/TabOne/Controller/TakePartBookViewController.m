//
//  TakePartBookViewController.m
//  BookRserve
//
//  Created by jay on 2019/4/4.
//  Copyright © 2019 jay. All rights reserved.
//

#import "TakePartBookViewController.h"
#import "ActivityCell.h"
#import "NetWorkTool.h"
#import "PartyModel.h"
#import "GetPartyModel.h"
#import "YYModel.h"
#import <MBProgressHUD.h>

@interface TakePartBookViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *arr;

@end

@implementation TakePartBookViewController

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
            if ([party.isJoined isEqualToString:@"1"]) {
                [self.arr addObject:party];
            }
        }
        //主线程刷新数据
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.myTable reloadData];
            [MBProgressHUD hideHUDForView:[[[UIApplication sharedApplication] delegate] window]  animated:YES];
        });
    }];
}
- (void)configUI{
    self.title = @"参加的读书会";
    self.view.backgroundColor = [UIColor whiteColor];
    _myTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    [self.view addSubview:_myTable];
    [_myTable registerClass:[ActivityCell class] forCellReuseIdentifier:@"takeCell"];
}
#pragma mark - table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ActivityCell *cell = [[ActivityCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"takeCell"];
    cell.addBtn.hidden = YES;
    PartyModel *p = [_arr objectAtIndex:indexPath.row];
    cell.loacalLabel.text = [NSString stringWithFormat:@"活动地点：%@",[p.address stringByRemovingPercentEncoding]];
    cell.detailLabel.text = [NSString stringWithFormat:@"活动内容：%@",[p.content stringByRemovingPercentEncoding]];
    cell.timeLabel.text = [NSString stringWithFormat:@"活动时间：%@",p.time];
    cell.personLabel.text = [NSString stringWithFormat:@"发起人：%@",[p.leading stringByRemovingPercentEncoding]];
    return cell;
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

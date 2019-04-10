//
//  MainViewController.m
//  BookRserve
//
//  Created by jay on 2019/3/30.
//  Copyright © 2019 jay. All rights reserved.
//

#import "MainViewController.h"
#import "HeaderView.h"
#import "HaveSellBookCell.h"
#import "IssueViewController.h"
#import "YYModel.h"
#import "MyBookList.h"
#import "NetWorkTool.h"
#import "MyInfoModel.h"
#import "MyBookCell.h"
#import "TakePartBookViewController.h"
#import "BuyBookViewController.h"
#import <MBProgressHUD.h>
#import <MJRefresh.h>

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *infoMutableArr;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setData];
    [self configUI];
    
}
- (void)setData{

    [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window] animated:YES];
    
    _infoMutableArr = [NSMutableArray array];
    [NetWorkTool getBookListWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] completionBlock:^(NSDictionary * _Nonnull dic) {
        MyInfoModel *books = [MyInfoModel yy_modelWithDictionary:dic];
        for (MyBookList *book in books.books) {
            if ([book.status isEqualToString:@"2"]) {// 2 我的发布
                [self.infoMutableArr addObject:book];
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
    self.view.backgroundColor = [UIColor whiteColor];
    _myTable = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    __weak typeof(self)weakSelf = self;
    _myTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.infoMutableArr removeAllObjects];
        [NetWorkTool getBookListWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] completionBlock:^(NSDictionary * _Nonnull dic) {
            MyInfoModel *books = [MyInfoModel yy_modelWithDictionary:dic];
            for (MyBookList *book in books.books) {
                if ([book.status isEqualToString:@"2"]) {// 2 我的发布
                    [self.infoMutableArr addObject:book];
                }
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.myTable reloadData];
                [weakSelf.myTable.mj_header endRefreshing];
            });
        }];
        
    }];
    _myTable.estimatedRowHeight = 250;
    HeaderView *headView = [[HeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 220)];
    //__weak typeof(self) weakSelf = self;
    headView.myHeadBlock = ^(NSInteger tagNumber) {
        if (tagNumber == 1051) {
            TakePartBookViewController *vc = [[TakePartBookViewController alloc] init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }else if (tagNumber == 1052){
            [weakSelf.myTable setContentOffset:CGPointMake(0, 220-64)];
        }else if (tagNumber == 1053){
            BuyBookViewController *vc = [[BuyBookViewController alloc] init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }else{
            IssueViewController *vc = [[IssueViewController alloc] init];
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
            self.hidesBottomBarWhenPushed = NO;
        }
    };
    
    //有个手势的问题，有空再研究
    
    _myTable.tableHeaderView = headView;
    [self.view addSubview:_myTable];
    [_myTable registerClass:[MyBookCell class] forCellReuseIdentifier:@"mainCell"];
}
#pragma mark - table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.infoMutableArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MyBookCell *cell = [[MyBookCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"mainCell"];
    MyBookList *b = [self.infoMutableArr objectAtIndex:indexPath.row];
    cell.bookName.text = [NSString stringWithFormat:@"书名：%@",[b.title stringByRemovingPercentEncoding]];
    cell.authorLabel.text = [NSString stringWithFormat:@"作者：%@",[b.author stringByRemovingPercentEncoding]];
    cell.house.text = [NSString stringWithFormat:@"出版社：%@",[b.publishingHouse stringByRemovingPercentEncoding]];
    cell.time.text = [NSString stringWithFormat:@"发布时间：%@",b.time];;
    cell.address.text = [NSString stringWithFormat:@"发布地址：%@",[b.address stringByRemovingPercentEncoding]];
   
    return cell;
}
//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"telprompt:%@",[self.rearArr objectAtIndex:4]]] options:@{} completionHandler:nil];

@end

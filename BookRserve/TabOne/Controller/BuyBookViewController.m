//
//  BuyBookViewController.m
//  BookRserve
//
//  Created by jay on 2019/4/4.
//  Copyright © 2019 jay. All rights reserved.
//

#import "BuyBookViewController.h"
#import "buyBookCell.h"
#import "YYModel.h"
#import "MyBookList.h"
#import "NetWorkTool.h"
#import "MyInfoModel.h"
#import <MBProgressHUD.h>

@interface BuyBookViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,strong)NSMutableArray *infoArr;

@end

@implementation BuyBookViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setData];
    [self configUI];
    
}
- (void)setData{
    [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window] animated:YES];
    
    _infoArr = [NSMutableArray array];
    [NetWorkTool getBookListWithToken:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] completionBlock:^(NSDictionary * _Nonnull dic) {
        MyInfoModel *books = [MyInfoModel yy_modelWithDictionary:dic];
        for (MyBookList *book in books.books) {
            if ([book.status isEqualToString:@"1"]) {// 1 已拍下
                [self.infoArr addObject:book];
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
    self.title = @"拍下的书";
    _myTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    [self.view addSubview:_myTable];
    [_myTable registerClass:[buyBookCell class] forCellReuseIdentifier:@"buyCell"];
}
#pragma mark - table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.infoArr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    buyBookCell *cell = [[buyBookCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"buyCell"];
    cell.dealBtn.hidden = YES;
    MyBookList *b = [_infoArr objectAtIndex:indexPath.row];
    cell.bookName.text = [NSString stringWithFormat:@"书名：%@",[b.title stringByRemovingPercentEncoding]];
    cell.authorLabel.text = [NSString stringWithFormat:@"作者：%@",[b.author stringByRemovingPercentEncoding]];
    cell.house.text = [NSString stringWithFormat:@"出版社：%@",[b.publishingHouse stringByRemovingPercentEncoding]];
    cell.oldDegree.text = [NSString stringWithFormat:@"折旧率：%@",[b.depreciationRate stringByRemovingPercentEncoding]];
    cell.Person.text = [NSString stringWithFormat:@"发布人：%@",[b.name stringByRemovingPercentEncoding]];
    cell.teleLabel.text = [NSString stringWithFormat:@"联系电话：%@",b.phone];;
    cell.timeLabel.text = b.time;
    cell.addressLabel.text = [NSString stringWithFormat:@"地址：%@",[b.address stringByRemovingPercentEncoding]];
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

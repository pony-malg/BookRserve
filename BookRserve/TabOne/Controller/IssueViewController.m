//
//  IssueViewController.m
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import "IssueViewController.h"
#import "SubmitCell.h"
#import "FooterView.h"
#import "NetWorkTool.h"
#import <MBProgressHUD.h>

@interface IssueViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTable;
@property (nonatomic,copy)NSArray *nameArr;
@property (nonatomic,strong)NSMutableArray *infoArr;

@end

@implementation IssueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configUI];
    [self setData];
}
- (void)setData{
    NSString *today = [self getCurrentDate];
    _nameArr = @[@"书名：",@"作者：",@"出版社：",@"折旧率：",@"姓名：",@"联系方式：",@"地址："];
    _infoArr = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"",@"",today, nil];
}
- (void)configUI{
    self.title = @"发布我的二手书";
    _myTable = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _myTable.delegate = self;
    _myTable.dataSource = self;
    FooterView *footView = [[FooterView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), 65)];
    __weak typeof(self)weakSelf = self;
    footView.myFooterButtonBlock = ^{
        NSEnumerator *enumerator  = [weakSelf.infoArr objectEnumerator];
        NSString *str;
        while (str = [enumerator nextObject]) {
            if (str.length <= 0) {
                MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                hud.mode = MBProgressHUDModeText;
                hud.label.text = @"请填写完整";
                hud.removeFromSuperViewOnHide = YES;
                [hud hideAnimated:YES afterDelay:0.7];
                return;
            }
        }
        [MBProgressHUD showHUDAddedTo:[[[UIApplication sharedApplication] delegate] window] animated:YES];
        
        [NetWorkTool releaseBookWithArray:self.infoArr completionBlock:^(NSDictionary * _Nonnull dic) {
            if ([[dic objectForKey:@"status"] isEqualToString:@"success"]) {
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [MBProgressHUD hideHUDForView:[[[UIApplication sharedApplication] delegate] window]  animated:YES];
                });
                //成功之后，延迟一秒，pop回去
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.navigationController popViewControllerAnimated:YES];
                });
            }
        }];
        
    };
    _myTable.tableFooterView = footView;
    [self.view addSubview:_myTable];
    [_myTable registerClass:[SubmitCell class] forCellReuseIdentifier:@"issueCell"];
}
- (NSString *)getCurrentDate{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    NSDate *nowDate = [NSDate date];
    NSString *currentStr = [formatter stringFromDate:nowDate];
    return currentStr;
}
#pragma mark - table
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArr.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row<6) {
        return 40;
    }else{
        return 80;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SubmitCell *cell = [[SubmitCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"issueCell"];
    cell.titleLab.text = [_nameArr objectAtIndex:indexPath.row];
    if ([[[_infoArr objectAtIndex:indexPath.row] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        cell.fillTextField.placeholder = [_nameArr objectAtIndex:indexPath.row];
    }else{
        cell.fillTextField.text = [_infoArr objectAtIndex:indexPath.row];
        cell.fillTextView.text = [_infoArr objectAtIndex:indexPath.row];
    }
    if (indexPath.row<6) {
        cell.fillTextView.hidden = YES;
        cell.fillTextField.hidden = NO;
    }else{
        cell.fillTextView.hidden = NO;
        cell.fillTextField.hidden = YES;
    }
    __weak typeof(self) weakSelf = self;
    cell.textBlock = ^(NSString * _Nonnull myText) {
        [weakSelf.infoArr replaceObjectAtIndex:indexPath.row withObject:myText];
        [weakSelf.myTable reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:indexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    };
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

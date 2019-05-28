
//
//  HistoryVC.m
//  Volleyball
//
//  Created by 张文轩 on 2018/5/17.
//  Copyright © 2018年 张文轩. All rights reserved.
//

#import "HistoryVC.h"
#import "HistoryDetailVC.h"
@interface HistoryVC ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSArray *resultArray;
@end

@implementation HistoryVC
- (void)viewDidLoad {
    [super viewDidLoad];
    [self StatusBarAndNavigationBarInit];
    [self downloadFromPlist];
}

//导航条初始化
- (void) StatusBarAndNavigationBarInit{
    self.navigationItem.title = @"历史比赛信息";
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                    NSFontAttributeName:[UIFont systemFontOfSize:16]
                                                                    };
}

//从plist中读取数据
- (void) downloadFromPlist{
    // 获取路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"scoreList.plist"];
    NSFileManager *fileM = [NSFileManager defaultManager];
    // 判断文件是否存在，不存在则直接创建，存在则直接取出文件中的内容
    if (![fileM fileExistsAtPath:filePath]) {
        //        [fileM createFileAtPath:filePath contents:nil attributes:nil];
        return ;
    }
    NSArray *resultArray = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
    self.resultArray = resultArray;
    NSLog(@"resulty is %@", self.resultArray);
}

#pragma 数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"GameIdentifier";
    UITableViewCell *cell = [tableView
                             dequeueReusableCellWithIdentifier:CellIdentifier
                             forIndexPath:indexPath];
    NSString *name = [NSString stringWithFormat:@"第%ld场比赛",indexPath.row+1];
    cell.textLabel.text = name;
    return cell;
}

#pragma 代理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    UIViewController *hdVC = [sb instantiateViewControllerWithIdentifier:@"historydetailVC"];
    HistoryDetailVC *historyDetailVC = (HistoryDetailVC *) hdVC;
    NSString *name = [NSString stringWithFormat:@"第%ld场比赛",indexPath.row+1];
    historyDetailVC.navTitle = name;
    NSArray *detailArray = (NSArray*)self.resultArray[indexPath.row];
    historyDetailVC.detailArray = detailArray;
    [self.navigationController pushViewController:hdVC animated:YES];
}
@end

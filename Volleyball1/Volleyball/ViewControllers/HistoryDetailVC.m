//
//  HistoryDetailVC.m
//  Volleyball
//
//  Created by 张文轩 on 2018/5/21.
//  Copyright © 2018年 张文轩. All rights reserved.
//

#import "HistoryDetailVC.h"

@interface HistoryDetailVC ()

@end

@implementation HistoryDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self StatusBarAndNavigationBarInit];
}

//导航条初始化
- (void) StatusBarAndNavigationBarInit{
    self.navigationItem.title = self.navTitle;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.titleTextAttributes = @{
                                                                    NSForegroundColorAttributeName:[UIColor whiteColor],
                                                                    NSFontAttributeName:[UIFont systemFontOfSize:16]
                                                                    };
}
@end

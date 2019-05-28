//
//  DetailScoreVC.m
//  Volleyball
//
//  Created by 张文轩 on 2018/5/17.
//  Copyright © 2018年 张文轩. All rights reserved.
//

#import "DetailScoreVC.h"
#import "PlayerModel.h"
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
@interface DetailScoreVC ()
@property (strong, nonatomic) PlayerModel *playerModel;
@end

@implementation DetailScoreVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回按钮设置
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [self baseViewInit];
}

- (void) baseViewInit{
    NSArray *titleArray = @[@"合计",@"发球得分",@"拦网得分",@"扣球得分",@"姓名",@"拦防失",@"被拦死",@"一传失分",@"我队自失",@"合计"];
    float X = 5;
    float Y = 70;
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 15; j++) {
            UILabel *label = [[UILabel alloc]init];
            label.frame = CGRectMake(X, Y, (SCREEN_WIDTH-10)/10.0, (SCREEN_HEIGHT-76)/15.0);
            label.layer.borderColor = [UIColor blackColor].CGColor;
            label.layer.borderWidth = 1;
            label.tag =
            label.textAlignment = NSTextAlignmentCenter;
            if (j == 0) {
                label.text = titleArray[i];
            }else{
                switch (i) {
                    case 0:
                        [self value:j-1];
                        label.text = [NSString stringWithFormat:@"%ld",self.playerModel.startGet+self.playerModel.lanGet+self.playerModel.fanKouGet+self.playerModel.firstKouGet];
                        break;
                    case 1:
                        [self value:j-1];
                        label.text = [NSString stringWithFormat:@"%ld",self.playerModel.startGet];
                        break;
                    case 2:
                        [self value:j-1];
                        label.text = [NSString stringWithFormat:@"%ld",self.playerModel.lanGet];
                        break;
                    case 3:
                        [self value:j-1];
                        label.text = [NSString stringWithFormat:@"%ld",self.playerModel.firstKouGet+self.playerModel.fanKouGet];
                        break;
                    case 4:
                        [self value:j-1];
                        label.text = self.playerModel.name;
                        break;
                    case 5:
                        [self value:j-1];
                        label.text = [NSString stringWithFormat:@"%ld",self.playerModel.lanShi+self.playerModel.lanGui+self.playerModel.fangShi];
                        break;
                    case 6:
                        [self value:j-1];
                        label.text = [NSString stringWithFormat:@"%ld",self.playerModel.firstKouBeiLanSi+self.playerModel.fanKouBeiLanSi];
                        break;
                    case 7:
                        [self value:j-1];
                        label.text = [NSString stringWithFormat:@"%ld",self.playerModel.firstLoss];
                        break;
                    case 8:
                        [self value:j-1];
                        label.text = [NSString stringWithFormat:@"%ld",self.playerModel.firstKouLoss+self.playerModel.fanKouLoss+self.playerModel.startLoss+self.playerModel.secondLoss+self.playerModel.lanGui];
                        break;
                    case 9:
                        [self value:j-1];
                        label.text = [NSString stringWithFormat:@"%ld",self.playerModel.firstKouLoss+self.playerModel.fanKouLoss+self.playerModel.startLoss+self.playerModel.secondLoss+self.playerModel.lanGui+self.playerModel.firstLoss+self.playerModel.firstKouBeiLanSi+self.playerModel.fanKouBeiLanSi+self.playerModel.lanShi+self.playerModel.fangShi];
                        break;
                    default:
                        break;
                }
            }
            [self.view addSubview:label];
            Y += label.frame.size.height;
        }
        Y = 70;
        X += (SCREEN_WIDTH-10)/10.0;
    }
}

- (void) value:(int)index{
    PlayerModel *playModel = self.detailScoreArray[index];
    self.playerModel = playModel;
}
@end

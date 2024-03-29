//
//  HyHomeViewController.m
//  Healer
//
//  Created by LiHongYu on 16/9/7.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#import "HyHomeViewController.h"
#import "HyDiaryViewController.h"
#import "HyFlyViewController.h"
#import "HyMassageViewController.h"
#import "HyLoginViewController.h"
#import "HySetViewController.h"

#import "SVProgressHUD.h"

@interface HyHomeViewController ()
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)HyFlyViewController *HyFlyController;
@property (nonatomic,strong)HyMassageViewController *HyMassageController;
@property (nonatomic,strong)HyLoginViewController *HyLoginViewController;
@property (nonatomic,strong)HyDiaryViewController *HyDiaryViewController;
@property (nonatomic,strong)HySetViewController *HySetViewController;
@end


#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define ButtonW 100

@implementation HyHomeViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"首页";

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"zhuye"]];
    [self HomeButton];
}

//创建首页按钮
-(void)HomeButton{

    for (int i = 0; i<7; i++) {
        UIButton *button = [[UIButton alloc]init];
        

            switch (i) {
                case 0:
                    button.frame = CGRectMake((ScreenW - ButtonW)/2, ScreenH *0.1, ButtonW, ButtonW);
                    break;
                case 1:
                    button.frame = CGRectMake(ScreenW/3-ButtonW/2, ScreenH *0.3, ButtonW, ButtonW);
                    break;
                case 2:
                    button.frame = CGRectMake(ScreenW*2/3-ButtonW/2, ScreenH *0.3, ButtonW, ButtonW);
                    break;
                case 3:
                    button.frame = CGRectMake(ScreenW/3-ButtonW/2, ScreenH *0.5, ButtonW, ButtonW);
                    break;
                case 4:
                    button.frame = CGRectMake(ScreenW*2/3-ButtonW/2, ScreenH *0.5, ButtonW, ButtonW);
                    break;
                case 5:
                    button.frame = CGRectMake(ScreenW/3-ButtonW/2, ScreenH *0.7, ButtonW, ButtonW);
                    break;
                case 6:
                    button.frame = CGRectMake(ScreenW*2/3-ButtonW/2, ScreenH *0.7, ButtonW, ButtonW);
                    break;
                default:
                    break;
            }

        NSArray *ImageArray = @[@"icon",@"my",@"xinshi",@"fly",@"massage",@"yule",@"set"];
        [button setImage:[UIImage imageNamed:ImageArray[i]] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        [button addTarget:self action:@selector(HomeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = i;
        [self.view addSubview:button];
    }
    
    
    
}
-(void)HomeButtonClick:(UIButton *)button{
    
    
    
    switch (button.tag) {
        case 0:
            self.HyLoginViewController =[[HyLoginViewController alloc]init];
            [self.navigationController pushViewController:self.HyLoginViewController animated:YES];
            break;
        case 1:
            self.HyLoginViewController =[[HyLoginViewController alloc]init];
            [self.navigationController pushViewController:self.HyLoginViewController animated:YES];
            break;
        case 2:
            self.HyDiaryViewController =[[HyDiaryViewController alloc]init];
            [self.navigationController pushViewController:self.HyDiaryViewController animated:YES];
            break;
        case 3:
            self.HyFlyController =[[HyFlyViewController alloc]init];
            [self.navigationController pushViewController:self.HyFlyController animated:YES];
            
            break;
        case 4:
            self.HyMassageController =[[HyMassageViewController alloc]init];
            [self.navigationController pushViewController:self.HyMassageController animated:YES];
            
            break;
        case 5:

            [SVProgressHUD showErrorWithStatus:@"暂未开放,敬请期待"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            
            break;
        case 6:
            self.HySetViewController =[[HySetViewController alloc]init];
            [self.navigationController pushViewController:self.HySetViewController animated:YES];
            
            break;
            
        default:
            break;
    }


    

            

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//
//  HyMassageViewController.m
//  Healer
//
//  Created by LiHongYu on 16/9/7.
//  Copyright © 2016年 LiHongYu. All rights reserved.
//

#define ScreenW [UIScreen mainScreen].bounds.size.width
#define ScreenH [UIScreen mainScreen].bounds.size.height
#define rectNavH self.navigationController.navigationBar.frame.size.height

#import "HyMassageViewController.h"
#import "TheYellowView.h"
#import "HyTableViewCell.h"

@interface HyMassageViewController ()<TheYellowViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)TheYellowView *YellowView;
@property(nonatomic,strong)UIView *TwoItemView;

@property(nonatomic,weak)UIButton *leftButton;
@property(nonatomic,weak)UIButton *rightButton;
@property(nonatomic,strong)UITableView *adtableview;

@property(nonatomic,strong)UIButton *speedBtn;

@property (strong,nonatomic)UIView *jitang_one;
@property (strong,nonatomic)UIView *jitang_two;

@end



@implementation HyMassageViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    self.navigationItem.title = @"心理按摩院";
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.adtableview removeFromSuperview];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self addYellowView];
    [self.view addSubview:self.YellowView];
    [self addTwoBar];
    [self.view addSubview:self.TwoItemView];
    [self addTableview];
    [self.view addSubview:self.adtableview];
    [self creatspeedbtn];
    
    [self.view addSubview:_jitang_one];
    [self.view addSubview:_jitang_two];
    
    
    _rightButton.selected = YES;
}

-(void)addYellowView{
    
    
    TheYellowView *yellowview = [[TheYellowView alloc]init];
    yellowview.delegate = self;
    yellowview.frame = CGRectMake(0, rectNavH, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height*0.5);
    yellowview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"beijing"]];
    self.YellowView = yellowview;

}

-(void)addTwoBar{
    
    UIView *TwoItemView = [[UIView alloc]init];
    TwoItemView.frame = CGRectMake(0, rectNavH + ScreenH*0.5, ScreenW, ScreenH*0.08);
    TwoItemView.backgroundColor = [UIColor whiteColor];
    
    
    UIButton *btn_one = [[UIButton alloc]init];
    btn_one.frame = CGRectMake(0, 0, ScreenW*0.5, ScreenH*0.08);
    [btn_one setImage:[UIImage imageNamed:@"xinliyishenghuise"] forState:UIControlStateNormal];
    [btn_one setImage:[UIImage imageNamed:@"xinliyishengchengse"] forState:UIControlStateHighlighted];
    [btn_one setImage:[UIImage imageNamed:@"xinliyishengchengse"] forState:UIControlStateSelected];
    [btn_one addTarget:self action:@selector(btn_one_OnClick) forControlEvents:UIControlEventTouchUpInside];
    UIButton *btn_two = [[UIButton alloc]init];
    btn_two.frame = CGRectMake(ScreenW*0.5, 0, ScreenW*0.5, ScreenH*0.08);
    [btn_two setImage:[UIImage imageNamed:@"xinllingjitanghuise"] forState:UIControlStateNormal];
    [btn_two setImage:[UIImage imageNamed:@"linlingjitangchengse"] forState:UIControlStateHighlighted];
    [btn_two setImage:[UIImage imageNamed:@"linlingjitangchengse"] forState:UIControlStateSelected];
    [btn_two addTarget:self action:@selector(btn_two_OnClick) forControlEvents:UIControlEventTouchUpInside];
    _leftButton = btn_one;
    _rightButton = btn_two;
    
    [TwoItemView addSubview:_leftButton];
    [TwoItemView addSubview:_rightButton];
    
    self.TwoItemView = TwoItemView;
    

    

}

-(void)addTableview{
    UITableView *tableview = [[UITableView alloc]init];
    tableview.frame = CGRectMake(-ScreenW, rectNavH+ScreenH*0.58, ScreenW, ScreenH*0.42-rectNavH);
    tableview.delegate = self;
    tableview.dataSource = self;
    self.adtableview = tableview;
    
    
    self.jitang_one = [[[NSBundle mainBundle]loadNibNamed:@"xinlingjitang1" owner:nil options:nil]lastObject];
    self.jitang_one.frame = CGRectMake(0, rectNavH+ScreenH*0.59, ScreenW, 110);
    self.jitang_two = [[[NSBundle mainBundle]loadNibNamed:@"xinlingjitang2" owner:nil options:nil]lastObject];
    self.jitang_two.frame = CGRectMake(0, 557, ScreenW, 110);

}

-(void)creatspeedbtn{
    UIButton *speedBtn = [[UIButton alloc]init];
    speedBtn.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"xuankuang.png"]];
    [speedBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    speedBtn.titleLabel.font = [UIFont systemFontOfSize:8];
    [speedBtn addTarget:self action:@selector(removebtn:) forControlEvents:UIControlEventTouchUpInside];
    self.speedBtn = speedBtn;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}


//TwoBarButton response event
-(void)btn_one_OnClick{
    _leftButton.selected = YES;
    _rightButton.selected = NO;
    self.adtableview.frame = CGRectMake(0, rectNavH+ScreenH*0.58, ScreenW, ScreenH*0.42-rectNavH);
    _jitang_one.transform = CGAffineTransformMakeTranslation(ScreenW, 0);
    _jitang_two.transform = CGAffineTransformMakeTranslation(ScreenW, 0);

}
-(void)btn_two_OnClick{
    _rightButton.selected = YES;
    _leftButton.selected = NO;
    self.adtableview.frame = CGRectMake(-ScreenW, rectNavH+ScreenH*0.58, ScreenW, ScreenH*0.42-rectNavH);
    _jitang_one.transform = CGAffineTransformMakeTranslation(0, 0);
    _jitang_two.transform = CGAffineTransformMakeTranslation(0, 0);

}

//TheYellowView delegate method
-(void)btnOnClick:(NSString *)ButtonText Frame:(CGRect)frame{
    NSLog(@"%@----%f",ButtonText,frame.origin.x);
    
    CGFloat btnx = frame.origin.x;
    CGFloat btny = frame.origin.y;
    
    self.speedBtn.frame = CGRectMake(btnx, btny, 38, 20);
    [self.speedBtn setTitle:ButtonText forState:UIControlStateNormal];
    
    [UIView animateWithDuration:1 animations:^{
        self.speedBtn.frame = CGRectMake(45, 283, 38, 20);
    } completion:^(BOOL finished) {
    }];
    [self.YellowView addSubview:self.speedBtn];
}
-(void)removebtn:(UIButton*)sender{
    [self.speedBtn removeFromSuperview];

}

//TwoBarButton response event
-(void)didbtnOnClick:(NSString *)textFieldString{
    NSLog(@"确定=======%@",textFieldString);
}



//tableview method
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HyTableViewCell *cell = [HyTableViewCell cellWithTableview:self.adtableview];
    
    return cell;
}


@end

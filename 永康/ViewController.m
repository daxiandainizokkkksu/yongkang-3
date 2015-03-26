//
//  ViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/5.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "ViewController.h"
#import "zbdhViewController.h"
#import "xqzlViewController.h"
#import "qysViewController.h"
#import "szglViewController.h"
#import "khzbViewController.h"
#import "yqViewController.h"
#import "gqViewController.h"
#import "sqTabViewController.h"
#import "tianqiViewController.h"
#import "wxytViewController.h"
#import "gsglViewController.h"

#import <Masonry.h>
#import "taiFengViewController.h"
@interface ViewController ()
{
    UIImageView *head;
//七个图标
    UIView *viewOne;
    UIView *viewTwo;
    UIView *viewThree;
    UIView *viewFour;
    UIView *viewFive;
    UIView *viewSix;
    UIView *viewSeven;
//5个底部按钮

    UIView *v1;
    UIView *v2;
    UIView *v3;
    UIView *v4;
    UIView *v5;
    
    NSURLRequest *request;
    NSData *response;
    
    UILabel *label1;//天气预报
    UILabel *label2;//台风路径
    UILabel *label3;//供水总量
    UILabel *label6;//超警个数
    UILabel *label7;//雨量站
    
    int sum;//超警个数
    
    



}

@end

@implementation ViewController






- (void)viewDidLoad {
    
   [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [super viewDidLoad];
    [self createViews];
    [self createUI];
    [self json1];
    UIImage *image = [UIImage imageNamed:@"top_title.png"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame=CGRectMake(self.view.frame.size.width/2-60, 0, 120, 30);
    [self.navigationController.navigationBar addSubview:imageView];

}






#pragma mark 将16位转化为uicolor的方法
- (UIColor *)getColor:(NSString *)hexColor
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    
    
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&red];
    range.location = 2;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&green];
    
    range.location = 4;
    [[NSScanner scannerWithString:[hexColor substringWithRange:range]] scanHexInt:&blue];
    
    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:1.0f];
}


#pragma mark 底部按钮的创建

- (void)createViews
{
    UIView *back=[UIView new];
    back.backgroundColor=[UIColor blackColor];
    [self.view addSubview:back];
    [back mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(20, 0, 0, 0));
    }];
    
    
    //值班电话
    v1 = [UIView new];
    [self.view addSubview:v1];
   //值班电话图标＋文字
    UIImageView *imageOne=[UIImageView new];
    UILabel *labelOne=[UILabel new];
    [v1 addSubview:imageOne];
    [v1 addSubview:labelOne];
    imageOne.image=[UIImage imageNamed:@"ico_zbdh.png"];
    labelOne.textColor=[UIColor whiteColor];
    labelOne.adjustsFontSizeToFitWidth=YES;;
    labelOne.text=@"值班电话";
    
    
    
    
    //防汛资料
    v2 = [UIView new];
    [self.view addSubview:v2];
    //防汛资料图标＋文字
    UIImageView *imageTwo=[UIImageView new];
    UILabel *labelTwo=[UILabel new];
    [v2 addSubview:imageTwo];
    [v2 addSubview:labelTwo];
    imageTwo.image=[UIImage imageNamed:@"ico_xqzl.png"];
    labelTwo.textColor=[UIColor whiteColor];
    labelTwo.adjustsFontSizeToFitWidth=YES;;
    labelTwo.text=@"防汛资料";
    
    
    //取用水
    v3 = [UIView new];
   
    v3.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:v3];
    //取用水图标＋文字
    UIImageView *imageThree=[UIImageView new];
    UILabel *labelThree=[UILabel new];
    [v3 addSubview:imageThree];
    [v3 addSubview:labelThree];
    imageThree.image=[UIImage imageNamed:@"ico_qys.png"];
    labelThree.textColor=[UIColor whiteColor];
    labelThree.adjustsFontSizeToFitWidth=YES;;
    labelThree.text=@"  取用水 ";
    
    
    
    //水质管理
    v4 = [UIView new];
       [self.view addSubview:v4];
    //水质管理图标＋文字
    UIImageView *imageFour=[UIImageView new];
    UILabel *labelFour=[UILabel new];
    [v4 addSubview:imageFour];
    [v4 addSubview:labelFour];
    imageFour.image=[UIImage imageNamed:@"ico_szgl.png"];
    labelFour.textColor=[UIColor whiteColor];
    labelFour.adjustsFontSizeToFitWidth=YES;;
    labelFour.text=@"水质管理";
    
    
    //考核指标
    v5 = [UIView new];
  
    [self.view addSubview:v5];
    //考核指标图标＋文字
    UIImageView *imageFive=[UIImageView new];
    UILabel *labelFive=[UILabel new];
    [v5 addSubview:imageFive];
    [v5 addSubview:labelFive];
    imageFive.image=[UIImage imageNamed:@"ico_khzb.png"];
    labelFive.textColor=[UIColor whiteColor];
    labelFive.adjustsFontSizeToFitWidth=YES;;
    labelFive.text=@"考核指标";
    
    
#pragma mark 主界面五个按钮的自动布局
    [v1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
        make.left.equalTo(self.view.mas_left).offset(20);
        make.right.equalTo(v2.mas_left).offset(-20);
        make.height.mas_equalTo(self.view.mas_height).dividedBy(12);
    }];
    UIButton *buttonOne=[UIButton new];
    [v1 addSubview:buttonOne];
    [buttonOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v1);
    }];
    buttonOne.tag=0;
    [buttonOne addTarget:self action:@selector(jumpOne) forControlEvents:UIControlEventTouchUpInside];
    
    
    //防汛资料
    [v2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(v1.mas_bottom);
        make.right.equalTo(v3.mas_left).offset(-20);
        make.height.equalTo(v1.mas_height);
        make.width.equalTo(v1.mas_width);
    }];
    UIButton *buttonTwo=[UIButton new];
    [v2 addSubview:buttonTwo];
    [buttonTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v2);
    }];
    buttonTwo.tag=1;
    [buttonTwo addTarget:self action:@selector(jumpTwo) forControlEvents:UIControlEventTouchUpInside];
    
    //v3取用水
    [v3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(v1.mas_bottom);
        make.right.equalTo(v4.mas_left).offset(-20);
        make.height.equalTo(v1.mas_height);
        make.width.equalTo(v1.mas_width);
    }];
    UIButton *buttonThree=[UIButton new];
    [v3 addSubview:buttonThree];
    [buttonThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v3);
    }];
    buttonThree.tag=2;
    [buttonThree addTarget:self action:@selector(jumpThree) forControlEvents:UIControlEventTouchUpInside];
    

    
   
    
    //v4水质管理
    [v4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(v1.mas_bottom);
        make.right.equalTo(v5.mas_left).offset(-20);
        make.height.equalTo(v1.mas_height);
        make.width.equalTo(v1.mas_width);
    }];
    UIButton *buttonFour=[UIButton new];
    [v4 addSubview:buttonFour];
    [buttonFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(v4);
    }];
    buttonFour.tag=3;
    [buttonFour addTarget:self action:@selector(jumpFour) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    //考核指标
    [v5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(v1.mas_bottom);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.equalTo(v1.mas_height);
        make.width.equalTo(v1.mas_width);
    }];
#pragma mark 值班电话按钮的创建
    
    [imageOne mas_makeConstraints:^(MASConstraintMaker *make) {
        /*make.top.equalTo(v1.mas_top);
        make.left.equalTo(v1.mas_left);
        make.right.equalTo(v1.mas_right);
        make.height.equalTo(imageOne.mas_width);*/
        make.center.equalTo(v1);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    [labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(v1.mas_centerX);
        make.top.equalTo(imageOne.mas_bottom);
        make.width.equalTo(v1.mas_width);
    }];
    
#pragma mark 防汛资料按钮的创建
    [imageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        /*make.top.equalTo(v1.mas_top);
         make.left.equalTo(v1.mas_left);
         make.right.equalTo(v1.mas_right);
         make.height.equalTo(imageOne.mas_width);*/
        make.center.equalTo(v2);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    [labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(v2.mas_centerX);
        make.top.equalTo(imageTwo.mas_bottom);
        make.width.equalTo(v2.mas_width);
    }];

#pragma mark 取用水按钮的创建
    [imageThree mas_makeConstraints:^(MASConstraintMaker *make) {
        /*make.top.equalTo(v1.mas_top);
         make.left.equalTo(v1.mas_left);
         make.right.equalTo(v1.mas_right);
         make.height.equalTo(imageOne.mas_width);*/
        make.center.equalTo(v3);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    [labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(v3.mas_centerX);
        make.top.equalTo(imageThree.mas_bottom);
        make.width.equalTo(v3.mas_width);
    }];
    
#pragma mark 水质管理按钮的创建
    [imageFour mas_makeConstraints:^(MASConstraintMaker *make) {
        /*make.top.equalTo(v1.mas_top);
         make.left.equalTo(v1.mas_left);
         make.right.equalTo(v1.mas_right);
         make.height.equalTo(imageOne.mas_width);*/
        make.center.equalTo(v4);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    [labelFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(v4.mas_centerX);
        make.top.equalTo(imageFour.mas_bottom);
        make.width.equalTo(v4.mas_width);
    }];

#pragma mark 防汛资料按钮的创建
    [imageFive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(v5);
        make.size.mas_equalTo(CGSizeMake(35, 35));
    }];
    [labelFive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(v5.mas_centerX);
        make.top.equalTo(imageFive.mas_bottom);
        make.width.equalTo(v5.mas_width);
    }];
  
 
    
}
#pragma mark 主界面7个图标的创建

-(void)createUI
{
    viewOne=[UIView new];
    viewTwo=[UIView new];
    viewThree=[UIView new];
    viewFour=[UIView new];
    viewFive=[UIView new];
    viewSix=[UIView new];
    viewSeven=[UIView new];
   
    
    head=[UIImageView new];
    [self.view addSubview:head];
    [head mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.height.mas_equalTo(self.view.mas_height).dividedBy(20);
        make.width.mas_equalTo(120);
        make.top.equalTo(self.view.mas_top).offset(30);
        
    }];
    
    
    
#pragma mark 天气预报
    [self.view addSubview:viewOne];
    viewOne.backgroundColor=[self getColor:@"23d1b2"];
    [viewOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(5);
        make.right.equalTo(self.view.mas_centerX).offset(-5);
        make.bottom.equalTo(v1.mas_top).offset(-5);
 
    }];
    UILabel *labelOneOne=[UILabel new];
    labelOneOne.textColor=[UIColor whiteColor];
    labelOneOne.text=@"天气预报";
    labelOneOne.adjustsFontSizeToFitWidth=YES;
    [viewOne addSubview:labelOneOne];
    [labelOneOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewOne.mas_left).offset(10);
        make.bottom.equalTo(viewOne.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(viewOne.mas_width).dividedBy(3.5);
    
    }];
    UIImageView *imageOne=[UIImageView new];
    [viewOne addSubview:imageOne];
    imageOne.image=[UIImage imageNamed:@"ico_w_0.png"];
    [imageOne mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(viewOne);
        make.height.mas_equalTo(viewOne.mas_height).dividedBy(2);
        make.width.mas_equalTo(viewOne.mas_height).dividedBy(2);
    }];
    label1=[UILabel new];
    label1.textColor=[UIColor whiteColor];
    label1.adjustsFontSizeToFitWidth=YES;
    [viewOne addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(viewOne.mas_right).offset(-5);
        make.bottom.equalTo(viewOne.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.equalTo(labelOneOne.mas_width);
    }];
    UIButton *button1=[UIButton new];
    [viewOne addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewOne);
    }];
    [button1 addTarget:self action:@selector(jump1) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
#pragma mark 卫星云图
    [self.view addSubview:viewFour];
    viewFour.backgroundColor=[self getColor:@"23d1b2"];
    [viewFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(viewOne.mas_bottom);
        make.left.equalTo(viewOne.mas_right).offset(5);
        make.right.equalTo(self.view.mas_right).offset(-5);
        make.height.mas_equalTo(viewOne.mas_height);

    }];
    UILabel *labelFourOne=[UILabel new];
    labelFourOne.textColor=[UIColor whiteColor];
    labelFourOne.text=@"卫星云图";
    labelFourOne.adjustsFontSizeToFitWidth=YES;
    [viewFour addSubview:labelFourOne];
    [labelFourOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewFour.mas_left).offset(10);
        make.bottom.equalTo(viewFour.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(viewOne.mas_width).dividedBy(3.5);
        
        
    }];
    UIImageView *imageFour=[UIImageView new];
    [viewFour addSubview:imageFour];
    imageFour.image=[UIImage imageNamed:@"ico_wxyt.png"];
    [imageFour mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(viewFour);
        make.height.mas_equalTo(viewFour.mas_height).dividedBy(3);
        make.width.mas_equalTo(viewFour.mas_height).dividedBy(2);
    }];
     
    UIButton *button4=[UIButton new];
    [viewFour addSubview:button4];
    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewFour);
    }];
    [button4 addTarget:self action:@selector(jump4) forControlEvents:UIControlEventTouchUpInside];
    
    
    
#pragma mark 台风路径
    [self.view addSubview:viewTwo];
    viewTwo.backgroundColor=[self getColor:@"ed3fdf"];
    [viewTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewOne.mas_left);
        make.right.equalTo(viewOne.mas_right);
        make.bottom.equalTo(viewOne.mas_top).offset(-5);
        make.height.equalTo(viewOne.mas_height).multipliedBy(2);
        
        
    }];
    UILabel *labelTwoOne=[UILabel new];
    labelTwoOne.textColor=[UIColor whiteColor];
    labelTwoOne.text=@"台风路径";
    labelTwoOne.adjustsFontSizeToFitWidth=YES;
    [viewTwo addSubview:labelTwoOne];
    [labelTwoOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewTwo.mas_left).offset(10);
        make.bottom.equalTo(viewTwo.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(viewTwo.mas_width).dividedBy(3.5);
        
    }];
    
    UIImageView *imageTwo=[UIImageView new];
    [viewTwo addSubview:imageTwo];
    imageTwo.image=[UIImage imageNamed:@"ico_taifeng.png"];
    [imageTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(viewTwo);
        make.height.mas_equalTo(viewTwo.mas_height).dividedBy(4);
        make.width.mas_equalTo(viewTwo.mas_height).dividedBy(4);
    }];
    
    
    
    UIButton *button2=[UIButton new];
    [viewTwo addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewTwo);
    }];
    [button2 addTarget:self action:@selector(jump2) forControlEvents:UIControlEventTouchUpInside];
    
    
#pragma mark 供水管理
    [self.view addSubview:viewThree];
    viewThree.backgroundColor=[self getColor:@"28b1fa"];
    [viewThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewOne.mas_left);
        make.right.equalTo(viewOne.mas_right);
        make.bottom.equalTo(viewTwo.mas_top).offset(-5);
        make.top.equalTo(head.mas_bottom).offset(20);////界面key！！！
        make.height.equalTo(viewTwo.mas_height);
  
    }];
    UILabel *label31=[UILabel new];
    label31.textColor=[UIColor whiteColor];
    label31.text=@"供水总量";
    [viewThree addSubview:label31];
    label31.adjustsFontSizeToFitWidth=YES;
    [label31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewThree.mas_left).offset(10);
        make.top.equalTo(viewThree.mas_top);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(viewThree.mas_width).dividedBy(3.5);
    }];
    UIImageView *image31=[UIImageView new];
    [viewThree addSubview:image31];
    [image31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewThree.mas_left).offset(10);
        make.bottom.equalTo(viewThree.mas_bottom);
        make.width.mas_equalTo(viewThree.mas_width).dividedBy(7);
        make.height.mas_equalTo(viewThree.mas_height).dividedBy(7);
    }];
    image31.image=[UIImage imageNamed:@"ico_gsgl.png"];
    UILabel *label33=[UILabel new];
    [viewThree addSubview:label33];
    label33.textColor=[UIColor whiteColor];
    [label33 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(image31.mas_right).offset(5);
        make.bottom.equalTo(viewThree.mas_bottom).offset(-5);
        make.width.equalTo(viewThree.mas_width).dividedBy(3.5);
        make.height.mas_equalTo(25);
    }];
    label33.adjustsFontSizeToFitWidth=YES;
    label33.text=@"供水管理";
    label3=[UILabel new];
    [viewThree addSubview:label3];
    label3.adjustsFontSizeToFitWidth=YES;
    label3.textColor=[UIColor whiteColor];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewThree.mas_left).offset(10);
        make.height.mas_equalTo(30);
        make.top.equalTo(label31.mas_bottom).offset(-5);
        make.width.equalTo(viewThree.mas_width).dividedBy(2.5);
    }];
    //label3.text=@"1111";
    UIButton *button3=[UIButton new];
    [viewThree addSubview:button3];
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewThree);
    }];
    [button3 addTarget:self action:@selector(jump3) forControlEvents:UIControlEventTouchUpInside];
    
    
    
#pragma mark 工情
    [self.view addSubview:viewFive];
    UIImageView *imageGq=[UIImageView new];
    imageGq.image=[UIImage imageNamed:@"ico_gqbg.png"];
    [viewFive addSubview:imageGq];
    [viewFive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewFour.mas_left);
        make.right.equalTo(viewFour.mas_right);
        make.bottom.equalTo(viewFour.mas_top).offset(-5);
        make.height.equalTo(viewFour.mas_height);
        
    }];
    [imageGq mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewFive);
    }];
    UILabel *labelFiveOne=[UILabel new];
    labelFiveOne.textColor=[UIColor whiteColor];
    labelFiveOne.text=@"工   情   ";
    labelFiveOne.adjustsFontSizeToFitWidth=YES;
    [viewFive addSubview:labelFiveOne];
    [labelFiveOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewFive.mas_left).offset(10);
        make.bottom.equalTo(viewFive.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(viewFive.mas_width).dividedBy(3.5);
        
    }];
    UIButton *button5= [UIButton new];
    [viewFive addSubview:button5];
    [button5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewFive);
    }];
    [button5 addTarget:self action:@selector(jump5) forControlEvents:UIControlEventTouchUpInside];
    
    
    
#pragma mark 水情
    [self.view addSubview:viewSix];
    viewSix.backgroundColor=[self getColor:@"fd9527"];
    [viewSix mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewFour.mas_left);
        make.right.equalTo(viewFour.mas_right);
        make.bottom.equalTo(viewFive.mas_top).offset(-5);
        make.top.equalTo(viewThree.mas_centerY).offset(5);
    }];
    UILabel *labelSixOne=[UILabel new];
    labelSixOne.textColor=[UIColor whiteColor];
    labelSixOne.text=@"水   情  ";
    labelSixOne.adjustsFontSizeToFitWidth=YES;
    [viewSix addSubview:labelSixOne];
    [labelSixOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewSix.mas_left).offset(10);
        make.bottom.equalTo(viewSix.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(viewSix.mas_width).dividedBy(3.5);
        
    }];
    
    UILabel *labelSixTwo=[UILabel new];
    labelSixTwo.textColor=[UIColor whiteColor];
    labelSixTwo.text=@"超警站点";
    labelSixTwo.adjustsFontSizeToFitWidth=YES;
    [viewSix addSubview:labelSixTwo];
    
    [labelSixTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewSix.mas_left).offset(10);
        make.top.equalTo(viewSix.mas_top);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(viewOne.mas_width).dividedBy(3.5);
        
    }];
    UIImageView *imageSix=[UIImageView new];
    [viewSix addSubview:imageSix];
    imageSix.image=[UIImage imageNamed:@"ico_sq.png"];
    [imageSix mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(viewSix);
        make.height.mas_equalTo(viewSix.mas_height).dividedBy(4);
        make.width.mas_equalTo(viewSix.mas_height).dividedBy(4);
    }];
    UIButton *button6= [UIButton new];
    [viewSix addSubview:button6];
    [button6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewSix);
    }];
    [button6 addTarget:self action:@selector(jump6) forControlEvents:UIControlEventTouchUpInside];
    
    label6=[UILabel new];
    label6.textColor=[UIColor whiteColor];
    label6.adjustsFontSizeToFitWidth=YES;
    [viewSix addSubview:label6];
    [label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelSixTwo.mas_left);
        make.top.equalTo(labelSixTwo.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.equalTo(labelSixOne.mas_width).dividedBy(2);
    }];
    label6.text=[NSString stringWithFormat:@"%d",sum];
    
    
    
    
    
    
#pragma  mark 雨情
    [self.view addSubview:viewSeven];
    viewSeven.backgroundColor=[self getColor:@"bbe234"];
    [viewSeven mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewFour.mas_left);
        make.right.equalTo(viewFour.mas_right);
        make.bottom.equalTo(viewSix.mas_top).offset(-5);
        make.top.equalTo(viewThree.mas_top);
    }];

    UILabel *labelSevenone=[UILabel new];
    labelSevenone.textColor=[UIColor whiteColor];
    labelSevenone.text=@"雨   情   ";
    labelSevenone.adjustsFontSizeToFitWidth=YES;
    [viewSeven addSubview:labelSevenone];
    [labelSevenone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewSeven.mas_left).offset(10);
        make.bottom.equalTo(viewSeven.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(viewSeven.mas_width).dividedBy(3.5);
        
    }];
    
    UILabel *labelSevenTwo=[UILabel new];
    labelSevenTwo.textColor=[UIColor whiteColor];
    labelSevenTwo.text=@"雨量站  ";
    labelSevenTwo.adjustsFontSizeToFitWidth=YES;
    [viewSeven addSubview:labelSevenTwo];
    [labelSevenTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(viewSeven.mas_left).offset(10);
        make.top.equalTo(viewSeven.mas_top);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(viewSeven.mas_width).dividedBy(3.5);
        
    }];
    UIImageView *imageSeven=[UIImageView new];
    [viewSeven addSubview:imageSeven];
    imageSeven.image=[UIImage imageNamed:@"ico_yq.png"];
    [imageSeven mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(viewSeven);
        make.height.mas_equalTo(viewSeven.mas_height).dividedBy(2);
        make.width.mas_equalTo(viewSeven.mas_height).dividedBy(2);
    }];
    label7=[UILabel new];
    label7.textColor=[UIColor whiteColor];
    label7.adjustsFontSizeToFitWidth=YES;
    [viewSeven addSubview:label7];
    [label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(labelSevenTwo.mas_left);
        make.width.equalTo(labelSevenone).dividedBy(2);
        make.top.equalTo(labelSevenTwo.mas_bottom);
        make.height.mas_equalTo(30);
    }];

    UIButton *button7=[UIButton new];
    [viewSeven addSubview:button7];
    [button7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(viewSeven);
    }];
    [button7 addTarget:self action:@selector(jump7) forControlEvents:UIControlEventTouchUpInside];
    
    
    request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/YKService/DataService/RainRealTimeList/1/15/330784/asc"]];
    /*
    response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        NSArray *array=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSDictionary *dic=array[0];
        label7.text=[dic objectForKey:@"TotalCount"];//雨量站个数
    }*/
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            id getdat=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            NSDictionary *dic=getdat[0];
             label7.text=[dic objectForKey:@"TotalCount"];//雨量站个数
        }
        
    }];

    
    
    
    
    

}
-(void)json1//需要改成异步
{
    //天气预报
    request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/YKService/DataService/Weather/101210907"]];
    
    response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        NSArray *array=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSDictionary *dic=array[0];
        NSArray *array1=[dic objectForKey:@"Contents"];
        NSDictionary *dicNew=array1[0];
        label1.text=[dicNew objectForKey:@"temperature"];
    }
   
    
    
    
    //超警个数
    
   request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/YKService/DataService/WaterList/1/999999/0/0/330784/desc"]];
    
    response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        NSArray *array=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSDictionary *dic=array[0];
        NSArray *array1=[dic objectForKey:@"Contents"];
        sum=0;
        for (int i=0; i<array1.count; i++) {
            NSDictionary *dicNew=array1[i];
            if ([dicNew objectForKey:@"warn_status"]) {
                sum++;
            }
    
        }
        
    }
    
    //供水总量
    request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/qsxk/api/GSService/getHeadData"]];
    
    response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        id getData=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        
     
        NSArray *arrNew=[getData objectForKey:@"Contents"];
        for (int i=0; i<arrNew.count; i++) {
            NSDictionary *dicNew=arrNew[i];
            NSString *str=[dicNew objectForKey:@"skgszl"];
            label3.text=[NSString stringWithFormat:@"%@万方",str];
 
    
        }
    }
    
        
    
    
    
}


-(void)jumpOne//值班电话
{

    zbdhViewController *gvc=[zbdhViewController new];
    
    [self.navigationController pushViewController:gvc animated:YES];

}
-(void)jumpTwo//汛情资料
{
    xqzlViewController *gvc=[xqzlViewController new];
    
    [self.navigationController pushViewController:gvc animated:YES];

}
-(void)jumpThree//取用水
{
    qysViewController *gvc=[qysViewController new];
    [self.navigationController pushViewController:gvc animated:YES];


}
-(void)jumpFour//水质管理
{
    szglViewController *gvc=[szglViewController new];
    [self.navigationController pushViewController:gvc animated:YES];



}
-(void)jumpFive//考核指标
{
}
-(void)jump1//天气预报
{
    tianqiViewController *gvc=[tianqiViewController new];
    [self.navigationController pushViewController:gvc animated:YES];
}
-(void)jump2//台风路径
{
    taiFengViewController *gvc=[taiFengViewController new];
    [self.navigationController pushViewController:gvc animated:YES];

}
-(void)jump3//供水管理
{
    gsglViewController *gvc=[gsglViewController new];
    [self.navigationController pushViewController:gvc animated:YES];


}
-(void)jump4//卫星云图
{
    wxytViewController *gvc=[wxytViewController new];
    [self.navigationController pushViewController:gvc animated:YES];
}
-(void)jump5//工情
{
    gqViewController *gvc=[gqViewController new];
    [self.navigationController pushViewController:gvc animated:YES];
}
-(void)jump6//水情
{
    sqTabViewController *gvc=[sqTabViewController new];
    [self.navigationController pushViewController:gvc animated:YES];
}
-(void)jump7//雨情
{
    yqViewController *gvc=[yqViewController new];
    [self.navigationController pushViewController:gvc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

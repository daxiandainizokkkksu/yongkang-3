//
//  tabBarQuyongshuiViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/12.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "tabBarQuyongshuiViewController.h"
#import <Masonry.h>

@interface tabBarQuyongshuiViewController ()
{
    
    UIImageView *image;
    UILabel *label11;//监测点个数
    UILabel *label21;//本月取水
    UILabel *label31;//上月取水
    UILabel *label41;//nill
    UILabel *label51;//本年取水
    UILabel *label61;//上年取水
    
}
@end

@implementation tabBarQuyongshuiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createLabel];//最上方label的创建
    [self createUi];//界面的创建于完善
    [self json];//获取网络数据并显示
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createLabel
{
    
    //最上层图片添加
    self.view.backgroundColor=[UIColor orangeColor];
    
    image=[UIImageView new];
    image.image=[UIImage imageNamed:@"primit_bg.png"];
    [self.view addSubview:image];
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.height.mas_equalTo(self.view.mas_height).dividedBy(6);
        make.top.equalTo(self.view.mas_top).offset(64);
        
        
    }];
    
    UILabel *label1=[UILabel new];//许可证总数
    UILabel *label2=[UILabel new];//批准取水量
    UILabel *label3=[UILabel new];//实际取水量
    UILabel *label4=[UILabel new];//已过期
    UILabel *label5=[UILabel new];//近期一个月
    UILabel *label6=[UILabel new];//近期三个月
    
    [image addSubview:label1];
    [image addSubview:label2];
    [image addSubview:label3];
    [image addSubview:label4];
    [image addSubview:label5];
    [image addSubview:label6];
    
    
    label1.text=@"监测点个数";
    label2.text=@"本月取水";
    label3.text=@"上月取水";
   // label4.text=@"   已过期   ";
    label5.text=@"本年取水";
    label6.text=@"上年取水";
    
    label1.adjustsFontSizeToFitWidth=YES;
    label2.adjustsFontSizeToFitWidth=YES;
    label3.adjustsFontSizeToFitWidth=YES;
    label4.adjustsFontSizeToFitWidth=YES;
    label5.adjustsFontSizeToFitWidth=YES;
    label6.adjustsFontSizeToFitWidth=YES;
    
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(image.mas_top);
        make.width.equalTo(self.view.mas_width).dividedBy(6);
        make.height.equalTo(image.mas_height).dividedBy(4);
    }];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_top);
        make.bottom.equalTo(label1.mas_bottom);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(label1.mas_width);
    }];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_top);
        make.bottom.equalTo(label1.mas_bottom);
        make.right.equalTo(self.view.mas_right).offset(-20);
        make.width.equalTo(label1.mas_width);
        
    }];
    
    /*
     //可以用在红字
     [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
     make.left.mas_equalTo(label1.mas_left);
     make.right.mas_equalTo(label1.mas_right);
     make.centerY.mas_equalTo(image.mas_centerY).dividedBy(2);
     make.height.mas_equalTo(label1.mas_height);
     
     }];
     */
    
    
    
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(label1.mas_left);
        make.right.mas_equalTo(label1.mas_right);
        make.centerY.mas_equalTo(image.mas_centerY).offset(10);
        make.height.mas_equalTo(label1.mas_height);
        
    }];
    
    
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_left);
        make.right.equalTo(label2.mas_right);
        make.bottom.equalTo(label4.mas_bottom);
        make.height.mas_equalTo(label2.mas_height);
    }];
    
    [label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_left);
        make.right.equalTo(label3.mas_right);
        make.bottom.equalTo(label4.mas_bottom);
        make.height.equalTo(label3.mas_height);
        
        
    }];
    
    
    label11=[UILabel new];//许可证总数
    label21=[UILabel new];//批准取水量
    label31=[UILabel new];//实际取水量
    label41=[UILabel new];//已过期
    label51=[UILabel new];//近期一个月
    label61=[UILabel new];//近期三个月
    
    [image addSubview:label11];
    [image addSubview:label21];
    [image addSubview:label31];
    [image addSubview:label41];
    [image addSubview:label51];
    [image addSubview:label61];
    
    NSString *one=@"222";
    label11.text=[NSString stringWithFormat:@"%@",one];//@"许可证总数";
    label21.text=[NSString stringWithFormat:@"%@",one];//@"批准取水量";
    label31.text=[NSString stringWithFormat:@"%@",one];//@"实际取水量";
   // label41.text=[NSString stringWithFormat:@"%@",one];//@"   已过期   ";
    label51.text=[NSString stringWithFormat:@"%@",one];//@"近期一个月";
    label61.text=[NSString stringWithFormat:@"%@",one];//@"近期三个月";
    
    label11.adjustsFontSizeToFitWidth=YES;
    label21.adjustsFontSizeToFitWidth=YES;
    label31.adjustsFontSizeToFitWidth=YES;
    label41.adjustsFontSizeToFitWidth=YES;
    label51.adjustsFontSizeToFitWidth=YES;
    label61.adjustsFontSizeToFitWidth=YES;
    
    
    label11.textColor=[UIColor orangeColor];
    label21.textColor=[UIColor orangeColor];
    label31.textColor=[UIColor orangeColor];
    label41.textColor=[UIColor orangeColor];
    label51.textColor=[UIColor orangeColor];
    label61.textColor=[UIColor orangeColor];
    
    
    
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(label1.mas_centerX);
        make.height.equalTo(image.mas_height).dividedBy(4);
        make.top.equalTo(label1.mas_bottom);
        
    }];
    
    [label21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(label2.mas_centerX);
        make.height.equalTo(label2.mas_height);
        make.top.equalTo(label2.mas_bottom);
        
    }];
    [label31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(label3.mas_centerX);
        make.height.equalTo(label3.mas_height);
        make.top.equalTo(label3.mas_bottom);
        
    }];
    [label41 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(label4.mas_centerX);
        make.height.equalTo(label4.mas_height);
        make.top.equalTo(label4.mas_bottom);
        
    }];
    [label51 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(label5.mas_centerX);
        make.height.equalTo(label5.mas_height);
        make.top.equalTo(label5.mas_bottom);
        
    }];
    [label61 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(label6.mas_centerX);
        make.height.equalTo(label6.mas_height);
        make.top.equalTo(label6.mas_bottom);
        
    }];
    
  
}


-(void)createUi
{
    UIView *viewCenter=[UIView new];
    [self.view addSubview:viewCenter];
    [viewCenter mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(image.mas_bottom);
        make.height.mas_equalTo(image.mas_height).dividedBy(2);
    }];
    UILabel *lable=[UILabel new];
    lable.text=@"本月取水";
    [viewCenter addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(viewCenter);
    }];
    
    
    
    
    
}


-(void)json
{

    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/qsxk/api/jcdService/getIndexCountForSS"]];
    NSData *response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    NSDictionary *dicXkz=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
    
    NSArray *arry=[dicXkz objectForKey:@"Contents"];
    
    NSDictionary *dic1=arry[0];
   
    label11.text=[dic1 objectForKey:@"num"];//监测点个数
    label21.text=[dic1 objectForKey:@"nqsl_by"];//本月取水量
    label31.text=[dic1 objectForKey:@"nqsl_sy"];//上月取水量
    label51.text=[dic1 objectForKey:@"nqsl_bn"];//本年取水量
    label61.text=[dic1 objectForKey:@"nqsl_sn"];//上年取水量
    

}



@end

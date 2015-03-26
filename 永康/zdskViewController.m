//
//  zdskViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/25.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "zdskViewController.h"
#import <Masonry.h>
#import "gsTableViewCell.h"
#import "zdskDetailViewController.h"
@interface zdskViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UILabel *labelOne;
    UILabel *labelTwo;
    UILabel *labelThree;
    UILabel *labelFour;
    UILabel *labelFive;
    UIImageView *imageHead;
    NSString *sum;
    NSMutableArray *arrSkbm;
    NSMutableArray *arrSkmc;
    NSMutableArray *arrSskr;
    NSMutableArray *arrSssw;
    

}

@end

@implementation zdskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self json];
    [self createUi];
    
    //NSLog(@"%f",imageHead.frame.size.height);
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height/6+64, self.view.frame.size.width, self.view.frame.size.height-64-49-self.view.frame.size.height/6)];
    tableView.delegate = self;
    tableView.dataSource =self;
    [self.view addSubview:tableView];
    tableView.rowHeight=self.view.frame.size.height/10;

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)createUi
{
    self.view.backgroundColor=[UIColor whiteColor];
    imageHead=[UIImageView new];
    imageHead.image=[UIImage imageNamed:@"primit_bg.png"];
    [self.view addSubview:imageHead];
    [imageHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.height.equalTo(self.view.mas_height).dividedBy(6);
    }];
   
    UILabel *label1=[UILabel new];
    UILabel *label2=[UILabel new];
    UILabel *label3=[UILabel new];
    UILabel *label4=[UILabel new];
    UILabel *label5=[UILabel new];
    label1.text=@"重点水库可供水总量";
    label2.text=@"需水总量";
    label3.text=@"单村水厂";
    label4.text=@"联村水厂";
    label5.text=@"规模水厂";
    label1.adjustsFontSizeToFitWidth=YES;
    label2.adjustsFontSizeToFitWidth=YES;
    label3.adjustsFontSizeToFitWidth=YES;
    label4.adjustsFontSizeToFitWidth=YES;
    label5.adjustsFontSizeToFitWidth=YES;
    /*
    label2.font=[UIFont systemFontOfSize:15];
    label3.font=[UIFont systemFontOfSize:15];
    label4.font=[UIFont systemFontOfSize:15];
    label5.font=[UIFont systemFontOfSize:15];*/
    
    [imageHead addSubview:label1];
    [imageHead addSubview:label2];
    [imageHead addSubview:label3];
    [imageHead addSubview:label4];
    [imageHead addSubview:label5];
    
    
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageHead.mas_left).offset(20);
        make.top.equalTo(imageHead.mas_top);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(self.view.mas_width).dividedBy(3);
    }];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(imageHead.mas_right).offset(-20);
        make.bottom.equalTo(label1.mas_bottom);
        make.top.equalTo(label1.mas_top);
        make.width.equalTo(imageHead.mas_width).dividedBy(6);
    }];
    
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_left);
        make.centerY.equalTo(imageHead.mas_centerY).offset(5);
        make.height.mas_equalTo(25);
        make.width.equalTo(imageHead.mas_width).dividedBy(6);
    }];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label3.mas_top);
        make.bottom.equalTo(label3.mas_bottom);
        make.centerX.equalTo(self.view.mas_centerX);
        make.width.equalTo(imageHead.mas_width).dividedBy(6);
        
    }];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(label2.mas_right);
        make.top.equalTo(label3.mas_top);
        make.bottom.equalTo(label3.mas_bottom);
        make.width.equalTo(imageHead.mas_width).dividedBy(6);
    }];
    
    labelFive=[UILabel new];
    labelFour=[UILabel new];
    labelOne=[UILabel new];
    labelThree=[UILabel new];
    labelTwo=[UILabel new];
    [imageHead addSubview:labelTwo];
    [imageHead addSubview:labelThree];
    [imageHead addSubview:labelOne];
    [imageHead addSubview:labelFour];
    [imageHead addSubview:labelFive];
    /*
    labelFive.adjustsFontSizeToFitWidth=YES;
    labelFour.adjustsFontSizeToFitWidth=YES;
    labelOne.adjustsFontSizeToFitWidth=YES;
    labelThree.adjustsFontSizeToFitWidth=YES;
    labelTwo.adjustsFontSizeToFitWidth=YES;
    */
    [labelOne mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1.mas_left);
        make.top.equalTo(label1.mas_bottom).offset(-5);
        make.width.equalTo(imageHead.mas_width).dividedBy(3);
        make.height.mas_equalTo(30);
    }];
    [labelTwo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(label2.mas_right);
        make.top.equalTo(labelOne.mas_top);
        make.bottom.equalTo(labelOne.mas_bottom);
    }];
 
    [labelThree mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_left);
        make.right.equalTo(label3.mas_right);
        make.top.equalTo(label3.mas_bottom).offset(-5);
        make.height.mas_equalTo(30);
    }];
    [labelFour mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(label4.mas_bottom);
        make.height.mas_equalTo(30);
        make.width.equalTo(self.view.mas_width).dividedBy(6);
        
    }];
    [labelFive mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(labelThree.mas_bottom);
        make.top.equalTo(labelThree.mas_top);
        make.left.equalTo(label5.mas_left);
        make.right.equalTo(label5.mas_right);
    }];
    labelOne.font=[UIFont systemFontOfSize:15];
    labelTwo.font=[UIFont systemFontOfSize:15];
    labelThree.font=[UIFont systemFontOfSize:15];
    labelFour.font=[UIFont systemFontOfSize:15];
    labelFive.font=[UIFont systemFontOfSize:15];
    labelOne.textColor=[UIColor orangeColor];
    labelTwo.textColor=[UIColor orangeColor];
    labelThree.textColor=[UIColor orangeColor];
    labelFour.textColor=[UIColor orangeColor];
    labelFive.textColor=[UIColor orangeColor];
  
    labelOne.text=@"7674.370万方";
    labelTwo.text=@"440.8万方";
    labelThree.text=@"244个";
    labelFour.text=@"9个";
    labelFive.text=@"8个";
    

}



//设置表示图的头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/15)];
    headView.backgroundColor=[UIColor grayColor];
    UILabel *labelHead=[UILabel new];
    [headView addSubview:labelHead];
    [labelHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(headView.mas_left).offset(10);
        make.top.equalTo(headView.mas_top);
        make.bottom.equalTo(headView.mas_bottom);
        make.width.equalTo(headView.mas_width).dividedBy(3);
    }];
    labelHead.adjustsFontSizeToFitWidth=YES;
    labelHead.text=@"水利工程共13类";
    return headView;
    
}
//headview的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.view.frame.size.height/15;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSkmc.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mark=@"tableCell";
    /*
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:mark];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:mark];
    }*/
    
    gsTableViewCell *cell=(gsTableViewCell *)[tableView dequeueReusableCellWithIdentifier:mark];
    if (cell==nil) {
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"gsTableViewCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    cell.label1.text=arrSkmc[indexPath.row];
    cell.label2.text=@"实时库容:";
    cell.label3.text=[NSString stringWithFormat:@"%@",arrSskr[indexPath.row]];
    cell.label4.text=@"万方";
    cell.label5.text=@"实时水位:";
    cell.label6.text=[NSString stringWithFormat:@"%@",arrSssw[indexPath.row]];
    cell.label7.text=@"万方";
    cell.label8.hidden=YES;
    
    return cell;

}
-(void)json
{
    arrSkbm=[NSMutableArray new];
    arrSkmc=[NSMutableArray new];
    arrSskr=[NSMutableArray new];
    arrSssw=[NSMutableArray new];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/qsxk/api/GSService/getSkSsxx"]];
    NSData *response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        id getData=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        //NSLog(@"%@",[getData objectForKey:@"TotalCount"]);
        sum=[getData objectForKey:@"TotalCount"];
        NSArray *arrNew=[getData objectForKey:@"Contents"];
        
        for (int i=0; i<arrNew.count; i++) {
            NSDictionary *dicNew=arrNew[i];
            [arrSkbm addObject:[dicNew objectForKey:@"skbm"]];
            [arrSkmc addObject:[dicNew objectForKey:@"skmc"]];
            [arrSskr addObject:[dicNew objectForKey:@"sskr"]];
            [arrSssw addObject:[dicNew objectForKey:@"sssw"]];
        
        }
    }

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //NSDictionary *dicPass=@{@"scid":[arrScid objectAtIndex:indexPath.row],@"type":@"gmsc",@"name":[arrScmc objectAtIndex:indexPath.row]};
    
    
    //NSLog(@"one=%@,two=%@,name=%@",[dicPass objectForKey:@"scid" ],[dicPass objectForKey:@"type"],[dicPass objectForKey:@"name"]);
    
    zdskDetailViewController *gvc=[[zdskDetailViewController alloc]init];
    //gvc.dicGet=dicPass;
    [self.navigationController pushViewController:gvc animated:YES];
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}




@end

//
//  yqViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/16.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "yqViewController.h"
#import <Masonry.h>

#import "yqTableViewCell.h"
#import "yqmap.h"

@interface yqViewController ()<UITableViewDataSource,UITableViewDelegate>
{UILabel *label;
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    NSMutableArray *arrHour;
    NSMutableArray *arrDay;
}

@end

@implementation yqViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self json];
    //[self createUi];
    
    self.view.backgroundColor=[UIColor orangeColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.delegate = self;
    tableView.dataSource =self;
    [self.view addSubview:tableView];
    tableView.rowHeight=self.view.frame.size.height/10;
  
    
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




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr1.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    yqTableViewCell *cell=(yqTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell==nil) {
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"yqTableViewCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    cell.label1.text=arr1[indexPath.row];
    cell.label2.text=arr2[indexPath.row];
    cell.label3.text=arr3[indexPath.row];
    cell.dayYuliang.text=arrDay[indexPath.row];
    cell.hourYuliang.text=arrHour[indexPath.row];
    
    
    
    return cell;

}

-(void)json
{
    arr1=[NSMutableArray new];
    arr2=[NSMutableArray new];
    arr3=[NSMutableArray new];
    arrHour=[NSMutableArray new];
    arrDay=[NSMutableArray new];
    
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/YKService/DataService/RainRealTimeList/1/48/330784/asc"]];
    NSData *response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        NSArray *array=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        
        NSDictionary *dic=array[0];
        NSArray *array1=[dic objectForKey:@"Contents"];
        for (int i=0; i<array1.count; i++) {
            NSDictionary *dicNew=array1[i];
            [arr1 addObject:[dicNew objectForKey:@"stnm"]];
            [arr3 addObject:[dicNew objectForKey:@"town"]];
            [arr2 addObject:[dicNew objectForKey:@"rvnm"]];
            [arrHour addObject:[dicNew objectForKey:@"hour_rain"]];
            [arrDay addObject:[dicNew objectForKey:@"day_rain"]];
            
        }
    }
    
    
    
    
   // NSLog(@"%lu",(unsigned long)array1.count);




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
    labelHead.text=@"雨量站总数";
    
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    [headView addSubview:button1];
    [headView addSubview:button2];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(headView.mas_right).offset(-10);
        make.top.equalTo(headView.mas_top).offset(4);
        make.bottom.equalTo(headView.mas_bottom).offset(-4);
        make.width.equalTo(headView.mas_width).dividedBy(5);
    }];
    button1.backgroundColor=[UIColor redColor];
    [button1 setTitle:@"地图" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(button1.mas_top);
        make.bottom.equalTo(button1.mas_bottom);
        make.right.equalTo(button1.mas_left).offset(-5);
        make.width.equalTo(button1.mas_width);
    }];
    button2.backgroundColor=[UIColor redColor];
    [button2 setTitle:@"排序" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    
  
    return headView;
    

}
//headview的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.view.frame.size.height/15;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)jump
{
    yqmap *gvc=[yqmap new];
    [self.navigationController pushViewController:gvc animated:YES];
    
    //NSLog(@"waiting");

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

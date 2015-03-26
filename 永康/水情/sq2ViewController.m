//
//  sq2ViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/18.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "sq2ViewController.h"
#import <Masonry.h>
#import "sqTableViewCell.h"
@interface sq2ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    NSMutableArray *arr4;
    int sum;
}


@end

@implementation sq2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self json];//获取数据
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-49)];//表视图创建
    tableView.delegate = self;
    tableView.dataSource =self;
    [self.view addSubview:tableView];
    tableView.rowHeight=self.view.frame.size.height/10;//表视图行高


}


//headview的高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.view.frame.size.height/15;
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
        make.width.equalTo(headView.mas_width).dividedBy(4);
    }];
    labelHead.adjustsFontSizeToFitWidth=YES;
    labelHead.text=@"河道站总数:";
    UILabel *labelSum=[UILabel new];
    labelSum.textColor=[UIColor orangeColor];
    labelSum.adjustsFontSizeToFitWidth=YES;
    [headView addSubview:labelSum];
    [labelSum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labelHead.mas_top);
        make.left.equalTo(labelHead.mas_right);
        make.bottom.equalTo(labelHead.mas_bottom);
        make.width.mas_equalTo(10);
    }];
    labelSum.text=[NSString stringWithFormat:@"%d",sum];
    
    return headView;
    
}
//行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arr1.count;
}

//cell内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
     static NSString *SimpleTableIdentifier = @"SimlpeTableIdentifier";
     
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
     if(cell == nil) {
     cell = [[UITableViewCell alloc]
     initWithStyle:UITableViewCellStyleDefault
     reuseIdentifier:SimpleTableIdentifier];
     }
     
     return cell;
     */
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    sqTableViewCell *cell=(sqTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell==nil) {
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"sqTableViewCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    cell.label1.text=arr1[indexPath.row];
    cell.label2.text=arr2[indexPath.row];
    cell.label3.text=arr3[indexPath.row];
    cell.label4.text=arr4[indexPath.row];
    return cell;
    
    
    
    
}

-(void)json
{
    
    arr1=[NSMutableArray new];
    arr2=[NSMutableArray new];
    arr3=[NSMutableArray new];
    arr4=[NSMutableArray new];
   
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/YKService/DataService/WaterList/1/999999/0/0/330784/desc"]];
    NSData *response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        NSArray *array=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        NSDictionary *dic=array[0];
        NSArray *array1=[dic objectForKey:@"Contents"];
        sum=0;
        for (int i=0; i<array1.count; i++) {
            NSDictionary *dicNew=array1[i];
            
            if ([[dicNew objectForKey:@"sttpname"]isEqual:@"河道站"]) {
                sum++;
                [arr1 addObject:[dicNew objectForKey:@"stnm"]];
                [arr2 addObject:[dicNew objectForKey:@"subnm"]];
                [arr3 addObject:[dicNew objectForKey:@"town"]];
                [arr4 addObject:[dicNew objectForKey:@"zu"]];
                
            }
            
        }
        
    }
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

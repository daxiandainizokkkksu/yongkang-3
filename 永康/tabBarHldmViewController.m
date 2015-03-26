//
//  tabBarHldmViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/13.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "tabBarHldmViewController.h"
#import "szglTableViewCell.h"
#import <Masonry.h>
@interface tabBarHldmViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSString *sum;
    NSMutableArray *arrDmid;
    NSMutableArray *arrDmname;
    NSMutableArray *arrLiuyu;
    NSMutableArray *arrXiang;
    NSMutableArray *arrSz;
    NSMutableArray *arrSj;


}
@end

@implementation tabBarHldmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self json];
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-49-64)];//表视图创建
    tableView.delegate = self;
    tableView.dataSource =self;
    [self.view addSubview:tableView];
    tableView.rowHeight=self.view.frame.size.height/10;//表视图行高
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
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
        make.width.equalTo(headView.mas_width).dividedBy(3);
    }];
    labelHead.adjustsFontSizeToFitWidth=YES;
    NSString *str=[NSString stringWithFormat:@"水功能区个数%@",sum];
    labelHead.text=str;
    labelHead.font=[UIFont boldSystemFontOfSize:15];
    return headView;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrSj.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mark=@"tableCell";
    szglTableViewCell *cell=(szglTableViewCell *)[tableView dequeueReusableCellWithIdentifier:mark];
    if (cell==nil) {
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"szglTableViewCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    cell.labelSj.text=arrSj[indexPath.row];
    cell.labelDm.text=arrDmname[indexPath.row];
    cell.labelHl.text=arrXiang[indexPath.row];
    cell.labelSz.text=arrSz[indexPath.row];
    return cell;

}

-(void)json
{
    
    arrDmid=[NSMutableArray new];
    arrDmname=[NSMutableArray new];
    arrLiuyu=[NSMutableArray new];
    arrSj=[NSMutableArray new];
    arrSz=[NSMutableArray new];
    arrXiang=[NSMutableArray new];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/qsxk/api/DMService/getDmList"]];
    NSData *response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        id getData=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        //NSLog(@"%@",[getData objectForKey:@"TotalCount"]);
        sum=[getData objectForKey:@"TotalCount"];
        NSArray *arrNew=[getData objectForKey:@"Contents"];
        for (int i=0; i<arrNew.count; i++) {
            NSDictionary *dicNew=arrNew[i];
            
            //[arrDmid addObject:[dicNew objectForKey:@"dmid"]];
            [arrDmname addObject:[dicNew objectForKey:@"dmName"]];
           // [arrLiuyu addObject:[dicNew objectForKey:@"liuyu"]];
            [arrSj addObject:[dicNew objectForKey:@"SJ"]];
            
            [arrXiang addObject:[dicNew objectForKey:@"xiang"]];
            if (![[dicNew objectForKey:@"SZ"]isKindOfClass:[NSNull class]]) {
                [arrSz addObject:[dicNew objectForKey:@"SZ"]];
            }
            else{
             
                NSString *str=@"暂无数据";
                [arrSz addObject:str];
            
            }
            
            
                                  }
                                  }

}

@end

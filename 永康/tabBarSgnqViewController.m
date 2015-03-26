//
//  tabBarSgnqViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/13.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "tabBarSgnqViewController.h"
#import <Masonry.h>
@interface tabBarSgnqViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrXh;
    NSMutableArray *arrSgnqmc;
    NSMutableArray *arrHl;
    NSString *sum;
}
@end

@implementation tabBarSgnqViewController
@synthesize receivedData;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self json];
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-49)];
    tableView.delegate = self;
    tableView.dataSource =self;
    [self.view addSubview:tableView];
    tableView.rowHeight=self.view.frame.size.height/10;
   
    
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
    
    return headView;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrHl.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *mark=@"tableCell";
    UITableViewCell *cell=(UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:mark];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:mark];

    }
    cell.textLabel.text=arrSgnqmc[indexPath.row];
    cell.detailTextLabel.text=arrHl[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    cell.detailTextLabel.font=[UIFont systemFontOfSize:15];
    
        return cell;
 
}
-(void)json
{
    arrHl=[NSMutableArray new];
    arrXh=[NSMutableArray new];
    arrSgnqmc=[NSMutableArray new];
    
    /*
    NSURL *url=[NSURL URLWithString:@"http://114.215.170.1:8004/qsxk/api/sgnqService/getsgnqlist"];
    NSURLRequest *request=[[NSURLRequest alloc]initWithURL:url];
    NSOperationQueue *queue=[[NSOperationQueue alloc]init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if (data) {
            id  getData=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            //NSLog(@"%@",[getData objectForKey:@"Contents"]);
            NSLog(@"%@",[getData objectForKey:@"TotalCount"]);
            NSArray *arrNew=[getData objectForKey:@"Contents"];
            for (int i=0; i<arrNew.count; i++) {
                NSDictionary *dicNew=arrNew[i];
                [arrHl addObject:[dicNew objectForKey:@"hl"]];
                [arrXh addObject:[dicNew objectForKey:@"xh"]];
                [arrSgnqmc addObject:[dicNew objectForKey:@"sgnqmc"]];
                
                
            }
            
            
            
        }
    }];*/
      //NSURL *url=[NSURL URLWithString:@"http://114.215.170.1:8004/qsxk/api/sgnqService/getsgnqlist"];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/qsxk/api/sgnqService/getsgnqlist"]];
    NSData *response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        id getData=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        //NSLog(@"%@",[getData objectForKey:@"TotalCount"]);
        sum=[getData objectForKey:@"TotalCount"];
        NSArray *arrNew=[getData objectForKey:@"Contents"];
        for (int i=0; i<arrNew.count; i++) {
            NSDictionary *dicNew=arrNew[i];
            [arrHl addObject:[dicNew objectForKey:@"hl"]];
            [arrXh addObject:[dicNew objectForKey:@"xh"]];
            [arrSgnqmc addObject:[dicNew objectForKey:@"sgnqmc"]];
            
            
        }
    }

    
}




@end

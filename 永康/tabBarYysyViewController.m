//
//  tabBarYysyViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/13.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "tabBarYysyViewController.h"
#import "szglTableViewCell.h"
#import <Masonry.h>
@interface tabBarYysyViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSString *sum;
    NSMutableArray *arrDmmc;
    NSMutableArray *arrSz;
    NSMutableArray *arrSj;
    NSMutableArray *arrDmid;
    NSMutableArray *arrLiuyu;
    NSMutableArray *arrEiname;
    NSMutableArray *arrHl;
    
}
@end

@implementation tabBarYysyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self json];
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-49-64)];
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
    NSString *str=[NSString stringWithFormat:@"饮用水源地个数%@",sum];
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
    cell.labelHl.text=arrHl[indexPath.row];
    cell.labelDm.text=arrDmmc[indexPath.row];
    cell.labelSj.text=arrSj[indexPath.row];
    cell.labelSz.text=arrEiname[indexPath.row];
    return cell;
    
}





-(void)json
{
    arrDmid=[NSMutableArray new];
    arrDmmc=[NSMutableArray new];
    arrEiname=[NSMutableArray new];
    arrLiuyu=[NSMutableArray new];
    arrSj=[NSMutableArray new];
    arrSz=[NSMutableArray new];
    arrHl=[NSMutableArray new];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/qsxk/api/DMService/getYyssydList"]];
    NSData *response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        id getData=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        //NSLog(@"%@",[getData objectForKey:@"TotalCount"]);
        sum=[getData objectForKey:@"TotalCount"];
        NSArray *arrNew=[getData objectForKey:@"Contents"];
        for (int i=0; i<arrNew.count; i++) {
            NSDictionary *dicNew=arrNew[i];
            [arrDmid addObject:[dicNew objectForKey:@"dmid"]];
            [arrDmmc addObject:[dicNew objectForKey:@"dmmc"]];
            //[arrEiname addObject:[dicNew objectForKey:@"EIName"]];
            [arrLiuyu addObject:[dicNew objectForKey:@"liuyu"]];
            [arrSj addObject:[dicNew objectForKey:@"SJ"]];
            [arrHl addObject:[dicNew objectForKey:@"hl"]];
            
            //[arrSz addObject:[dicNew objectForKey:@"SZ"]];
            if (![[dicNew objectForKey:@"EIName"]isKindOfClass:[NSNull class]]) {
                [arrEiname addObject:[dicNew objectForKey:@"EIName"]];
            }
            else{
            
                [arrEiname addObject:@"nil"];
            
            }
            
        }
    }




}
@end

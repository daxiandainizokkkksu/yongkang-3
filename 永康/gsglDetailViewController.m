//
//  gsglDetailViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/26.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "gsglDetailViewController.h"
#import <Masonry.h>
@interface gsglDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrName;
    NSMutableArray *arrValue;
}
@end

@implementation gsglDetailViewController
@synthesize dicGet;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self json];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    tableView.delegate = self;
    tableView.dataSource =self;
    [self.view addSubview:tableView];
    tableView.rowHeight=self.view.frame.size.height/13;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.view.frame.size.height/20;
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
    //NSString *str=[NSString stringWithFormat:@"%@分类",[dicGet objectForKey:@"two"]];
    labelHead.text=[dicGet objectForKey:@"name"];
    return headView;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return arrName.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mark=@"tableCell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:mark];
    if (cell==nil) {
         cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:mark];
        
    }
    cell.textLabel.text=arrName[indexPath.row];
    cell.textLabel.font=[UIFont systemFontOfSize:15];
    cell.detailTextLabel.text=arrValue[indexPath.row];
    cell.detailTextLabel.textColor=[UIColor orangeColor];
    cell.detailTextLabel.font=[UIFont systemFontOfSize:15];
    return cell;

}
-(void)json
{
    arrName=[NSMutableArray new];
    arrValue=[NSMutableArray new];
    NSString *url=[NSString stringWithFormat:@"http://114.215.170.1:8004/qsxk/api/GSService/getscInfo?scid=%@&type=%@",[dicGet objectForKey:@"scid"],[dicGet objectForKey:@"type"]];
    NSLog(@"供水管理detailURl＝%@",url);
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    NSData *response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    if (response) {
        id getData=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        //NSDictionary *dic=getData[0];
        NSArray *array=[getData objectForKey:@"Contents"];
        
        for (int i=0; i<array.count; i++) {
            NSDictionary *dicNew=array[i];
            [arrName addObject:[dicNew objectForKey:@"name"]];
            [arrValue addObject:[dicNew objectForKey:@"value"]];
            
         
            
            
            //NSLog(@"%@",[dicNew objectForKey:@"name"]);

            
        }
       
       // NSArray *array1=[dic objectForKey:@"Contents"];
       // NSLog(@"%lu",(unsigned long)array1.count);
        /*
        for (int i=0; i<array1.count; i++) {
           NSDictionary *diwTable=array1[i];
            [arrName addObject:[dicNewTable objectForKey:@"name"]];
            [arrValue addObject:[dicNewTable objectForKey:@"value"]];
            
            NSLog(@"value=%@",[dicNewTable objectForKey:@"value"]);
            
            
        }*/
    }



}


@end

//
//  dcscViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/25.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "dcscViewController.h"
#import "gsTableViewCell.h"
#import "gsglDetailViewController.h"
@interface dcscViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrScid;
    NSMutableArray *arrScmc;
    NSMutableArray *arrCountry;
    NSMutableArray *arrSywz;
    NSMutableArray *arrSjgm;
    NSString *sum;
}
@end

@implementation dcscViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrScmc.count;
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
    }/*
      cell.lable1.text=arrSkmc[indexPath.row];
      cell.label2.text=@"实时库容:";
      cell.label3.text=[NSString stringWithFormat:@"%@",arrSskr[indexPath.row]];
      cell.label4.text=@"万方";
      cell.label5.text=@"实时水位:";
      cell.label6.text=[NSString stringWithFormat:@"%@",arrSssw[indexPath.row]];
      cell.label7.text=@"万方";*/
    cell.label1.text=arrScmc[indexPath.row];
    cell.label2.text=@"所在村庄:";
    cell.label3.text=arrSywz[indexPath.row];
    cell.label4.hidden=YES;
    cell.label5.text=@"供水规模:";
    cell.label6.text=[NSString stringWithFormat:@"%@",arrSjgm[indexPath.row]];
    cell.label7.text=@"万吨/日";
    cell.label8.text=arrCountry[indexPath.row];
    return cell;
    
}









-(void)json
{
    arrScid=[NSMutableArray new];
    arrScmc=[NSMutableArray new];
    arrSjgm=[NSMutableArray new];
    arrSywz=[NSMutableArray new];
    arrCountry=[NSMutableArray new];
    
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/qsxk/api/GSService/getDcscList"]];
    NSData *response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        id getData=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
        //NSLog(@"%@",[getData objectForKey:@"TotalCount"]);
        sum=[getData objectForKey:@"TotalCount"];
        NSArray *arrNew=[getData objectForKey:@"Contents"];
        
        for (int i=0; i<arrNew.count; i++) {
            NSDictionary *dicNew=arrNew[i];
            [arrScid addObject:[dicNew objectForKey:@"scid"]];
            [arrScmc addObject:[dicNew objectForKey:@"scmc"]];
            [arrCountry addObject:[dicNew objectForKey:@"country"]];
            [arrSywz addObject:[dicNew objectForKey:@"sscz"]];
            [arrSjgm addObject:[dicNew objectForKey:@"sjgm"]];
        }
    }
    
  
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dicPass=@{@"scid":[arrScid objectAtIndex:indexPath.row],@"type":@"dcsc",@"name":[arrScmc objectAtIndex:indexPath.row]};
    //传type和en_gr ProjectListWithWaterLevel/1/99999/330784/type/en_gr
    
    NSLog(@"one=%@,two=%@,name=%@",[dicPass objectForKey:@"scid" ],[dicPass objectForKey:@"type"],[dicPass objectForKey:@"name"]);
    
    gsglDetailViewController *gvc=[[gsglDetailViewController alloc]init];
    gvc.dicGet=dicPass;
    [self.navigationController pushViewController:gvc animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    
}
@end

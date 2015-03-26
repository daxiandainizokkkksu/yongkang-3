//
//  zdskDetailViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/26.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "zdskDetailViewController.h"
#import "UUChart.h"

@interface zdskDetailViewController ()<UUChartDataSource>
{
    UUChart *chartView;
}
@end

@implementation zdskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self create];
    self.view.backgroundColor=[UIColor whiteColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)create{
    chartView=[[UUChart alloc]initwithUUChartDataFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) withSource:self withStyle:UUChartLineStyle];
    
    [self.view addSubview:chartView];

}
-(NSArray *)getXTitles:(int)num
{
    NSMutableArray *xTitles = [NSMutableArray array];
    for (int i=0; i<num; i++) {
        NSString * str = [NSString stringWithFormat:@"R-%d",i];
        [xTitles addObject:str];
    }
    return xTitles;
}


#pragma mark -@requeired
-(NSArray *)UUChart_xLableArray:(UUChart *)chart
{
    return [self getXTitles:5];

}


- (NSArray *)UUChart_yValueArray:(UUChart *)chart
{
    NSArray *ary = @[@"22",@"44",@"15",@"40",@"42"];
    NSArray *ary1 = @[@"22",@"54",@"15",@"30",@"42",@"77",@"43"];
    return @[ary,ary1];
    
}

- (NSArray *)UUChart_ColorArray:(UUChart *)chart
{
    return @[UUGreen,UURed,UUBrown];
}
-(CGRange)UUChartChooseRangeInLineChart:(UUChart *)chart
{
    return CGRangeMake(100, 0);

}
@end

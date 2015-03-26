//
//  xqzlViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/12.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "xqzlViewController.h"

@interface xqzlViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation xqzlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    //    lab.backgroundColor = [UIColor greenColor];
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    table.delegate = self;
    table.dataSource = self;
    
    
    
    
    
    [self.view addSubview:table];
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    return cell;
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

//
//  zdskDetailViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/26.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "zdskDetailViewController.h"
#import "myTableViewCell.h"


@interface zdskDetailViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation zdskDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor=[UIColor whiteColor];
    UITableView *mytableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:mytableView];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return section?1:4;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier=@"TableViewCell";
    myTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        <#statements#>
    }

}

@end

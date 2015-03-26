//
//  qysViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/12.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

//
//取用水界面 tabbar：tabBarQuyongshuiViewController.h  tabBarXukezhengViewController.h两个界面
//
//
#import "qysViewController.h"
#import "tabBarQuyongshuiViewController.h"
#import "tabBarXukezhengViewController.h"

@interface qysViewController ()

@end

@implementation qysViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    tabBarQuyongshuiViewController *vc2=[tabBarQuyongshuiViewController new];
    
    tabBarXukezhengViewController *vc1=[tabBarXukezhengViewController new];
    
   // vc1.view.backgroundColor=[UIColor redColor];
    vc1.title=@"许可证";
    
    //vc2.view.backgroundColor=[UIColor greenColor];
    vc2.title=@"取用水";
    [self setViewControllers:[NSArray arrayWithObjects:vc1,vc2, nil] animated:YES];
    
    
    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

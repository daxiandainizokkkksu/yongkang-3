//
//  szglViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/12.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "szglViewController.h"
#import "tabBarSgnqViewController.h"
#import "tabBarHldmViewController.h"
#import "tabBarYysyViewController.h"
@interface szglViewController ()

@end

@implementation szglViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    tabBarSgnqViewController *vc1=[tabBarSgnqViewController new];
    tabBarYysyViewController *vc2=[tabBarYysyViewController new];
    tabBarHldmViewController *vc3=[tabBarHldmViewController new];
   
    vc1.title=@"水功能区";
    vc2.title=@"饮用水源";
    vc3.title=@"河流断面";
    [self setViewControllers:[NSArray arrayWithObjects:vc1,vc2,vc3,nil] animated:YES];
    
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

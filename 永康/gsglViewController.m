//
//  gsglViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/25.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "gsglViewController.h"
#import "zdskViewController.h"
#import "gmscViewController.h"
#import "lcscViewController.h"
#import "dcscViewController.h"

@interface gsglViewController ()

@end

@implementation gsglViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    zdskViewController *vc1=[zdskViewController new];
    gmscViewController *vc2=[gmscViewController new];
    lcscViewController *vc3=[lcscViewController new];
    dcscViewController *vc4=[dcscViewController new];
    vc1.title=@"重点水库";
    vc2.title=@"规模水厂";
    vc3.title=@"联村水厂";
    vc4.title=@"单村水厂";
    [self setViewControllers:[NSArray arrayWithObjects:vc1,vc2,vc3,vc4, nil] animated:YES];
    
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

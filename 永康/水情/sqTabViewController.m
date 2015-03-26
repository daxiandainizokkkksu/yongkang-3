//
//  sqTabViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/18.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "sqTabViewController.h"
#import "sq1ViewController.h"
#import "sq2ViewController.h"

@interface sqTabViewController ()
{
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *arr3;
    NSMutableArray *arr4;
    NSMutableArray *arrSttpName;

}

@end

@implementation sqTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    sq1ViewController *vc1=[sq1ViewController new];
    sq2ViewController *vc2=[sq2ViewController new];
    
    vc1.title=@"水库";
    vc2.title=@"河道";
    [self setViewControllers:[NSArray arrayWithObjects:vc1,vc2, nil] animated:YES];
   // [self json];
    
    
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

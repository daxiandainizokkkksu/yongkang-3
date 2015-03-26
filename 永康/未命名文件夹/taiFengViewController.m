//
//  taiFengViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/26.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "taiFengViewController.h"

@interface taiFengViewController ()

@end

@implementation taiFengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //台风直接为webview
    UIWebView *web=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:web];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://typhoon.zjwater.gov.cn/wap.htm"]];
    [web loadRequest:request];
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

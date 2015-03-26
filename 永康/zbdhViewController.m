//
//  zbdhViewController.m
//  永康
//
//  Created by 杨建良 on 15/3/10.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "zbdhViewController.h"
#import <Masonry.h>
#import "zbdhTableViewCell.h"
@interface zbdhViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *arrNickName;
    NSMutableArray *arrUnitName;
    NSMutableArray *arrTel;


}
@end

@implementation zbdhViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self json];
    // Do any additional setup after loading the view.
    //    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 50, 50)];
    //    lab.backgroundColor = [UIColor greenColor];
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    table.delegate = self;
    table.dataSource = self;
    table.rowHeight=self.view.frame.size.height/10;
    [self.view addSubview:table];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrNickName.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mark=@"tableCell";
    zbdhTableViewCell *cell=(zbdhTableViewCell *)[tableView dequeueReusableCellWithIdentifier:mark];
    if (cell==nil) {
        
        NSArray *nib=[[NSBundle mainBundle]loadNibNamed:@"zbdhTableViewCell" owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    cell.label1.text=arrNickName[indexPath.row];
    cell.label2.text=arrUnitName[indexPath.row];
    cell.labetel.text=arrTel[indexPath.row];
   // cell.imageView.image=[UIImage imageNamed:@"ico_weather_0.png"];
    if ([arrTel[indexPath.row]isEqual:@""]) {
        cell.labetel.text=@"暂无数据";
    }
    
    return cell;
    
}
-(void)json
{
    arrNickName=[NSMutableArray new];
    arrTel=[NSMutableArray new];
    arrUnitName=[NSMutableArray new];
    NSURLRequest *request=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://114.215.170.1:8004/qsxk/api/UserService/getUserList"]];
    NSData *response=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    if (response) {
        id getData=[NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:nil];
       
        NSArray *arrNew=[getData objectForKey:@"Contents"];
        for (int i=0; i<arrNew.count; i++) {
            NSDictionary *dicNew=arrNew[i];
            [arrUnitName addObject:[dicNew objectForKey:@"unitName"]];
            [arrNickName addObject:[dicNew objectForKey:@"nickName"]];
            if (![[dicNew objectForKey:@"tel"]isKindOfClass:[NSNull class]]) {
               [arrTel addObject:[dicNew objectForKey:@"tel"]];
                //NSLog(@"%d",i);
            }
            
            
        }
    }
    





}

@end

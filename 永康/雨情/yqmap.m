//
//  yqmap.m
//  永康
//
//  Created by 杨建良 on 15/3/17.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import "yqmap.h"
#import <MapKit/MapKit.h>
#import <Masonry.h>

@interface yqmap ()
{
    CLGeocoder *_geocoder;
    //CLLocation *location;
   // CLRegion *region;
   // NSDictionary *addressDic;

}

@end

@implementation yqmap

- (void)viewDidLoad {
    [super viewDidLoad];
    
    map=[MKMapView new];
   // map.showsUserLocation=YES;//开启定位服务
    map.mapType=MKMapTypeHybrid;//地图类型
    [self.view addSubview:map];
    [map mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.view.mas_bottom);
        make.top.equalTo(self.view.mas_top).offset(64);
    }];
    
  
    CLLocationCoordinate2D coords;
    coords.latitude=28.92;
    coords.longitude=120.02;
    
    MKCoordinateSpan span;
    span.latitudeDelta=0.1;
    span.longitudeDelta=0.1;
    MKCoordinateRegion region;
    region.center=coords;
    region.span=span;
    
    [map setRegion:region animated:YES];
    
   // _geocoder=[[CLGeocoder alloc]init];
    //[self getCoordinateByAddress:@"永康"];
    
    
    
}

#pragma mark 根据地名确定地理坐标
-(void)getCoordinateByAddress:(NSString *)address{
    //地理编码
    [_geocoder geocodeAddressString:address completionHandler:^(NSArray *placemarks, NSError *error) {
        //取得第一个地标，地标中存储了详细的地址信息，注意：一个地名可能搜索出多个地址
        CLPlacemark *placemark=[placemarks firstObject];
        
         CLLocation *location=placemark.location;//位置
        CLRegion *region=placemark.region;//区域
        NSDictionary *addressDic= placemark.addressDictionary;//详细地址信息字典,包含以下部分信息
        //        NSString *name=placemark.name;//地名
        //        NSString *thoroughfare=placemark.thoroughfare;//街道
        //        NSString *subThoroughfare=placemark.subThoroughfare; //街道相关信息，例如门牌等
        //        NSString *locality=placemark.locality; // 城市
        //        NSString *subLocality=placemark.subLocality; // 城市相关信息，例如标志性建筑
        //        NSString *administrativeArea=placemark.administrativeArea; // 州
        //        NSString *subAdministrativeArea=placemark.subAdministrativeArea; //其他行政区域信息
        //        NSString *postalCode=placemark.postalCode; //邮编
        //        NSString *ISOcountryCode=placemark.ISOcountryCode; //国家编码
        //        NSString *country=placemark.country; //国家
        //        NSString *inlandWater=placemark.inlandWater; //水源、湖泊
        //        NSString *ocean=placemark.ocean; // 海洋
        //        NSArray *areasOfInterest=placemark.areasOfInterest; //关联的或利益相关的地标
        NSLog(@"位置:%@,区域:%@,详细信息:%@",location,region,addressDic);
    }];
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

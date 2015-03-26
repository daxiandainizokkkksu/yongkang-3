//
//  yqmap.h
//  永康
//
//  Created by 杨建良 on 15/3/17.
//  Copyright (c) 2015年 杨建良. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface yqmap : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>
{
    MKMapView *map;
    CLLocationManager *locatonManager;

}

@end

//
//  MapViewController.h
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/17.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController <MKMapViewDelegate>
{
    
}

@property (nonatomic, retain) IBOutlet MKMapView *map;
@property (nonatomic, retain) NSTimer *timer;
@property (retain, nonatomic) IBOutlet UIActivityIndicatorView *loadingMark;
@end

//
//  BusMarkView.h
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/17.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface BusMarkView : MKAnnotationView
{
}

@property (nonatomic) float direction;
@property (nonatomic) float radius;
@property (nonatomic) int colorCode;

@end
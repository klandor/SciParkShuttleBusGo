//
//  BusMarkAnnotation.h
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/17.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "BusMarkView.h"

@interface BusMarkAnnotation : NSObject <MKAnnotation> {
    
	NSString *title;
	CLLocationCoordinate2D coordinate;
    
}

@property (nonatomic, readonly, copy) NSString *title;
@property (nonatomic, readonly, copy) NSString *subtitle;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic) int colorCode;
@property (nonatomic) float direction;

- (id)initWithTitle:(NSString *)ttl andCoordinate:(CLLocationCoordinate2D)c2d;
- (void)passInfoToBus:(BusMarkView *) bus;

@end
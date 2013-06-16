//
//  BusMarkAnnotation.m
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/17.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import "BusMarkAnnotation.h"

@implementation BusMarkAnnotation
@synthesize title, subtitle, coordinate, colorCode, direction, updateTime;

- (id)initWithTitle:(NSString *)ttl andSubtitle:(NSString *)sttl  andCoordinate:(CLLocationCoordinate2D)c2d {
	self = [super init];
    if(self){
        title = ttl;
        subtitle = sttl;
        coordinate = c2d;
    }
	return self;
}

- (void)passInfoToBus:(BusMarkView *) bus{
    bus.direction = self.direction;
    bus.colorCode = self.colorCode;
}

@end
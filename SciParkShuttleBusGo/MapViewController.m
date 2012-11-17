//
//  MapViewController.m
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/17.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import "MapViewController.h"
//#import "MapViewAnnotation.h"
//#import "BusMarkView.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize map;

int direction = 0;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    //    [reverseGeocoder release];
    [map release];
    //    [getAddressButton release];
    
    [super dealloc];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //mapView.userTrackingMode = MKUserTrackingModeFollow;
    map.showsUserLocation = YES;
    
    // Set some coordinates for our position (Buckingham Palace!)
	CLLocationCoordinate2D location;
	location.latitude = (double) 24.789481;
	location.longitude = (double) 120.995390;
    
	// Add the annotation to our map view
//	MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc] initWithTitle:@"Buckingham Palace" andCoordinate:location];
//    newAnnotation.direction = direction;
//	[self.map addAnnotation:newAnnotation];
//    direction += 90;
//    [newAnnotation release];
	
    
	// Do any additional setup after loading the view.
    MKCoordinateRegion region;
    region.center.latitude = 24.789481;
    region.center.longitude = 120.995390;
    MKCoordinateSpan span;
    span.latitudeDelta = .002;
    span.longitudeDelta = .002;
    region.span = span;
    [map setRegion:region animated:YES];
}

//- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
//    //NSLog(@"Lat: %f, Lon: %f", mapView.region.center.latitude, mapView.region.center.longitude);
//    NSEnumerator *e = [mapView.annotations objectEnumerator];
//    id object;
//    while (object = [e nextObject]) {
//        [mapView removeAnnotation:object];
//        NSLog(@"annotation removed");
//    }
//    
//    // Set some coordinates for our position (Buckingham Palace!)
//	CLLocationCoordinate2D location;
//	location.latitude = (double) 24.789481;
//	location.longitude = (double) 120.995391;
//    
//	// Add the annotation to our map view
//	MapViewAnnotation *newAnnotation = [[MapViewAnnotation alloc]
//                                        initWithTitle:@"Bus"
//                                        andCoordinate:location];
//    newAnnotation.direction = direction;
//	[mapView addAnnotation:newAnnotation];
//    [newAnnotation release];
//    
//    direction += 90;
//    if(direction >= 360)
//    {
//        direction = 0;
//    }
//    
//    //[mapView setCenterCoordinate:mapView.region.center animated:NO];
//}


//- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id <MKAnnotation>) annotation
//{
//    BusMarkView *bus = [mapView dequeueReusableAnnotationViewWithIdentifier:@"bus"];
//    if(bus == nil){
//        bus = [[[BusMarkView alloc] initWithAnnotation:annotation reuseIdentifier:@"bus"] autorelease];
//    }
//    
//    if ([annotation respondsToSelector:@selector(passInfoToBus:)]) {
//        NSLog(@"passInfoToBus");
//        [annotation passInfoToBus:bus];
//    }
//    
//    // redraw the view
//    [bus setNeedsDisplay];
//    return bus;
//}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


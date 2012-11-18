//
//  MapViewController.m
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/17.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import "MapViewController.h"
#import "BusMarkAnnotation.h"
#import "BusMarkView.h"
#import "GDataXMLNode.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize map, timer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    NSLog(@"MapViewController init");
    return self;
}

- (void)dealloc
{
    [map release];
    [_loadingMark release];
    [timer invalidate];
    [timer release];
    [super dealloc];
}

- (void)updateBus
{
    [self.loadingMark startAnimating];
    NSData *xmlData;
    while (true) {
        // online url: http://117.56.78.38/sipa/busAzimuth.xml
        // testing url: https://dl.dropbox.com/u/169167/busAzimuth.xml
        xmlData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://dl.dropbox.com/u/169167/busAzimuth.xml"]];
        if(xmlData)
        {
            break;
        }
        NSLog(@"Fetching data failure, retry in 5 sec.");
        [NSThread sleepForTimeInterval:5];
    }
    
    //remove all anotation
    [self removeAllBusMark];
    
    //
    NSError *error;
    GDataXMLDocument *xml = [[GDataXMLDocument alloc] initWithData:xmlData options:0 error:&error];
    NSArray *buses = [xml.rootElement children];
    NSEnumerator *e = [buses objectEnumerator];
    GDataXMLElement *bus;
    while(bus = [e nextObject])
    {
        if ([[[bus attributeForName:@"OnOff"].stringValue uppercaseString] isEqualToString:@"ON"])
        {
            NSLog(@"BUS %@", [bus attributeForName:@"LP"].stringValue);
            CLLocationCoordinate2D location;
            location.latitude = [[bus attributeForName:@"Lat"].stringValue doubleValue];
            location.longitude = [[bus attributeForName:@"Lng"].stringValue doubleValue];
            
            BusMarkAnnotation *newAnnotation = [[BusMarkAnnotation alloc] initWithTitle:[bus attributeForName:@"LP"].stringValue andCoordinate:location];
            newAnnotation.direction = [[bus attributeForName:@"Azimuth"].stringValue doubleValue];
            newAnnotation.colorCode = [[bus attributeForName:@"ColorId"].stringValue intValue];
            [self.map addAnnotation:newAnnotation];
            [newAnnotation release];
        }
    }
    
    [self.loadingMark stopAnimating];
}

- (void)removeAllBusMark
{
    NSEnumerator *e = [map.annotations objectEnumerator];
    id annotation;
    while (annotation = [e nextObject]) {
        if ([annotation isKindOfClass:[BusMarkAnnotation class]]) {
            [map removeAnnotation:annotation];
        }
    }

}

- (void)setupTimer
{
    timer = [NSTimer scheduledTimerWithTimeInterval: 5
                                             target: self
                                           selector: @selector(updateBus)
                                           userInfo: nil
                                            repeats: YES];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupTimer];
   
    //mapView.userTrackingMode = MKUserTrackingModeFollow;
    map.showsUserLocation = YES;
    
    // Set some coordinates for our position (Buckingham Palace!)
	CLLocationCoordinate2D location;
	location.latitude = (double) 24.789481;
	location.longitude = (double) 120.995390;
    
	// Add the annotation to our map view
//	BusMarkAnnotation *newAnnotation = [[BusMarkAnnotation alloc] initWithTitle:@"Buckingham Palace" andCoordinate:location];
//    newAnnotation.direction = 75;
//    newAnnotation.colorCode = 1;
//	[self.map addAnnotation:newAnnotation];
//    [newAnnotation release];
	
    
	// Do any additional setup after loading the view.
    MKCoordinateRegion region;
    region.center.latitude = 24.782065;
    region.center.longitude = 121.004524;
    MKCoordinateSpan span;
    span.latitudeDelta = .05;
    span.longitudeDelta = .05;
    region.span = span;
    [map setRegion:region animated:YES];
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    NSLog(@"Lat: %f, Lon: %f, delta: (%f,%f)",
          mapView.region.center.latitude,
          mapView.region.center.longitude,
          mapView.region.span.latitudeDelta,
          mapView.region.span.longitudeDelta);
    
}


- (MKAnnotationView *) mapView: (MKMapView *) mapView viewForAnnotation: (id <MKAnnotation>) annotation
{
    if ([annotation isKindOfClass:[BusMarkAnnotation class]]) {
        MKAnnotationView *bus = [mapView dequeueReusableAnnotationViewWithIdentifier:annotation.title];
        if(bus == nil){
            bus = [[[BusMarkView alloc] initWithAnnotation:annotation reuseIdentifier:annotation.title] autorelease];
        }
        
        // pass information
        [annotation performSelector:@selector(passInfoToBus:) withObject:bus];
        
        // redraw the view
        [bus setNeedsDisplay];
        
        return bus;
    }
    else
    {   // use default view
        return nil;
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setLoadingMark:nil];
    [super viewDidUnload];
}
@end


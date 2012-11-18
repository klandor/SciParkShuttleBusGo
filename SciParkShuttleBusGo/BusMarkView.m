//
//  BusMarkView.m
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/17.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import "BusMarkView.h"

@implementation BusMarkView

@synthesize direction, radius, colorCode;

- (id)initWithAnnotation:(id <MKAnnotation>)annotation reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.opaque = NO;
        self.radius = 10;
        self.frame = CGRectMake(0,0,self.radius*2.2,self.radius*2.2);
        self.direction = 0;
    }
    return self;
}



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    self.centerOffset = CGPointMake( -(sin(direction*M_PI/180))*self.radius/10, (cos(direction*M_PI/180))*self.radius/10 );
    
    UIColor *color = [self colorWithHalfAlpha:NO];
    UIColor *colorFill = [self colorWithHalfAlpha:YES];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw outlone
    CGContextSetLineWidth(context, 2.0);
    [self drawArrow:context];
    [color setStroke];
    CGContextStrokePath(context);
    
    // fill color
    [self drawArrow:context];
    [colorFill setFill];
    CGContextFillPath(context);
    
    // central dot
    CGRect rectangle = CGRectMake( self.radius*1.1 + self.centerOffset.x-2.5, self.radius*1.1 + self.centerOffset.y-2.5,5,5);
    CGContextAddEllipseInRect(context, rectangle);
    [color setFill];
    CGContextFillPath(context);
}



- (void)drawArrow:(CGContextRef)context{
    float tmp_dir = direction;
    
    CGContextMoveToPoint(context, (sin(tmp_dir*M_PI/180) +1.1)*self.radius,(-cos(tmp_dir*M_PI/180) +1.1)*self.radius);
    
    tmp_dir += 140;
    CGContextAddLineToPoint(context, (sin(tmp_dir*M_PI/180) +1.1)*self.radius,(-cos(tmp_dir*M_PI/180) +1.1)*self.radius);
    
    tmp_dir += 40;
//    CGContextAddLineToPoint(context, (sin(tmp_dir*M_PI/180)/4+1.1)*self.radius,(-cos(tmp_dir*M_PI/180)/4+1.1)*self.radius);
    tmp_dir += 40;
    CGContextAddLineToPoint(context, (sin(tmp_dir*M_PI/180) +1.1)*self.radius,(-cos(tmp_dir*M_PI/180) +1.1)*self.radius);
    
    tmp_dir += 140;
    CGContextAddLineToPoint(context, (sin(tmp_dir*M_PI/180) +1.1)*self.radius,(-cos(tmp_dir*M_PI/180) +1.1)*self.radius);
    
}

- (UIColor*)colorWithHalfAlpha:(BOOL) halfAlpha{
    CGFloat R,G,B,alpha;
    switch (colorCode) {
        case 1:
            //purple
            R = 0.9;
            G = 0;
            B = 0.9;
            break;
            
        case 2:
            //green
            R = 0;
            G = 0.9;
            B = 0;
            break;
            
        case 3:
            //red
            R = 0.9;
            G = 0;
            B = 0;
            break;
            
        case 4:
            //orange
            R = 0.9;
            G = 0.45;
            B = 0;
            break;
            
        default:
            R = 0.1;
            G = 0.1;
            B = 0.1;
            break;
    }
    
    if(halfAlpha)
        alpha = 0.5;
    else
        alpha = 1;
    
    return [UIColor colorWithRed:R green:G blue:B alpha:alpha];
}

@end

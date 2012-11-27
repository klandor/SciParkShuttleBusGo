//
//  SettingViewController.h
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/27.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingViewDelegate.h"

@interface SettingViewController : UIViewController
- (IBAction)back:(id)sender;
- (IBAction)tabShowCurrentLocation:(id)sender;
@property (nonatomic, retain) id<SettingViewDelegate> delegate;
@property (retain, nonatomic) IBOutlet UISwitch *CurrentLocationSwitch;
@end

//
//  SettingViewController.h
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/27.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController
- (IBAction)tabShowCurrentLocation:(id)sender;
- (IBAction)tabUrl:(id)sender;
@property (retain, nonatomic) IBOutlet UISwitch *CurrentLocationSwitch;
@end

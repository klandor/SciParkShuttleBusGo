//
//  SettingViewController.h
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/27.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface SettingViewController : UITableViewController <UITableViewDelegate, MFMailComposeViewControllerDelegate>
- (IBAction)tabShowCurrentLocation:(id)sender;
@property (retain, nonatomic) IBOutlet UISwitch *CurrentLocationSwitch;
@end

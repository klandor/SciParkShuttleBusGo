//
//  SettingViewController.m
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/27.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)tabShowCurrentLocation:(id)sender
{
    UISwitch *sw = sender;
    [[NSUserDefaults standardUserDefaults] setBool:sw.on forKey:@"ShowUserLocation"];
    
}

- (IBAction)tabUrl:(id)sender {
    NSURL *chromeUrl = [NSURL URLWithString:@"googlechrome://117.56.78.38"];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:chromeUrl])
    {
        [app openURL:chromeUrl];
    }
    else
    {
        [app openURL:[NSURL URLWithString:@"http://117.56.78.38"]];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.CurrentLocationSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:@"ShowUserLocation"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [_CurrentLocationSwitch release];
    [super dealloc];
}

- (void)viewDidUnload {
    [self setCurrentLocationSwitch:nil];
    [super viewDidUnload];
}
@end

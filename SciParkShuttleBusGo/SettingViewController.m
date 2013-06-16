//
//  SettingViewController.m
//  SciParkShuttleBusGo
//
//  Created by 刁培倫 on 12/11/27.
//  Copyright (c) 2012年 klandor. All rights reserved.
//

#import "SettingViewController.h"
#import "ZoomingPDFViewerViewController.h"

#define ShowUserLocationKey @"ShowUserLocation"

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
    [[NSUserDefaults standardUserDefaults] setBool:sw.on forKey:ShowUserLocationKey];
    
}

- (void)openOfficalWebSite {
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.section) {
        case 1: // 園區巴士資訊
            switch (indexPath.row) {
                case 0: // 路線圖
                    [self pushWebViewWithURL:[NSURL URLWithString:@"http://www.sipa.gov.tw/content/file/1020617_all.pdf"] andTitle:@"巡迴巴士路線圖"];
                    break;
                case 1: // 時刻表
                    
                    break;
                case 2: // 即時交通網
                    [self openOfficalWebSite];
                    break;
                    
                default:
                    break;
            }
            break;
        case 2: // 支援
            switch (indexPath.row) {
                case 0: // GitHub
                    
                    break;
                case 1: // feedback email
                    break;
                default:
                    break;
            }
            break;
        default:
            break;
    }
}

-(void)pushWebViewWithURL:(NSURL*) url andTitle:(NSString*) title
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard_iPhone" bundle:nil];
    ZoomingPDFViewerViewController *webView = [storyboard instantiateViewControllerWithIdentifier:@"ZoomingPDFViewer"];
    webView.navigationItem.title = title;
    [self.navigationController pushViewController:webView animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.CurrentLocationSwitch.on = [[NSUserDefaults standardUserDefaults] boolForKey:ShowUserLocationKey];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setCurrentLocationSwitch:nil];
    [super viewDidUnload];
}
@end

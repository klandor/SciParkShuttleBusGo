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
                case 0: // 時刻表
                    [self pushWebViewWithURL:[[NSBundle mainBundle] URLForResource:@"1030901_all" withExtension:@"pdf"] andTitle:@"巡迴巴士時刻表"];
                    break;
                case 1: // 即時交通網
                    [self openOfficalWebSite];
                    break;
                    
                default:
                    break;
            }
            break;
        case 2: // 園區巴士 路線圖
            
            switch (indexPath.row) {
                case 0: // 紅線
                    [self pushWebViewWithURL:[[NSBundle mainBundle] URLForResource:@"1030901_line_red" withExtension:@"pdf"] andTitle:@"紅線 路線圖"];
                    break;
                case 1: // 綠線
                    [self pushWebViewWithURL:[[NSBundle mainBundle] URLForResource:@"1030901_line_green" withExtension:@"pdf"] andTitle:@"綠線 路線圖"];
                    break;
                case 2: // 紫線
                    [self pushWebViewWithURL:[[NSBundle mainBundle] URLForResource:@"1030901_line_purple" withExtension:@"pdf"] andTitle:@"紫線 路線圖"];
                    break;
                case 3: // 橘線
                    [self pushWebViewWithURL:[[NSBundle mainBundle] URLForResource:@"1030901_line_Orange" withExtension:@"pdf"] andTitle:@"橘線 路線圖"];
                    break;
                    
                default:
                    break;
            }
            break;

        case 3: // 支援
            switch (indexPath.row) {
                case 0: // GitHub
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/klandor/SciParkShuttleBusGo"]];
                    break;
                case 1: // feedback email
                    [self openEmailWriter];
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
    webView.url = url;
    webView.navigationItem.title = title;
    [self.navigationController pushViewController:webView animated:YES];
}

-(void)openEmailWriter
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:@"園區巴士GO 意見回饋"];
        NSArray *toRecipients = [NSArray arrayWithObjects:@"klandor+BusGo@gmail.com", nil];
        [mailer setToRecipients:toRecipients];
        NSString *emailBody = @"";
        [mailer setMessageBody:emailBody isHTML:NO];
        [self presentViewController:mailer animated:YES completion:nil];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"尚未設定電子信箱"
                                                        message:@"請設定電子信箱，或直接寄至 'klandor+BusGo@gmail.com'"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
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

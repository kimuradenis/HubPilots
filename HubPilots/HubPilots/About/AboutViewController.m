//
//  AboutViewController.m
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import "AboutViewController.h"
#import "SWRevealViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)feedbackButtonClicked:(id)sender
{
    MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
    mailComposer.mailComposeDelegate = self;
    [mailComposer setSubject:@"HubPilots - Feedback"];
    [mailComposer setToRecipients:@[@"kimuradenis@gmail.com"]];
    
    [self presentViewController:mailComposer animated:YES completion:nil];
    
}

- (IBAction)rateButtonClicked:(id)sender
{
    
}

- (IBAction)moreButtonClicked:(id)sender
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://hubpilots.com"]];
}

#pragma mark Mail Compose Delegate Methods

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    // Dismiss COmposer
    [self dismissViewControllerAnimated:YES completion:nil];

}

@end

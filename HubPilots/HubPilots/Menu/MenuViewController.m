//
//  MenuViewController.m
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import "MenuViewController.h"
#import "SWRevealViewController.h"


@interface MenuViewController ()

@end

@implementation MenuViewController

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
    
    [self.tableView setContentInset:UIEdgeInsetsMake(64, 0, 0, 0)];

    
    //Set self as Datasource and Delegate for the table view
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //Fetch the menu items
    self.menuItems = [[[MenuModel alloc] init] getMenuItems];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Table View Delegate Methods

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.menuItems.count;
}

-(float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Retrieve Cell
    NSString *cellIdentifier = @"MenuItemCell";
    UITableViewCell *menuCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    //Get Menu Item
    MenuItem *item = self.menuItems[indexPath.row];
    
    // Get imageview
    UIImageView *iconImageView = (UIImageView *)[menuCell viewWithTag:2];
    UILabel *menuItemTitle = (UILabel *)[menuCell viewWithTag:1];
    
    //Set Menu text
    menuItemTitle.text = item.menuTitle;
    iconImageView.image = [UIImage imageNamed:item.menuIcon];

    return menuCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //Check which item was tapped
    MenuItem *item = self.menuItems[indexPath.row];
    
    switch (item.screenType) {
        case ScreenTypeQuestion:
            [self performSegueWithIdentifier:@"GoToQuestionSegue" sender:self];
            break;
        case ScreenTypeStats:
            [self performSegueWithIdentifier:@"GoToStatsSegue" sender:self];
            break;
        case ScreenTypeAbout:
            [self performSegueWithIdentifier:@"GoToAboutSegue" sender:self];
            break;
        case ScreenTypeRemoveAds:
            [self performSegueWithIdentifier:@"GoToRemoveAdsSegue" sender:self];
            break;
        case ScreenTypeMeteoro:
            [self performSegueWithIdentifier:@"GoToMeteorologia" sender:self];
            break;
        case ScreenTypeRegulamentos:
            [self performSegueWithIdentifier:@"GoToRegulamentos" sender:self];
            break;
        
        default:
            break;
    }

}

#pragma mark Segue Methods

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
        //Set the front controller to be the destination
    [self.revealViewController setFrontViewController:segue.destinationViewController];
    
    //Slide the front view back
    [self.revealViewController revealToggleAnimated:YES];
}

@end

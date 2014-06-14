//
//  RemoveAdsViewController.h
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StoreKitHelper.h"

@interface RemoveAdsViewController : UIViewController <StoreKitHelperProtocol>

@property (weak, nonatomic) IBOutlet UILabel *productInfoLabel;
@property (weak, nonatomic) IBOutlet UIButton *productPurchaseButton;

@end

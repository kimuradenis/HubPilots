//
//  QuestionViewController.h
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RegulamentosModel.h"
#import "Regulamentos.h"
#import "RegulamentosResultView.h"
#import <Parse/Parse.h>
#import <iAd/iAd.h>
#import "SocialRegViewCell.h"


@interface RegulamentosViewController : UIViewController <ResultViewProtocol, ADBannerViewDelegate, UITableViewDelegate> {
    
    NSArray *messagesArray;
}

@property (strong, nonatomic) RegulamentosModel *model;
@property (strong, nonatomic) NSArray *questions;

@property (nonatomic) QuizQuestionSector questionSector;
@property (weak, nonatomic) IBOutlet UIScrollView *questionScrollView;

// Background View for question type
@property (weak, nonatomic) IBOutlet UIView *questionStatusBackgroundView;
@property (weak, nonatomic) IBOutlet UILabel *questionStatusLabel;

// Background for answer area

@property (weak, nonatomic) IBOutlet UIView *answerBackgroundView;


//Properties for UIElements
@property (weak, nonatomic) IBOutlet UILabel *questionHeaderLabel;

@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (weak, nonatomic) IBOutlet UILabel *questionIdNumber;
@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer1;
@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer2;
@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer3;
@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer4;
@property (weak, nonatomic) IBOutlet UILabel *answerHeaderLabel;

@property (weak, nonatomic) IBOutlet UIButton *skipButton;

// SOcial
- (IBAction)socialButton:(id)sender;
- (IBAction)socialBackButton:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *questionSocialLabel;
@property (strong, nonatomic) IBOutlet UILabel *answerSocialLabel;

@property (strong, nonatomic) IBOutlet UIView *socialView;
@property (weak, nonatomic) IBOutlet UITableView *socialTableView;

@end

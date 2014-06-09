//
//  StatsViewController.h
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StatsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *totalQuestionsAswered;
@property (weak, nonatomic) IBOutlet UILabel *navegacaoQuestionStats;
@property (weak, nonatomic) IBOutlet UILabel *meteorologiaQuestionStats;
@property (weak, nonatomic) IBOutlet UILabel *teoriaQuestionStats;
@property (weak, nonatomic) IBOutlet UILabel *regulamentosQuestionStats;
@property (weak, nonatomic) IBOutlet UILabel *conhecimentosQuestionStats;

@end

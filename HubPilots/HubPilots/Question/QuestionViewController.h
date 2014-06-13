//
//  QuestionViewController.h
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QuestionModel.h"
#import "Question.h"
#import "ResultView.h"

@interface QuestionViewController : UIViewController <ResultViewProtocol>

@property (strong, nonatomic) QuestionModel *model;
@property (strong, nonatomic) NSArray *questions;

@property (nonatomic) QuizQuestionSector questionSector;
@property (weak, nonatomic) IBOutlet UIScrollView *questionScrollView;

//Properties for UIElements
@property (weak, nonatomic) IBOutlet UILabel *questionText;
@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer1;
@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer2;
@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer3;
@property (weak, nonatomic) IBOutlet UIButton *questionMCAnswer4;

@property (weak, nonatomic) IBOutlet UIButton *skipButton;

@end

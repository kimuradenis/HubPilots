//
//  ResultView.m
//  HubPilots
//
//  Created by Denis Kimura on 10/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import "ResultView.h"

@implementation ResultView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization properties to new ui element objects
        self.resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 50, 200, 50)];
        self.resultLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.resultLabel];
        
        self.userAnswerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 120, 200, 100)];
        self.userAnswerLabel.numberOfLines = 0;
        self.userAnswerLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.userAnswerLabel];
        
        self.correctAnswerLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 240, 200, 100)];
        self.correctAnswerLabel.numberOfLines = 0;
        self.correctAnswerLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.correctAnswerLabel];
        
        
        self.continueButton = [UIButton buttonWithType:UIButtonTypeSystem];
        self.continueButton.frame = CGRectMake(85, 350, 150, 50);
        [self.continueButton setTitle:@"Continue" forState:UIControlStateNormal];
        [self.continueButton addTarget:self action:@selector(continueButtonClicked) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.continueButton];
        
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)hideAllElements
{
    self.resultLabel.hidden = YES;
    self.userAnswerLabel.hidden = YES;
    self.correctAnswerLabel.hidden = YES;
    self.continueButton.hidden = YES;
}

- (void)showResultForTextQuestion:(BOOL)wasCorrect forUserAnswer:(NSString*)useranswer forQuestion:(Question*)question
{
    // Hide all elements
    [self hideAllElements];
    
    // Set and show label if user was correct or not
    self.resultLabel.text = wasCorrect ? @"Correct!" : @"Incorrect";
    self.resultLabel.hidden = NO;
    
    // Set and show the user answer
    self.userAnswerLabel.text = [NSString stringWithFormat:@"Your answer was: \n%@", useranswer];
    self.userAnswerLabel.hidden = NO;
    
    // Set and show the correct answer
    NSString *correctAnswerString = @"";
    switch (question.correctMCQuestionIndex) {
        case 1:
            correctAnswerString = question.questionAnswer1;
            break;
        case 2:
            correctAnswerString = question.questionAnswer2;
            break;
        case 3:
            correctAnswerString = question.questionAnswer3;
            break;
        case 4:
            correctAnswerString = question.questionAnswer4;
            break;
        default:
            break;
    }
    self.correctAnswerLabel.text = [NSString stringWithFormat:@"The correct answer was: \n%@", correctAnswerString];
    self.correctAnswerLabel.hidden = NO;
    
    // Show continue button
    self.continueButton.hidden = NO;
    
}


- (void)continueButtonClicked
{
    // Notify delegate that result view can be dismissed
    [self.delegate resultViewDismissed];
}


@end

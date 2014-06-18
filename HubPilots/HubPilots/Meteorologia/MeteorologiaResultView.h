//
//  ResultView.h
//  HubPilots
//
//  Created by Denis Kimura on 10/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Meteorologia.h"

@protocol ResultViewProtocol <NSObject>

- (void)resultViewHeightDetermined;
- (void)resultViewDismissed;

@end

@interface MeteorologiaResultView : UIView

@property (nonatomic, weak) id<ResultViewProtocol> delegate;


// Label to display correct or incorrect
@property (nonatomic, strong) UILabel *resultLabel;
@property (nonatomic, strong) UIView *resultLabelBackgroundView;

// Label to display user answer
@property (nonatomic, strong) UILabel *userAnswerLabel;

// Label to display correct answer for text based questions
@property (nonatomic, strong) UILabel *correctAnswerLabel;

// Button to continue
@property (nonatomic, strong) UIButton *continueButton;

- (void)showResultForTextQuestion:(BOOL)wasCorrect forUserAnswer:(NSString*)useranswer forQuestion:(Meteorologia*)question;

//- (void)showResultForImageQuestion:(BOOL)wasCorrect forQuestion:(Question*)question;



@end

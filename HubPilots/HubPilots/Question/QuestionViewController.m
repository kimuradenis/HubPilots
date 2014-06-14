//
//  QuestionViewController.m
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import "QuestionViewController.h"
#import "SWRevealViewController.h"


@interface QuestionViewController ()

{
    Question *_currentQuestion;

    UIView *_tappablePortionOfImageQuestion;
    UITapGestureRecognizer *_tapRecognizer;
    UITapGestureRecognizer *_scrollViewTapGestureRecognizer;
    
    ResultView *_resultView;
    UIView *_dimmedBackground;
}

@end

@implementation QuestionViewController

@synthesize questionHeaderLabel, answerHeaderLabel;

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
    
    // Add tap gesture recognizer to scrollview
    _scrollViewTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTapped)];
    [self.questionScrollView addGestureRecognizer:_scrollViewTapGestureRecognizer];
    
    // Add pan gesture recognizer for menu reveal
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    // Hide everything
    [self hideAllQuestionElements];

    
    //Create Quiz Model
    self.model = [[QuestionModel alloc] init];
    
    //Check sector and retrieve questions from desired sector
    self.questions = [self.model getQuestions:self.questionSector];
    
    // Randomize a question
    [self randomizeQuestionForDisplay];
    
    // Display the question
    [self displayCurrentQuestion];
    
    // Add background behind status bar
    UIView *statusBarBg =[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    statusBarBg.backgroundColor = [UIColor colorWithRed:144/255.0 green:192/255.0 blue:210/255.0 alpha:1.0];
    [self.view addSubview:statusBarBg];
    
    // Set Button styles
    UIColor *buttonBorderColor = [UIColor colorWithRed:232/255.0 green:232/255.0 blue:232/255.0 alpha:1.0];
    
    [self.questionMCAnswer1.layer setBorderWidth:1.0];
    [self.questionMCAnswer2.layer setBorderWidth:1.0];
    [self.questionMCAnswer3.layer setBorderWidth:1.0];
    [self.questionMCAnswer4.layer setBorderWidth:1.0];
    [self.questionMCAnswer1.layer setBorderColor:buttonBorderColor.CGColor];
    [self.questionMCAnswer2.layer setBorderColor:buttonBorderColor.CGColor];
    [self.questionMCAnswer3.layer setBorderColor:buttonBorderColor.CGColor];
    [self.questionMCAnswer4.layer setBorderColor:buttonBorderColor.CGColor];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //Create a result View
    _resultView = [[ResultView alloc] initWithFrame:CGRectMake(10, 10, self.view.frame.size.width - 20, self.view.frame.size.height - 20)];
    _resultView.delegate = self;
    
    //Create dimmed bg
    _dimmedBackground = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _dimmedBackground.backgroundColor = [UIColor blackColor];
    _dimmedBackground.alpha = 0.4;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideAllQuestionElements
{
    // Hide the header elements
    self.questionHeaderLabel.alpha = 0.0;
    
    
    CGRect answerHeaderLabelFrame = self.answerHeaderLabel.frame;
    answerHeaderLabelFrame.origin.y = 2000;
    self.answerHeaderLabel.frame = answerHeaderLabelFrame;
    
    // Hide answer background
    CGRect answerBackgroundFrame = self.answerBackgroundView.frame;
    answerBackgroundFrame.origin.y = 2000;
    self.answerBackgroundView.frame = answerBackgroundFrame;

    // Fade out the question text label
    self.questionText.alpha = 0.0;
    

    
    // Hide answer buttons
    CGRect buttonFrame = self.questionMCAnswer1.frame;
    buttonFrame.origin.y = 2000;
    self.questionMCAnswer1.frame = buttonFrame;
    
    buttonFrame = self.questionMCAnswer2.frame;
    buttonFrame.origin.y = 2000;
    self.questionMCAnswer2.frame = buttonFrame;
    
    buttonFrame = self.questionMCAnswer3.frame;
    buttonFrame.origin.y = 2000;
    self.questionMCAnswer3.frame = buttonFrame;
    
    buttonFrame = self.questionMCAnswer4.frame;
    buttonFrame.origin.y = 2000;
    self.questionMCAnswer4.frame = buttonFrame;
    
}
#pragma mark Question Methods
- (void)displayCurrentQuestion
{
    switch (_currentQuestion.questionType) {
        case QuestionTypeMC:
            [self displayMCQuestion];
            break;
            
        default:
            break;
    }
}

- (void)displayMCQuestion
{
    
    // Hide all elements
    [self hideAllQuestionElements];
    
    // Set question elements
    self.questionText.text = _currentQuestion.questionText;
    [self.questionMCAnswer1 setTitle:_currentQuestion.questionAnswer1 forState:UIControlStateNormal];
    [self.questionMCAnswer2 setTitle:_currentQuestion.questionAnswer2 forState:UIControlStateNormal];
    [self.questionMCAnswer3 setTitle:_currentQuestion.questionAnswer3 forState:UIControlStateNormal];
    [self.questionMCAnswer4 setTitle:_currentQuestion.questionAnswer4 forState:UIControlStateNormal];
    
    // Set text for answer label and positioning
    self.answerHeaderLabel.text = @"Resposta";
    
    CGRect answerLabelFrame = self.answerHeaderLabel.frame;
    answerLabelFrame.size.width = 280;
    self.answerHeaderLabel.frame = answerLabelFrame;
    [self.answerHeaderLabel sizeToFit];
    
    // Set question status label
    self.questionStatusLabel.text = @"Múltipla Escolha";
    
    // Adjust Scrollview
    self.questionScrollView.contentSize = CGSizeMake(self.questionScrollView.frame.size.width, self.skipButton.frame.origin.y + self.skipButton.frame.size.height + 30);
    
    
 /*   //Reveal question elements
    self.questionText.hidden = NO;
    self.questionMCAnswer1.hidden = NO;
    self.questionMCAnswer2.hidden = NO;
    self.questionMCAnswer3.hidden = NO;
    self.questionMCAnswer4.hidden = NO;
    self.answerBackgroundView.hidden = NO;
    self.answerHeaderLabel.hidden = NO; */
    
    // Animate label and button back to position
    [UIView animateWithDuration:1.0 animations:^(void){
        
        // Fade question text in
        self.questionText.alpha = 1.0;
        
       }];
    
    [UIView animateWithDuration:1 delay:0.1 options:UIViewAnimationOptionCurveEaseIn animations:^(void){
        // Position answer 1
        CGRect answerButton1Frame = self.questionMCAnswer1.frame;
        answerButton1Frame.origin.y = 225;
        self.questionMCAnswer1.frame = answerButton1Frame;
        
        // Slide up answer background with question
        CGRect answerBackgroundFrame = self.answerBackgroundView.frame;
        answerBackgroundFrame.origin.y = 225;
        self.answerBackgroundView.frame = answerBackgroundFrame;
        
        
    } completion:nil];
    
    
    
    [UIView animateWithDuration:1 delay:0.2 options:UIViewAnimationOptionCurveEaseIn animations:^(void){
        
        // Position answer 2
        CGRect answerButton2Frame = self.questionMCAnswer2.frame;
        answerButton2Frame.origin.y = 300;
        self.questionMCAnswer2.frame = answerButton2Frame;
        
    } completion:nil];
    

    
    [UIView animateWithDuration:1 delay:0.3 options:UIViewAnimationOptionCurveEaseIn animations:^(void){
        
        // Position answer 3
        CGRect answerButton3Frame = self.questionMCAnswer3.frame;
        answerButton3Frame.origin.y = 375;
        self.questionMCAnswer3.frame = answerButton3Frame;
        
    } completion:nil];

    

    
    [UIView animateWithDuration:1 delay:0.4 options:UIViewAnimationOptionCurveEaseIn animations:^(void){
        
        // Position answer 4
        CGRect answerButton4Frame = self.questionMCAnswer4.frame;
        answerButton4Frame.origin.y = 450;
        self.questionMCAnswer4.frame = answerButton4Frame;
        
    } completion:nil];
    
  /*
    [UIView animateWithDuration:0.5 delay:1 options:UIViewAnimationOptionCurveEaseIn animations:^(void){
        // Reveal Header labels
        self.questionHeaderLabel.alpha = 1.0;
        
    } completion:nil];
*/
    
    

    
}

- (void)randomizeQuestionForDisplay
{
    //randomize a question
    int randomQuestionIndex = arc4random() % self.questions.count;
    _currentQuestion = self.questions[randomQuestionIndex];
    
    //display question
    [self displayCurrentQuestion];
    
}

- (IBAction)menuButtonTapped:(id)sender {
    [self.revealViewController revealToggleAnimated:YES];
}

#pragma mark Question Answer Handlers

- (IBAction)skipButtonClicked:(id)sender
{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^(void){
        
        [self hideAllQuestionElements];
        
    } completion:^(BOOL finished) {
        
        
        // Randomize and display another question
        [self randomizeQuestionForDisplay];
    }];
    
}

- (IBAction)questionMCAnswer:(id)sender
{
    
    
    UIButton *selectedButton = (UIButton *)sender;
    BOOL isCorrect = NO;
    
    NSString *userAnswer;
    switch (selectedButton.tag) {
        case 1:
            userAnswer = _currentQuestion.questionAnswer1;
            break;
        case 2:
            userAnswer = _currentQuestion.questionAnswer2;
            break;
        case 3:
            userAnswer = _currentQuestion.questionAnswer3;
            break;
        case 4:
            userAnswer = _currentQuestion.questionAnswer4;
            break;
            
        default:
            break;
    }
    
    if (selectedButton.tag == _currentQuestion.correctMCQuestionIndex)
    {
        // User got it right
        isCorrect = YES;
        
    }
    else
    {
        // User got it wrong
    }

    // Display message for answer
    [_resultView showResultForTextQuestion:isCorrect forUserAnswer:userAnswer forQuestion:_currentQuestion];

    
    // Save question data
    [self saveQuestionData:_currentQuestion.questionType withSector:_currentQuestion.questionSector isCorrect:isCorrect];
    
    //display next question
    [self randomizeQuestionForDisplay];

}

- (void)saveQuestionData:(QuizQuestionType)type withSector:(QuizQuestionSector)sector isCorrect:(BOOL)correct
{
    NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];
    
    if (type == QuestionTypeMC) {
        // Record that they answered
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        int mcQuestionsAswered = [userDefaults integerForKey:@"MCQuestionsAnswered"];
        mcQuestionsAswered++;
        [userDefaults setInteger:mcQuestionsAswered forKey:@"MCQuestionAnswer"];

        if (correct) {
            // Record
            int mcQuestionsAnsweredCorrectly = [userDefaults integerForKey:@"MCQuestionsAnsweredCorrectly"];
            mcQuestionsAnsweredCorrectly++;
            [userDefaults setInteger:mcQuestionsAnsweredCorrectly forKey:@"MCQuestionsAnsweredCorrectly"];

        }
        
        // Save data based on Sector
        
        
        NSString *keyToSave = @"";
    
        if (sector == QuestionSectorNavegacao)
        {
            keyToSave = @"Navegacao";
        }
        else if (sector == QuestionSectorMeteorologia)
        {
            keyToSave = @"Meteorologia";

        }
        else if (sector == QuestionSectorRegulamentos)
        {
            keyToSave = @"Regulamentos";

        }
        else if (sector == QuestionSectorTeoria)
        {
            keyToSave = @"Teoria";

        }
        else if (sector == QuestionSectorConhecimentos)
        {
            keyToSave = @"Conhecimentos";

        }
        
        int questionAnsweredWithSector = [userDefaults integerForKey:[NSString stringWithFormat:@"%@QuestionsAnswered", keyToSave]];
        questionAnsweredWithSector++;
        [userDefaults setInteger:questionAnsweredWithSector forKey:[NSString stringWithFormat:@"%@QuestionsAnswered", keyToSave]];
        
        if (correct) {
            int questionAnsweredCorrectlyWithDifficulty = [userDefaults integerForKey:[NSString stringWithFormat:@"%@QuestionsAnsweredCorrectly", keyToSave]];
            questionAnsweredCorrectlyWithDifficulty++;
            [userDefaults setInteger:questionAnsweredCorrectlyWithDifficulty forKey:[NSString stringWithFormat:@"%@QuestionsAnsweredCorrectly", keyToSave]];
        }

    }
    
    [userdefaults synchronize];
}

#pragma mark Result View Delegate Methods

- (void)resultViewDismissed
{
    // Animate it into view
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void){
                         
                         _dimmedBackground.alpha = 0;
                         
                     }
                     completion:^(BOOL finished) {
                         [_dimmedBackground removeFromSuperview];
                     }];
    
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void){
                         
                         CGRect resultViewFrame = _resultView.frame;
                         resultViewFrame.origin.y = 2000;
                         _resultView.frame = resultViewFrame;
                         
                     }
                     completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:0.5
                                               delay:0
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^(void){
                                              
                                              [self hideAllQuestionElements];
                                              
                                          }
                                          completion:^(BOOL finished) {
                                              
                                              // Display next question
                                              [self randomizeQuestionForDisplay];
                                              
                                          }];
                         [_resultView removeFromSuperview];
                     }];

}

-(void)resultViewHeightDetermined
{
    // Fade in dimmed background
    _dimmedBackground.alpha = 0;
    
    [self.view addSubview:_dimmedBackground];
    
    // Position result view below screen
    CGRect resultViewFrame = _resultView.frame;
    resultViewFrame.origin.y = 2000;
    _resultView.frame = resultViewFrame;
    
    [self.view addSubview:_resultView];
    
    // Animate it into view
    [UIView animateWithDuration:0.3
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void){
                         
                         _dimmedBackground.alpha = 0.4;
                         
                     }
                     completion:nil];
    
    [UIView animateWithDuration:0.5
                          delay:0.1
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^(void){
                         
                         CGRect resultViewFrame = _resultView.frame;
                         resultViewFrame.origin.y = (self.view.frame.size.height - _resultView.frame.size.height)/2;
                         _resultView.frame = resultViewFrame;
                         
                     }
                     completion:nil];
}

@end

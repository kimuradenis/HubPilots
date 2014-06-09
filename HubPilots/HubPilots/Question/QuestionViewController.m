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
//    UITapGestureRecognizer *_scrollViewTapGestureRecognizer;
}

@end

@implementation QuestionViewController

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
    
/*    // Add tap gesture recognizer to scrollview
    _scrollViewTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(scrollViewTapped)];
    [self.questionScrollView addGestureRecognizer:_scrollViewTapGestureRecognizer]; */
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    [self hideAllQuestionElements];
    
    //Create Quiz Model
    self.model = [[QuestionModel alloc] init];
    
    //Check sector and retrieve questions from desired sector
    self.questions = [self.model getQuestions:self.questionSector];
    
    // Randomize a question
    [self randomizeQuestionForDisplay];
    
    // Display the question
    [self displayCurrentQuestion];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)hideAllQuestionElements
{
    self.questionText.hidden = YES;
    self.questionMCAnswer1.hidden = YES;
    self.questionMCAnswer2.hidden = YES;
    self.questionMCAnswer3.hidden = YES;
    self.questionMCAnswer4.hidden = YES;
    
}
#pragma mark Questin Methods

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
    // Set question elements
    self.questionText.text = _currentQuestion.questionText;
    [self.questionMCAnswer1 setTitle:_currentQuestion.questionAnswer1 forState:UIControlStateNormal];
    [self.questionMCAnswer2 setTitle:_currentQuestion.questionAnswer2 forState:UIControlStateNormal];
    [self.questionMCAnswer3 setTitle:_currentQuestion.questionAnswer3 forState:UIControlStateNormal];
    [self.questionMCAnswer4 setTitle:_currentQuestion.questionAnswer4 forState:UIControlStateNormal];
    
    // Adjust Scrollview
    self.questionScrollView.contentSize = CGSizeMake(self.questionScrollView.frame.size.width, self.skipButton.frame.origin.y + self.skipButton.frame.size.height + 30);
    
    //Reveal question elements
    self.questionText.hidden = NO;
    self.questionMCAnswer1.hidden = NO;
    self.questionMCAnswer2.hidden = NO;
    self.questionMCAnswer3.hidden = NO;
    self.questionMCAnswer4.hidden = NO;
}

- (void)randomizeQuestionForDisplay
{
    //randomize a question
    int randomQuestionIndex = arc4random() % self.questions.count;
    _currentQuestion = self.questions[randomQuestionIndex];
    
    //display question
    [self displayCurrentQuestion];
    
}

#pragma mark Question Answer Handlers

- (IBAction)skipButtonClicked:(id)sender
{
    // Randomize and display another question
    [self randomizeQuestionForDisplay];
}

- (IBAction)questionMCAnswer:(id)sender
{
    // Record that they answered
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    int mcQuestionsAswered = [userDefaults integerForKey:@"MCQuestionsAnswered"];
    mcQuestionsAswered++;
    [userDefaults setInteger:mcQuestionsAswered forKey:@"MCQuestionAnswer"];
    
    
    UIButton *selectedButton = (UIButton *)sender;
    
    if (selectedButton.tag == _currentQuestion.correctMCQuestionIndex)
    {
        // User got it right
        
        // TODO: display message for correct answer
        
        // Record
        int mcQuestionsAnsweredCorrectly = [userDefaults integerForKey:@"MCQuestionsAnsweredCorrectly"];
        mcQuestionsAnsweredCorrectly++;
        [userDefaults setInteger:mcQuestionsAnsweredCorrectly forKey:@"MCQuestionsAnsweredCorrectly"];
    }
    else
    {
        // User got it wrong
    }
    [userDefaults synchronize];
    
    //display next question
    [self randomizeQuestionForDisplay];

}

@end

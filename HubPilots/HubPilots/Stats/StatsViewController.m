//
//  StatsViewController.m
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import "StatsViewController.h"
#import "SWRevealViewController.h"

@interface StatsViewController ()

@end

@implementation StatsViewController

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
    
    //load and display stats
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    // Navegacao
    int navegacaoQuestionsAnswered = [userDefaults integerForKey:@"NavegacaoQuestionsAnswered"];
    int navegacaoQuestionsCorrect = [userDefaults integerForKey:@"NavegacaoQuestionsAnsweredCorrectly"];
    self.navegacaoQuestionStats.text = [NSString stringWithFormat:@"Navegação %i / %i", navegacaoQuestionsCorrect, navegacaoQuestionsAnswered];
    
    // Meteorologia
    int meteorologiaQuestionsAnswered = [userDefaults integerForKey:@"MeteorologiaQuestionsAnswered"];
    int meteorologiaQuestionsCorrect = [userDefaults integerForKey:@"MeteorologiaQuestionsAnsweredCorrectly"];
    self.meteorologiaQuestionStats.text = [NSString stringWithFormat:@"Meteorologia %i / %i", meteorologiaQuestionsCorrect, meteorologiaQuestionsAnswered];
    
    // Regulamentos
    int regulamentosQuestionsAnswered = [userDefaults integerForKey:@"RegulamentosQuestionsAnswered"];
    int regulamentosQuestionsCorrect = [userDefaults integerForKey:@"RegulamentosQuestionsAnsweredCorrectly"];
    self.navegacaoQuestionStats.text = [NSString stringWithFormat:@"Regulamentos %i / %i", regulamentosQuestionsCorrect, regulamentosQuestionsAnswered];
    
    // Teoria
    int teoriaQuestionsAnswered = [userDefaults integerForKey:@"TeoriaQuestionsAnswered"];
    int teoriaQuestionsCorrect = [userDefaults integerForKey:@"TeoriaQuestionsAnsweredCorrectly"];
    self.navegacaoQuestionStats.text = [NSString stringWithFormat:@"Teoria %i / %i", teoriaQuestionsCorrect, teoriaQuestionsAnswered];
    
    // Conhecimentos
    int conhecimentosQuestionsAnswered = [userDefaults integerForKey:@"ConhecimentosQuestionsAnswered"];
    int conhecimentosQuestionsCorrect = [userDefaults integerForKey:@"ConhecimentosQuestionsAnsweredCorrectly"];
    self.conhecimentosQuestionStats.text = [NSString stringWithFormat:@"Navegação %i / %i", conhecimentosQuestionsCorrect, conhecimentosQuestionsAnswered];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

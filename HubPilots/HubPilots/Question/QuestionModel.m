//
//  QuestionModel.m
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import "QuestionModel.h"
#import "Question.h"

@implementation QuestionModel

- (id)init {
    
    self = [super init];
    if (self)
    {
        self.navegacao = [[NSMutableArray alloc] init];
        self.meteorologia = [[NSMutableArray alloc] init];
        self.regulamentos = [[NSMutableArray alloc] init];
        self.teoria = [[NSMutableArray alloc] init];
        self.conhecimentos = [[NSMutableArray alloc] init];
        
        // Load questions.json and parse out questions into arrays
        [self loadQuestions];


    }
    return self;
}

- (NSMutableArray *)getQuestions:(QuizQuestionSector)sector
{
    if (sector == QuestionSectorNavegacao)
    {
        return self.navegacao;
    }
    else if (sector == QuestionSectorMeteorologia)
    {
        return self.meteorologia;
    }
    else if (sector == QuestionSectorRegulamentos)
    {
        return self.regulamentos;
    }
    else if (sector == QuestionSectorTeoria)
    {
        return self.teoria;
    }
    else if (sector == QuestionSectorConhecimentos)
    {
        return self.conhecimentos;
    }
    else
    {
        // Should not get into here
        return [[NSMutableArray alloc] init];
    }
}

- (void)loadQuestions
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"questions" ofType:@"json"];
    
    NSError *myerror;
    NSString *jsonString = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&myerror];
    
    NSData *myJsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSDictionary *myJsonDictionary = [NSJSONSerialization JSONObjectWithData:myJsonData options:NSJSONReadingAllowFragments error:nil];
    
    // Parse out navegacao questions
    NSArray *navegacaoJsonArray = myJsonDictionary[@"navegacao"];
    self.navegacao = [self parseJsonArrayIntoQuestions:navegacaoJsonArray forSector:QuestionSectorNavegacao];
    
    // Parse out meteorologia questions
    NSArray *meteorologiaJsonArray = myJsonDictionary[@"meteorologia"];
    self.meteorologia = [self parseJsonArrayIntoQuestions:meteorologiaJsonArray forSector:QuestionSectorMeteorologia];
    
    // Parse out regulamentos questions
    NSArray *regulamentosJsonArray = myJsonDictionary[@"regulamentos"];
    self.regulamentos = [self parseJsonArrayIntoQuestions:regulamentosJsonArray forSector:QuestionSectorRegulamentos];
    
    // Parse out teoria questions
    NSArray *teoriaJsonArray = myJsonDictionary[@"teoria"];
    self.teoria = [self parseJsonArrayIntoQuestions:teoriaJsonArray forSector:QuestionSectorTeoria];
    
    // Parse out conhecimentos questions
    NSArray *conhecimentosJsonArray = myJsonDictionary[@"conhecimentos"];
    self.conhecimentos = [self parseJsonArrayIntoQuestions:conhecimentosJsonArray forSector:QuestionSectorConhecimentos];
}

- (NSMutableArray*)parseJsonArrayIntoQuestions:(NSArray *)jsonArray forSector:(QuizQuestionSector)sector
{
    // Create temporary array to store newly created questions
    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
    
    // Loop through json objects in the passed in array
    for (int i = 0; i < jsonArray.count; i++)
    {
        // Get the json obj at this index
        NSDictionary *jsonObject = jsonArray[i];
        
        // Create new question object
        Question *newQuestion = [[Question alloc] init];
        newQuestion.questionSector = sector;
        
        if ([jsonObject[@"type"] isEqualToString:@"mc"])
        {
            // Parse out multiple choice type question
            newQuestion.questionType = QuestionTypeMC;
            newQuestion.questionText = jsonObject[@"question"];
            newQuestion.questionAnswer1 = jsonObject[@"answer0"];
            newQuestion.questionAnswer2 = jsonObject[@"answer1"];
            newQuestion.questionAnswer3 = jsonObject[@"answer2"];
            newQuestion.questionAnswer4 = jsonObject[@"answer3"];
            newQuestion.correctMCQuestionIndex = [jsonObject[@"correctanswer"] intValue];
        }
        
        // Add newly created question to temp array
        [tempArray addObject:newQuestion];
    }
    
    return tempArray;
}



@end

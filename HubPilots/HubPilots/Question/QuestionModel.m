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

    }
    return self;
}

- (NSMutableArray *)getQuestions:(QuizQuestionSector)sector
{
    // Create Some Nav Questions
    Question *newQuestion = [[Question alloc] init];
    newQuestion.questionSector = QuestionSectorNavegacao;
    newQuestion.questionType = QuestionTypeMC;
    newQuestion.questionText = @"This is a test question";
    newQuestion.questionAnswer1 = @"Answer 1";
    newQuestion.questionAnswer2 = @"Answer 2";
    newQuestion.questionAnswer3 = @"Answer 3";
    newQuestion.questionAnswer4 = @"Answer 4";
    newQuestion.correctMCQuestionIndex = 1;
    [self.navegacao addObject:newQuestion];
    
    return self.navegacao;
}


@end

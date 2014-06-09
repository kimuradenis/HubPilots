//
//  QuestionModel.h
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionModel : NSObject

@property (strong, nonatomic) NSMutableArray *navegacao;
@property (strong, nonatomic) NSMutableArray *meteorologia;
@property (strong, nonatomic) NSMutableArray *regulamentos;
@property (strong, nonatomic) NSMutableArray *teoria;
@property (strong, nonatomic) NSMutableArray *conhecimentos;

- (NSMutableArray *)getQuestions:(QuizQuestionSector)sector;

@end

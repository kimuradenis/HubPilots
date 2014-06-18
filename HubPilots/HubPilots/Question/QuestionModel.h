//
//  QuestionModel.h
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionModel : NSObject

@property (strong, nonatomic) NSMutableArray *navegacaoQuestions;
@property (strong, nonatomic) NSMutableArray *meteorologiaQuestions;
@property (strong, nonatomic) NSMutableArray *regulamentosQuestions;
@property (strong, nonatomic) NSMutableArray *teoriaQuestions;
@property (strong, nonatomic) NSMutableArray *conhecimentosQuestions;

- (NSMutableArray *)getQuestions:(QuizQuestionSector)sector;

@end

//
//  QuestionModel.h
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MeteorologiaModel : NSObject

@property (strong, nonatomic) NSMutableArray *meteorologiaQuestions;


- (NSMutableArray *)getQuestions:(QuizQuestionSector)sector;

@end

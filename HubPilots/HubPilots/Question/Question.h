//
//  Question.h
//  HubPilots
//
//  Created by Denis Kimura on 09/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property (strong, nonatomic) NSString *questionText;

@property (nonatomic) QuizQuestionType questionType;
@property (nonatomic) QuizQuestionSector questionSector;

@property (strong, nonatomic) NSString *questionAnswer1;
@property (strong, nonatomic) NSString *questionAnswer2;
@property (strong, nonatomic) NSString *questionAnswer3;
@property (strong, nonatomic) NSString *questionAnswer4;
@property (nonatomic) int correctMCQuestionIndex;

@end

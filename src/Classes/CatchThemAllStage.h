//
//  CatchThemAllStage.h
//  CatchThemAll
//
//  Created by saumya ray on 11/14/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sparrow.h"

#import "TextureUtil.h"
#import "CTASprite.h"
#import "CTARow.h"
#import "SaumyaEvent.h"


@interface CatchThemAllStage : SPSprite 
{
	SPJuggler *mJuggler;
	CTASprite *background;
	Boolean areOptionsOnScreen;
	int transitionAnimationCounter;
	
	CTARow *rowOne;
	CTARow *rowTwo;
	CTARow *rowThree;
	CTARow *rowFour;
	CTARow *rowFive;
	CTARow *rowSix;
	CTARow *rowSeven;
	CTARow *rowEight;
	
	int counter1;
	int counter2;
	int counter3;
	int counter4;
	int counter5;
	int correctAnswerNum;
	
	int userCorrectAnswerCount;
	int userWrongAnswerCount;
	SPTextField *displayScore;
	SPTextField *displayMiss;
	SPTextField *displayTotalAttempted;
	
	int timerCounter;
	SPTextField *displayTimer;
}

@property (nonatomic, retain) SPJuggler *mJuggler;
@property (nonatomic, retain) CTASprite *background;
@property (nonatomic, assign) Boolean areOptionsOnScreen;
@property (nonatomic, assign) int transitionAnimationCounter;

@property (nonatomic, retain) CTARow *rowOne;
@property (nonatomic, retain) CTARow *rowTwo;
@property (nonatomic, retain) CTARow *rowThree;
@property (nonatomic, retain) CTARow *rowFour;
@property (nonatomic, retain) CTARow *rowFive;
@property (nonatomic, retain) CTARow *rowSix;
@property (nonatomic, retain) CTARow *rowSeven;
@property (nonatomic, retain) CTARow *rowEight;

@property (nonatomic, assign) int counter1;
@property (nonatomic, assign) int counter2;
@property (nonatomic, assign) int counter3;
@property (nonatomic, assign) int counter4;
@property (nonatomic, assign) int counter5;
@property (nonatomic, assign) int correctAnswerNum;

@property (nonatomic, assign) int userCorrectAnswerCount;
@property (nonatomic, assign) int userWrongAnswerCount;
@property (nonatomic, retain) SPTextField *displayScore;
@property (nonatomic, retain) SPTextField *displayMiss;
@property (nonatomic, retain) SPTextField *displayTotalAttempted;
@property (nonatomic, assign) int timerCounter;
@property (nonatomic, retain) SPTextField *displayTimer;

- (id)initWithWidth:(float)width height:(float)height;

-(void)renderDefaultScreen;

-(void)advanceTime:(double)seconds;

-(void)transitIn;
-(void)transitOut;

@end

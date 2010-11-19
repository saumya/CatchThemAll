//
//  CatchThemAllStage.m
//  CatchThemAll
//
//  Created by saumya ray on 11/14/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "CatchThemAllStage.h"


@implementation CatchThemAllStage

@synthesize mJuggler;
@synthesize background;
@synthesize areOptionsOnScreen;
@synthesize transitionAnimationCounter;

@synthesize rowOne;
@synthesize rowTwo;
@synthesize rowThree;
@synthesize rowFour;
@synthesize rowFive;
@synthesize rowSix;
@synthesize rowSeven;
@synthesize rowEight;

@synthesize counter1;
@synthesize counter2;
@synthesize counter3;
@synthesize counter4;
@synthesize counter5;
@synthesize correctAnswerNum;

@synthesize userCorrectAnswerCount;
@synthesize userWrongAnswerCount;
@synthesize displayScore;
@synthesize displayMiss;
@synthesize displayTotalAttempted;
@synthesize timerCounter;
@synthesize displayTimer;



- (id)initWithWidth:(float)width height:(float)height
{
	if (self=[super init]) 
	{
		//Custom code
		//let the game begin :)
		[self renderDefaultScreen];
		NSLog(@"stage %@",self.stage);
	}
	return self;
}

-(void)renderDefaultScreen
{
	//initalises the values
	userWrongAnswerCount=0;
	userCorrectAnswerCount=0;
	self.areOptionsOnScreen=FALSE;
	//initalises score board
	timerCounter=0;
	self.displayScore=[SPTextField textFieldWithWidth:100 
											   height:20 
												 text:[NSString stringWithString:[NSString stringWithFormat:@"Scored : %i",000]] 
											 fontName:@"Helvetica" 
											 fontSize:15 
												color:0xAAAAAA];
	
	
	self.displayMiss=[SPTextField textFieldWithWidth:100 
											  height:20 
												text:[NSString stringWithString:[NSString stringWithFormat:@"Missed : %i",000]] 
											fontName:@"Helvetica" 
											fontSize:15 
												color:0xAAAAAA];
	
	self.displayTotalAttempted=[SPTextField textFieldWithWidth:320 
														height:20 
														  text:[NSString stringWithString:[NSString stringWithFormat:@"Attempts : %i",000]] 
													  fontName:@"Helvetica" 
													  fontSize:15 
														 color:0xAAAAAA];
	
	self.displayTimer=[SPTextField textFieldWithWidth:320 
											   height:20 
												 text:[NSString stringWithString:[NSString stringWithFormat:@"Counter : %i",000]] 
											 fontName:@"Helvetica" 
											 fontSize:15 
												color:0xAAAAAA];
	self.displayScore.x=00;
	self.displayScore.y=20;
	[self addChild:displayScore];
	self.displayMiss.x=200;
	self.displayMiss.y=20;
	[self addChild:displayMiss];
	self.displayTotalAttempted.x=10;
	self.displayTotalAttempted.y=5;
	[self addChild:displayTotalAttempted];
	
	self.displayTimer.x=000;
	self.displayTimer.y=450;
	[self addChild:displayTimer];
	
	
	//makes the background
	UIColor *bgFill=[UIColor colorWithRed:0.0/255.0 green:80.0/255.0 blue:142.0/255.0 alpha:1.0];
	UIColor *bgBorder=[UIColor colorWithRed:134.0/255.0 green:0.0/255.0 blue:255.0/255.0 alpha:1.0];
	SPTexture *bgTexture=makeRoundedRectWithBorder(320.0f, 480.0f, 40.0f, bgFill, bgBorder);
	SPImage *bg=[SPImage imageWithTexture:bgTexture];
	//
	background = [[CTASprite alloc]initWithDefault];
	[background addImage:bg];
	//add to the display list
	[background addChild:bg];
	//position the background
	background.x=background.width/2;
	background.y=background.height/2;
	//add to the display list
	[self addChild:background];
	//makes width and height 1, so as to animate in the beginning to the full value 
	//background.width=1;
	//background.height=1;
	//bring the score to top
	[self removeChild:displayScore];
	[self removeChild:displayMiss];
	[self removeChild:displayTotalAttempted];
	[self removeChild:displayTimer];
	
	[self addChild:displayScore];
	[self addChild:displayMiss];
	[self addChild:displayTotalAttempted];
	[self addChild:displayTimer];
	
	//
	//The options
	//makes the row of options
	self.rowOne=[[CTARow alloc] initWithSprites];
	self.rowTwo=[[CTARow alloc] initWithSprites];
	self.rowThree=[[CTARow alloc] initWithSprites];
	self.rowFour=[[CTARow alloc] initWithSprites];
	self.rowFive=[[CTARow alloc] initWithSprites];
	self.rowSix=[[CTARow alloc] initWithSprites];
	self.rowSeven=[[CTARow alloc] initWithSprites];
	self.rowEight=[[CTARow alloc] initWithSprites];
	//
	[self addChild:rowOne];
	[self addChild:rowTwo];
	[self addChild:rowThree];
	[self addChild:rowFour];
	[self addChild:rowFive];
	[self addChild:rowSix];
	[self addChild:rowSeven];
	[self addChild:rowEight];
	//
	int extremeLeft=-800;
	int extremeRight=800;
	rowOne.x=extremeLeft;//animate from left
	rowOne.y=70;
	rowTwo.x=extremeRight;//animate from right
	rowTwo.y=rowOne.y+50;
	rowThree.x=extremeLeft;
	rowThree.y=rowTwo.y+50;
	rowFour.x=extremeRight;
	rowFour.y=rowThree.y+50;
	rowFive.x=extremeLeft;
	rowFive.y=rowFour.y+50;
	rowSix.x=extremeRight;
	rowSix.y=rowFive.y+50;
	rowSeven.x=extremeLeft;
	rowSeven.y=rowSix.y+50;
	rowEight.x=extremeRight;
	rowEight.y=rowSeven.y+50;
	//
	self.mJuggler=[SPJuggler juggler];
	//Initialising the handlers
	[self addEventListener:@selector(onEachFrame:) 
				  atObject:self 
				   forType:SP_EVENT_TYPE_ENTER_FRAME];
	[self addEventListener:@selector(onUserTouch:) 
				  atObject:self 
				   forType:SP_EVENT_TYPE_TOUCH];
	[self addEventListener:@selector(onTransitionInComplete:) 
				  atObject:self 
				   forType:EVENT_TYPE_TRANSITION_IN_TWEEN_END];
	[self addEventListener:@selector(onTransitionOutComplete:) 
				  atObject:self 
				   forType:EVENT_TYPE_TRANSITION_OUT_TWEEN_END];
	[self addEventListener:@selector(onOptionRefresh:) 
				  atObject:self 
				   forType:EVENT_VALUE_REFRESHED];
	
	 //action time
	//display the options
	[self transitIn];
}

-(void)onEachFrame:(SPEnterFrameEvent *)event
{
	//NSLog(@"onEachFrame----");
	//check for the display Objects
	/*
	if (rowOne.x==10 && rowTwo.x==10 && rowThree.x==10 && rowFour.x==10 && rowFive.x==10 && rowSix.x==10 && rowSeven.x==10 && rowEight.x==10) {
		areOptionsOnScreen=TRUE;
		//NSLog(@"optioins on screen = %@",areOptionsOnScreen);
	} else if (rowOne.x==-800 && rowTwo.x==800 && rowThree.x==-800 && rowFour.x==800 && rowFive.x==-800 && rowSix.x==800 && rowSeven.x==-800 && rowEight.x==800) {
		areOptionsOnScreen=FALSE;
		//[self updateRows];
	}
	*/
	self.timerCounter++;
	self.displayTimer.text=[NSString stringWithString:[NSString stringWithFormat:@"Counter : %i",timerCounter]];
	self.displayScore.text=[NSString stringWithString:[NSString stringWithFormat:@"Scored : %i",userCorrectAnswerCount]];
	self.displayMiss.text=[NSString stringWithString:[NSString stringWithFormat:@"Missed : %i",userWrongAnswerCount]];
	self.displayTotalAttempted.text=[NSString stringWithString:[NSString stringWithFormat:@"Attempts : %i",(userCorrectAnswerCount+userWrongAnswerCount)]];

	//update Juggler
	double passedTime=event.passedTime;
	[self advanceTime:passedTime];
}

-(void)advanceTime:(double)seconds
{
	[self.mJuggler advanceTime:seconds];
}

-(void)updateRows
{
	//[rowOne updateSpriteData:2];
	/*
	[rowTwo updateSpriteData:3];
	[rowThree updateSpriteData:4];
	[rowFour updateSpriteData:5];
	[rowFive updateSpriteData:6];
	[rowSix updateSpriteData:7];
	[rowSeven updateSpriteData:8];
	[rowEight updateSpriteData:9];
	*/
}

-(void)onTweenCompleted:(SPEvent *)event
{
	NSLog(@"Tween Completed. %@",event.target);
	/*
	SPTween *t=event.target;
	[t removeEventListener:@selector(onTweenCompleted:) 
						   atObject:self 
							forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	*/
	/*
	[t addEventListener:@selector(onTweenCompleted:) 
						   atObject:self 
							forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	*/
}

- (void)onUserTouch:(SPTouchEvent*)event
{	
	NSArray *touches = [[event touchesWithTarget:self andPhase:SPTouchPhaseBegan] allObjects];
	if (areOptionsOnScreen) {
		
	
	if (touches.count==1) {
		NSLog(@"1 fingure touch : ----------- ");
		//
		if (correctAnswerNum==1) {
			NSLog(@"CORRECT RESPONSE : ");
			self.userCorrectAnswerCount++;
		}else {
			NSLog(@"xxxxxxxx WRONG xxxxxxxx");
			self.userWrongAnswerCount++;
		}

		//transition for the question change
		if (areOptionsOnScreen) {
			[self transitOut];
			self.areOptionsOnScreen=FALSE;
		}else {
			//[self transitIn];
		}
	}else if (touches.count==2) {
		NSLog(@"2 fingure touch : ----------- ");
		if (correctAnswerNum==2) {
			NSLog(@"CORRECT RESPONSE : ");
			self.userCorrectAnswerCount++;
		}else {
			NSLog(@"xxxxxxxx WRONG xxxxxxxx");
			self.userWrongAnswerCount++;
		}
	}else if (touches.count==3) {
		if (correctAnswerNum==3) {
			NSLog(@"CORRECT RESPONSE : ");
			self.userCorrectAnswerCount++;
		}else {
			NSLog(@"xxxxxxxx WRONG xxxxxxxx");
			self.userWrongAnswerCount++;
		}
	}else if (correctAnswerNum==4) {
		if (correctAnswerNum==4) {
			NSLog(@"CORRECT RESPONSE : ");
			self.userCorrectAnswerCount++;
		}else {
			NSLog(@"xxxxxxxx WRONG xxxxxxxx");
			self.userWrongAnswerCount++;
		}
	}else if (correctAnswerNum==5) {
		if (correctAnswerNum==5) {
			NSLog(@"CORRECT RESPONSE : ");
			self.userCorrectAnswerCount++;
		}else {
			NSLog(@"xxxxxxxx WRONG xxxxxxxx");
			self.userWrongAnswerCount++;
		}
	}
	}

}

-(void)transitIn
{
	NSLog(@"transitIn");
	/*
	//makes width and height 1, so as to animate in the beginning to the full value 
	background.width=1;
	background.height=1;
	SPTween *bgTween=[SPTween tweenWithTarget:background 
										 time:0.8 
								   transition:SP_TRANSITION_EASE_OUT_BACK];
	[bgTween animateProperty:@"width" targetValue:310];
	[bgTween animateProperty:@"height" targetValue:470];
	*/
	/*
	[rowOne updateSpriteData:2];
	[rowTwo updateSpriteData:5];
	*/
	SPTween *rowOneTween=[SPTween tweenWithTarget:rowOne 
											 time:1.4 
									   transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowTwoTween=[SPTween tweenWithTarget:rowTwo 
											 time:1.0 
									   transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowThreeTween=[SPTween tweenWithTarget:rowThree 
											   time:1.2 
										 transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowFourTween=[SPTween tweenWithTarget:rowFour 
											  time:1.1 
										transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowFiveTween=[SPTween tweenWithTarget:rowFive 
											  time:0.8 
										transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowSixTween=[SPTween tweenWithTarget:rowSix 
											 time:1.3 
									   transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowSevenTween=[SPTween tweenWithTarget:rowSeven 
											   time:1.1 
										 transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowEightTween=[SPTween tweenWithTarget:rowEight 
											   time:1.2 
										 transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	//
	[rowOneTween animateProperty:@"x" targetValue:10];
	[rowTwoTween animateProperty:@"x" targetValue:10];
	[rowThreeTween animateProperty:@"x" targetValue:10];
	[rowFourTween animateProperty:@"x" targetValue:10];
	[rowFiveTween animateProperty:@"x" targetValue:10];
	[rowSixTween animateProperty:@"x" targetValue:10];
	[rowSevenTween animateProperty:@"x" targetValue:10];
	[rowEightTween animateProperty:@"x" targetValue:10];
	//
	[rowOneTween addEventListener:@selector(onSingleTransitionInComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowTwoTween addEventListener:@selector(onSingleTransitionInComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowThreeTween addEventListener:@selector(onSingleTransitionInComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowFourTween addEventListener:@selector(onSingleTransitionInComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowFiveTween addEventListener:@selector(onSingleTransitionInComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowSixTween addEventListener:@selector(onSingleTransitionInComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowSevenTween addEventListener:@selector(onSingleTransitionInComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowEightTween addEventListener:@selector(onSingleTransitionInComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	
	//[mJuggler addObject:bgTween];
	[mJuggler addObject:rowOneTween];
	[mJuggler addObject:rowTwoTween];
	[mJuggler addObject:rowThreeTween];
	[mJuggler addObject:rowFourTween];
	[mJuggler addObject:rowFiveTween];
	[mJuggler addObject:rowSixTween];
	[mJuggler addObject:rowSevenTween];
	[mJuggler addObject:rowEightTween];
	//
}
-(void)transitOut
{
	NSLog(@"transitOut");
	SPTween *rowOneTween=[SPTween tweenWithTarget:rowOne 
											 time:1.4 
									   transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowTwoTween=[SPTween tweenWithTarget:rowTwo 
											 time:1.0 
									   transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowThreeTween=[SPTween tweenWithTarget:rowThree 
											   time:1.2 
										 transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowFourTween=[SPTween tweenWithTarget:rowFour 
											  time:1.1 
										transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowFiveTween=[SPTween tweenWithTarget:rowFive 
											  time:0.8 
										transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowSixTween=[SPTween tweenWithTarget:rowSix 
											 time:1.3 
									   transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowSevenTween=[SPTween tweenWithTarget:rowSeven 
											   time:1.1 
										 transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	SPTween *rowEightTween=[SPTween tweenWithTarget:rowEight 
											   time:1.2 
										 transition:SP_TRANSITION_EASE_IN_OUT_BACK];
	//
	[rowOneTween animateProperty:@"x" targetValue:-800];
	[rowTwoTween animateProperty:@"x" targetValue:800];
	[rowThreeTween animateProperty:@"x" targetValue:-800];
	[rowFourTween animateProperty:@"x" targetValue:800];
	[rowFiveTween animateProperty:@"x" targetValue:-800];
	[rowSixTween animateProperty:@"x" targetValue:800];
	[rowSevenTween animateProperty:@"x" targetValue:-800];
	[rowEightTween animateProperty:@"x" targetValue:800];
	//
	[rowOneTween addEventListener:@selector(onSingleTransitionOutComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowTwoTween addEventListener:@selector(onSingleTransitionOutComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowThreeTween addEventListener:@selector(onSingleTransitionOutComplete:) 
						   atObject:self 
							forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowFourTween addEventListener:@selector(onSingleTransitionOutComplete:) 
						  atObject:self 
						   forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowFiveTween addEventListener:@selector(onSingleTransitionOutComplete:) 
						  atObject:self 
						   forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowSixTween addEventListener:@selector(onSingleTransitionOutComplete:) 
						 atObject:self 
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowSevenTween addEventListener:@selector(onSingleTransitionOutComplete:) 
						   atObject:self 
							forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	[rowEightTween addEventListener:@selector(onSingleTransitionOutComplete:) 
						   atObject:self 
							forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	//
	//[mJuggler addObject:bgTween];
	[mJuggler addObject:rowOneTween];
	[mJuggler addObject:rowTwoTween];
	[mJuggler addObject:rowThreeTween];
	[mJuggler addObject:rowFourTween];
	[mJuggler addObject:rowFiveTween];
	[mJuggler addObject:rowSixTween];
	[mJuggler addObject:rowSevenTween];
	[mJuggler addObject:rowEightTween];
	//
}

-(void)onSingleTransitionInComplete:(SPEvent *)event
{
	self.transitionAnimationCounter++;
	//NSLog(@"total transition completed %i",self.transitionAnimationCounter);
	if (transitionAnimationCounter>=8) {
		transitionAnimationCounter=0;//reset
		//dispatch aniamtion complete event
		//SaumyaEvent *evt=[SaumyaEvent eventWithType:EVENT_TYPE_TRANSITION_IN_TWEEN_END];
		SaumyaEvent *evt=[[SaumyaEvent alloc]initWithType:EVENT_TYPE_TRANSITION_IN_TWEEN_END 
												  bubbles:FALSE];
		[self dispatchEvent:evt];
		[evt release];
	}
}

-(void)onSingleTransitionOutComplete:(SPEvent *)event
{
	self.transitionAnimationCounter++;
	//NSLog(@"total transition completed %i",self.transitionAnimationCounter);
	if (transitionAnimationCounter>=8) {
		transitionAnimationCounter=0;//reset
		//dispatch aniamtion complete event
		SaumyaEvent *evt=[[SaumyaEvent alloc]initWithType:EVENT_TYPE_TRANSITION_OUT_TWEEN_END 
												  bubbles:FALSE];
		[self dispatchEvent:evt];
		[evt release];
	}
}

-(void)onTransitionInComplete:(SPEvent *)event
{
	NSLog(@"onTransitionInComplete : all complete!");
	areOptionsOnScreen=TRUE;
	//reset timer
	self.timerCounter=0;
}
-(void)onTransitionOutComplete:(SPEvent *)event
{
	NSLog(@"onTransitionOutComplete : all complete!");
	areOptionsOnScreen=FALSE;
	//reset the options
	[rowOne updateSpriteData];
	[rowTwo updateSpriteData];
	[rowThree updateSpriteData];
	[rowFour updateSpriteData];
	[rowFive updateSpriteData];
	[rowSix updateSpriteData];
	[rowSeven updateSpriteData];
	[rowEight updateSpriteData];
	//reset the counters
	self.counter1=0;
	self.counter2=0;
	self.counter3=0;
	self.counter4=0;
	self.counter5=0;
	//
	[self transitIn];//This works!! I am suppose to move this into event system
}
-(void)onOptionRefresh:(SaumyaEvent *)event
{
	int newNum=event.newValue;
	NSLog(@"updated num : %i ",newNum);
	//sets a counter for each number
	switch (newNum) {
		case 1:
			self.counter1++;
			break;
		case 2:
			self.counter2++;
			break;
		case 3:
			self.counter3++;
			break;
		case 4:
			self.counter4++;
			break;
		case 5:
			self.counter5++;
			break;
		default:
			NSLog(@"Not implemented this case YET!! %i ", newNum);
			break;
	}
	NSLog(@"ALL : 1=%i,2=%i, 3=%i, 4=%i, 5=%i",self.counter1,self.counter2,self.counter3,self.counter4,self.counter5);
	//calculates the max number
	int max = fmax(self.counter1, self.counter2);
	max=fmax(max, self.counter3);
	max=fmax(max, self.counter4);
	max=fmax(max, self.counter5);
	NSLog(@"max value %i",max);
	//checks which is max to set the correct answer
	int correctNum=0;
	if (max==self.counter1) {
		correctNum=1;
	}else if (max==self.counter2) {
		correctNum=2;
	}else if (max==self.counter3) {
		correctNum=3;
	}else if (max==self.counter4) {
		correctNum=4;
	}else if (max==self.counter5) {
		correctNum=5;
	}
	NSLog(@"Correct Answer = %i",correctNum);
	self.correctAnswerNum=correctNum;
}

-(void) dealloc
{
	[mJuggler release];
	[background release];
	//[areOptionsOnScreen release];//seems not required!
	
	[rowOne release];
	[rowTwo release];
	[rowThree release];
	[rowFour release];
	[rowFive release];
	[rowSix release];
	[rowSeven release];
	[rowEight release];
	
	[displayScore release];
	[displayMiss release];
	[displayTotalAttempted release];
	[displayTimer release];
	
	[super dealloc];
}

@end

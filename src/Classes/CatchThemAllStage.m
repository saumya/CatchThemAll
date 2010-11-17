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
	//makes width and height 0so as to animate in the beginning to the full value 
	background.width=0;
	background.height=0;
	SPTween *bgTween=[SPTween tweenWithTarget:background 
										 time:0.8 
								   transition:SP_TRANSITION_EASE_OUT_BACK];
	[bgTween animateProperty:@"width" targetValue:310];
	[bgTween animateProperty:@"height" targetValue:470];
	//
	//The options
	//makes the row of options
	CTARow *rowOne=[[CTARow alloc] initWithSprites];
	CTARow *rowTwo=[[CTARow alloc] initWithSprites];
	CTARow *rowThree=[[CTARow alloc] initWithSprites];
	CTARow *rowFour=[[CTARow alloc] initWithSprites];
	CTARow *rowFive=[[CTARow alloc] initWithSprites];
	CTARow *rowSix=[[CTARow alloc] initWithSprites];
	CTARow *rowSeven=[[CTARow alloc] initWithSprites];
	CTARow *rowEight=[[CTARow alloc] initWithSprites];
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
	rowOne.y=40;
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
	[rowOne release];
	[rowTwo release];
	[rowThree release];
	[rowFour release];
	[rowFive release];
	[rowSix release];
	[rowSeven release];
	[rowEight release];
	//
	self.mJuggler=[SPJuggler juggler];
	
	[mJuggler addObject:bgTween];
	[mJuggler addObject:rowOneTween];
	[mJuggler addObject:rowTwoTween];
	[mJuggler addObject:rowThreeTween];
	[mJuggler addObject:rowFourTween];
	[mJuggler addObject:rowFiveTween];
	[mJuggler addObject:rowSixTween];
	[mJuggler addObject:rowSevenTween];
	[mJuggler addObject:rowEightTween];
	//
	[self addEventListener:@selector(onEachFrame:) 
				  atObject:self forType:SP_EVENT_TYPE_ENTER_FRAME];
}

-(void)onEachFrame:(SPEnterFrameEvent *)event
{
	double passedTime=event.passedTime;
	[self advanceTime:passedTime];
}

-(void)advanceTime:(double)seconds
{
	[self.mJuggler advanceTime:seconds];
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

-(void) dealloc
{
	[mJuggler release];
	[background release];
	[super dealloc];
}

@end

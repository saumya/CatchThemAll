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
	 //
	UIColor *fill=[UIColor colorWithRed:0.4 green:0.2 blue:0.4 alpha:1.0];
	UIColor *border=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
	 
	SPTexture *tt=makeRoundedCornerRect(50.0f, 50.0f, 10.0f,fill);
	SPTexture *t=makeRoundedRectWithBorder(50.0f, 50.0f, 10.0f, fill,border);
	
	SPImage *img1=[SPImage imageWithTexture:t];
	SPImage *img2=[SPImage imageWithTexture:t];
	SPImage *img3=[SPImage imageWithTexture:tt];
	SPImage *img4=[SPImage imageWithTexture:t];
	SPImage *img5=[SPImage imageWithTexture:t];
	
	[self addChild:img1];
	[self addChild:img2];
	[self addChild:img3];
	[self addChild:img4];
	[self addChild:img5];
	//position them
	img2.x=50;
	img3.x=100;
	img4.x=150;
	img5.x=200;
	
	//release the texture
	//[img release];
	[tt release];
	[t release];
	//[red release];
	
	//makes the sprites
	SPTexture *c=makeCircle(10.0f, fill);
	SPImage *img6=[SPImage imageWithTexture:c];
	[c release];
	[self addChild:img6];
	img6.x=150;
	img6.y=100;
	
	
	CTASprite *ctaSP=[[CTASprite alloc] initWithDefault];
	[self addChild:ctaSP];
	[ctaSP addImage:img6];
	//
	//[c release];
	//[img6 release];
	//ctaSP.x=0;
	//SPTween *tween=[SPTween tweenWithTarget:ctaSP time:10.0];
	//[tween animateProperty:@"width" targetValue:300.0];
	//[tween animateProperty:@"height" targetValue:300.0];
	//[tween animateProperty:@"x" targetValue:300.0];
	/*
	[tween advanceTime:1.0];
	[tween advanceTime:1.0];
	[tween advanceTime:1.0];
	*/
	
	//SPJuggler *mJuggler=[SPJuggler juggler];
	//[mJuggler addObject:tween];
	
	//[self.stage.juggler addObject:tween];
	//NSLog(@"stage juggler is %@",self.stage.juggler);
	self.mJuggler=[SPJuggler juggler];
	
	SPTween *tweenAnimated = [SPTween tweenWithTarget:ctaSP
												 time:4.0f
										   transition:SP_TRANSITION_LINEAR];
	[tweenAnimated setDelay:0.0f];
	[tweenAnimated animateProperty:@"y" targetValue:200];
	[tweenAnimated animateProperty:@"x" targetValue:100];
	[tweenAnimated animateProperty:@"width" targetValue:200];
	[tweenAnimated animateProperty:@"height" targetValue:200];
	
	[tweenAnimated addEventListener:@selector(onTweenCompleted:) 
				   atObject:self 
					forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
	//
	[mJuggler addObject:tweenAnimated];
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
	[super dealloc];
}

@end

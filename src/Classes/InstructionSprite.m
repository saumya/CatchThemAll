//
//  IntructionSprite.m
//  CatchThemAll
//
//  Created by saumya ray on 11/19/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "InstructionSprite.h"


@implementation InstructionSprite

@synthesize infoBox;

@synthesize one;
@synthesize two;
@synthesize three;
@synthesize four;
@synthesize five;

@synthesize infoColor;
@synthesize touchCounter;

-(id)initWithInstruction
{
	if (self=[super init]) {
		//custom code
		[self renderDefault];
	}
	return self;
}

-(void)renderDefault
{
	//bakes the textures
	UIColor *cOne=[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
	UIColor *cTwo=[UIColor colorWithRed:0.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0];
	UIColor *cThree=[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:255.0/255.0 alpha:1.0];
	UIColor *cFour=[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:255.0/255.0 alpha:1.0];
	UIColor *cFive=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0];

	SPTexture *tOne=makeRoundedCornerRect(50.0f, 50.0f, 10.0f, cOne);
	SPTexture *tTwo=makeRoundedCornerRect(50.0f, 50.0f, 10.0f, cTwo);
	SPTexture *tThree=makeRoundedCornerRect(50.0f, 50.0f, 10.0f, cThree);
	SPTexture *tFour=makeRoundedCornerRect(50.0f, 50.0f, 10.0f, cFour);
	SPTexture *tFive=makeRoundedCornerRect(50.0f, 50.0f, 10.0f, cFive);

	self.one=[SPImage imageWithTexture:tOne];
	self.two=[SPImage imageWithTexture:tTwo];
	self.three=[SPImage imageWithTexture:tThree];
	self.four=[SPImage imageWithTexture:tFour];
	self.five=[SPImage imageWithTexture:tFive];

	//Makes the background
	UIColor *bgFill=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.9];
	UIColor *bgBorder=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5];
	SPTexture *bgTexture=makeRoundedRectWithBorder(300.0f, 300.0f, 40.0f, bgFill, bgBorder);
	SPImage *bg=[SPImage imageWithTexture:bgTexture];

	SPTextField *infoTitle=[SPTextField textFieldWithWidth:300
													height:50
													  text:[NSString stringWithString:[NSString stringWithFormat:@"Instruction"]]
												  fontName:@"Zapfino"
												  fontSize:20
													 color:0x000000];
	SPTextField *info=[SPTextField textFieldWithWidth:280
											   height:200
												 text:[NSString stringWithString:[NSString stringWithFormat:@""]]
											 fontName:@"Zapfino"
											 fontSize:12
												color:0x000000];

	//position things
	bg.x=10;
	bg.y=90;

	infoTitle.y=100;
	info.x=15;
	info.y=120;
	//fillup information
	//info.text=[NSString stringWithFormat:@"Each colour has a value. Colors from left to right hold values in the increasing order from 1 to 5. The left most is 1(Red color). Each color can be grabbed with the same number of fingure/s. If its value is 1, you have to tap a sinlge fingure to grab it. Quest is to get the color which is displayed maximum time per question. Each question will change when timer counter hits 1000, making you loose 1 point. Catch Them All."];
	info.text=[NSString stringWithFormat:@"Catch the most visible color with touch. Each color is associated with a different kind of touch. Touch here now for more information."];
	[self addChild:bg];
	[self addChild:infoTitle];
	[self addChild:info];
	//makes the infobox
	infoBox=[SPSprite sprite];
	[self addChild:infoBox];

	UIColor *infoBgFill=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:0.3];
	UIColor *infoBgBorder=[UIColor colorWithRed:155.0/255.0 green:183.0/255.0 blue:0.0/255.0 alpha:0.2];
	SPTexture *infoBgTexture=makeRoundedRectWithBorder(280.0f, 70.0f, 10.0f, infoBgFill,infoBgBorder);
	SPImage *infoBg=[SPImage imageWithTexture:infoBgTexture];
	[infoBox addChild:infoBg];
	infoBox.x=1000;
	infoBox.y=300;
	/*
	infoBox.x=20;
	infoBox.y=300;
	*/

	infoColor=[SPTextField textFieldWithWidth:200
									   height:40
										 text:[NSString stringWithString:[NSString stringWithFormat:@"Color Information"]]
									 fontName:@"MarkerFelt-Thin"
									 fontSize:15
										color:0x000000];
	[infoBox addChild:infoColor];
	infoColor.x=60;
	infoColor.y=10;

	[info addEventListener:@selector(onUserTouchInfo:)
							 atObject:self
							  forType:SP_EVENT_TYPE_TOUCH];


	//
	SPTexture *skipBgTexture=makeRoundedRectWithBorder(100.0f, 50.0f, 10.0f, bgFill,infoBgBorder);
	SPImage *skipBg=[SPImage imageWithTexture:skipBgTexture];
	SPTextField *skipText=[SPTextField textFieldWithWidth:200
									   height:40
										 text:[NSString stringWithString:[NSString stringWithFormat:@"Start"]]
									 fontName:@"MarkerFelt-Thin"
									 fontSize:15
										color:0x000000];
	[self addChild:skipBg];
	[self addChild:skipText];

	skipBg.x=100;
	skipBg.y=400;
	skipText.x=50;
	skipText.y=405;
	[skipText addEventListener:@selector(onUserTouchSkipInfo:)
				  atObject:self
				   forType:SP_EVENT_TYPE_TOUCH];
	//
}

- (void)onUserTouchInfo:(SPTouchEvent*)event
{
	SPTouch *touch = [[event touchesWithTarget:self andPhase:SPTouchPhaseBegan] anyObject];
	if (touch) {
		NSLog(@"READY ! Start instruction !");
		if (infoBox.x==20) {
			[self slideOut];
		}else if (infoBox.x==1000) {
			[self slideIn];
		}

	}
}

- (void)onUserTouchSkipInfo:(SPTouchEvent*)event
{
	SPTouch *touch = [[event touchesWithTarget:self andPhase:SPTouchPhaseBegan] anyObject];
	if (touch) {
		NSLog(@"READY ! Start Game !");
		SaumyaEvent *evt=[[SaumyaEvent alloc]initWithType:EVENT_SKIP_INFO bubbles:TRUE];
		[self dispatchEvent:evt];
		[evt release];
	}
}

-(void)slideIn
{
	touchCounter++;
	if (touchCounter==1) {
		[infoBox removeChild:five];
		one.x=10;
		one.y=10;
		[infoBox addChild:one];
		infoColor.text=[NSString stringWithFormat:@"One fingure touch to catch everything of this color."];
	}else if (touchCounter==2) {
		[infoBox removeChild:one];
		two.x=10;
		two.y=10;
		[infoBox addChild:two];
		infoColor.text=[NSString stringWithFormat:@"Two fingures touch to catch everything of this color."];
	}else if (touchCounter==3) {
		[infoBox removeChild:two];
		three.x=10;
		three.y=10;
		[infoBox addChild:three];
		infoColor.text=[NSString stringWithFormat:@"Three fingures touch to catch everything of this color."];
	}else if (touchCounter==4) {
		[infoBox removeChild:three];
		four.x=10;
		four.y=10;
		[infoBox addChild:four];
		infoColor.text=[NSString stringWithFormat:@"Four fingures touch to catch everything of this color."];
	}else if (touchCounter==5) {
		touchCounter=0;//resetting it
		[infoBox removeChild:four];
		five.x=10;
		five.y=10;
		[infoBox addChild:five];
		infoColor.text=[NSString stringWithFormat:@"Five fingures touch to catch everything of this color."];
	}

	infoBox.x=-1000;
	SPTween *bgTween=[SPTween tweenWithTarget:infoBox
										 time:0.8
								   transition:SP_TRANSITION_EASE_OUT];
	[bgTween animateProperty:@"x" targetValue:20];
	[self.stage.juggler addObject:bgTween];
}

-(void)slideOut
{
	SPTween *bgTween=[SPTween tweenWithTarget:infoBox
										 time:0.8
								   transition:SP_TRANSITION_EASE_IN];
	[bgTween animateProperty:@"x" targetValue:1000];
	[self.stage.juggler addObject:bgTween];
	//
	[bgTween addEventListener:@selector(onSlideOutComplete:)
						 atObject:self
						  forType:SP_EVENT_TYPE_TWEEN_COMPLETED];
}

-(void)onSlideOutComplete:(SPEvent *)event
{
	[self slideIn];
}


-(void)dealloc
{
	[infoBox release];

	[one release];
	[two release];
	[three release];
	[four release];
	[five release];

	[infoColor release];

	[super dealloc];
}

@end

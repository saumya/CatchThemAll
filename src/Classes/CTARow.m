//
//  CTARow.m
//  CatchThemAll
//
//  Created by saumya ray on 11/17/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "CTARow.h"


@implementation CTARow

@synthesize ctaOne;
@synthesize ctaTwo;
@synthesize ctaThree;
@synthesize ctaFour;
@synthesize ctaFive;
@synthesize  ctaSix;

-(id) initWithSprites
{
	if (self=[super init]) {
		//custom code here
		[self makeDefaultSprites];
	}
	return self;
}

-(void)makeDefaultSprites
{
	self.ctaOne=[[CTASprite alloc] initWithDefault];
	[self.ctaOne renderDefault:1];
	self.ctaTwo=[[CTASprite alloc] initWithDefault];
	[self.ctaTwo renderDefault:2];
	self.ctaThree=[[CTASprite alloc] initWithDefault];
	[self.ctaThree renderDefault:3];
	self.ctaFour=[[CTASprite alloc] initWithDefault];
	[self.ctaFour renderDefault:4];
	self.ctaFive=[[CTASprite alloc] initWithDefault];
	[self.ctaFive renderDefault:5];
	self.ctaSix=[[CTASprite alloc] initWithDefault];
	[self.ctaSix renderDefault:1];
	//25 being the width/2
	ctaOne.x=0+25;
	ctaTwo.x=50+25;
	ctaThree.x=100+25;
	ctaFour.x=150+25;
	ctaFive.x=200+25;
	ctaSix.x=250+25;
	//
	[self addChild:ctaOne];
	[self addChild:ctaTwo];
	[self addChild:ctaThree];
	[self addChild:ctaFour];
	[self addChild:ctaFive];
	[self addChild:ctaSix];
}

-(void)updateSpriteData
{
	//NSLog(@"updateSpriteData : random num is %i",rand());
	//
	[self.ctaOne updateValue];
	[self.ctaTwo updateValue];
	[self.ctaThree updateValue];
	[self.ctaFour updateValue];
	[self.ctaFive updateValue];
	[self.ctaSix updateValue];
	 
}

-(void)dealloc
{
	[self.ctaOne release];
	[self.ctaTwo release];
	[self.ctaThree release];
	[self.ctaFour release];
	[self.ctaFive release];
	[self.ctaSix release];
	
	[super dealloc];
}

@end

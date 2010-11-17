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
	UIColor *fill=[UIColor colorWithRed:0.4 green:0.2 blue:0.4 alpha:1.0];
	UIColor *border=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
	
	SPTexture *tt=makeRoundedCornerRect(50.0f, 50.0f, 10.0f,fill);
	SPTexture *t=makeRoundedRectWithBorder(50.0f, 50.0f, 10.0f, fill,border);
	//
	SPImage *img1=[SPImage imageWithTexture:t];
	SPImage *img2=[SPImage imageWithTexture:t];
	SPImage *img3=[SPImage imageWithTexture:tt];
	SPImage *img4=[SPImage imageWithTexture:t];
	SPImage *img5=[SPImage imageWithTexture:t];
	SPImage *img6=[SPImage imageWithTexture:tt];
	[tt release];
	[t release];
	//
	self.ctaOne=[[CTASprite alloc] initWithDefault];
	//[self.ctaOne addImage:img1];
	[self.ctaOne updateValue:1];
	self.ctaTwo=[[CTASprite alloc] initWithDefault];
	//[self.ctaTwo addImage:img2];
	[self.ctaTwo updateValue:2];
	self.ctaThree=[[CTASprite alloc] initWithDefault];
	//[self.ctaThree addImage:img3];
	[self.ctaThree updateValue:3];
	self.ctaFour=[[CTASprite alloc] initWithDefault];
	//[self.ctaFour addImage:img4];
	[self.ctaFour updateValue:4];
	self.ctaFive=[[CTASprite alloc] initWithDefault];
	//[self.ctaFive addImage:img5];
	[self.ctaFive updateValue:5];
	self.ctaSix=[[CTASprite alloc] initWithDefault];
	//[self.ctaSix addImage:img6];
	[self.ctaSix updateValue:6];
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

-(void)updateSpriteData:(int)value
{
	//TODO : 
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

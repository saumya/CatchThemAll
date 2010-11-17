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
	
	SPImage *img1=[SPImage imageWithTexture:t];
	SPImage *img2=[SPImage imageWithTexture:t];
	SPImage *img3=[SPImage imageWithTexture:tt];
	SPImage *img4=[SPImage imageWithTexture:t];
	SPImage *img5=[SPImage imageWithTexture:t];
	SPImage *img6=[SPImage imageWithTexture:tt];
	[tt release];
	[t release];
	
	self.ctaOne=[[CTASprite alloc] initWithDefault];
	[self.ctaOne addImage:img1];
	self.ctaTwo=[[CTASprite alloc] initWithDefault];
	[self.ctaTwo addImage:img2];
	self.ctaThree=[[CTASprite alloc] initWithDefault];
	[self.ctaThree addImage:img3];
	self.ctaFour=[[CTASprite alloc] initWithDefault];
	[self.ctaFour addImage:img4];
	self.ctaFive=[[CTASprite alloc] initWithDefault];
	[self.ctaFive addImage:img5];
	self.ctaSix=[[CTASprite alloc] initWithDefault];
	[self.ctaSix addImage:img6];
	/*
	[img1 release];
	[img2 release];
	[img3 release];
	[img4 release];
	[img5 release];
	[img6 release];
	*/
	//25 being the width/2
	ctaOne.x=0+25;
	ctaTwo.x=50+25;
	ctaThree.x=100+25;
	ctaFour.x=150+25;
	ctaFive.x=200+25;
	ctaSix.x=250+25;
	
	[self addChild:ctaOne];
	[self addChild:ctaTwo];
	[self addChild:ctaThree];
	[self addChild:ctaFour];
	[self addChild:ctaFive];
	[self addChild:ctaSix];
	
	/*
	[self addChild:img1];
	[self addChild:img2];
	[self addChild:img3];
	[self addChild:img4];
	[self addChild:img5];
	[self addChild:img6];
	//position them
	img2.x=50;
	img3.x=100;
	img4.x=150;
	img5.x=200;
	img6.x=250;
	*/
	//release the texture
	//[img release];
	
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
	
	[super dealloc];
}

@end

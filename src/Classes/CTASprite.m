//
//  CTASprite.m
//  CatchThemAll
//
//  Created by saumya ray on 11/17/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "CTASprite.h"


@implementation CTASprite

@synthesize img;
@synthesize textureOne;
@synthesize textureTwo;
@synthesize textureThree;
@synthesize textureFour;
@synthesize textureFive;
@synthesize textureBorder;

-(id)initWithDefault
{
	if (self=[super init]) {
		//customisation
		//NSLog(@"%@ is ready",self);
		[self bakeTheTextures];
	}
	return self;
}

-(void)bakeTheTextures
{
	UIColor *colorOne=[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
	UIColor *colorTwo=[UIColor colorWithRed:0.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0];
	UIColor *colorThree=[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:255.0/255.0 alpha:1.0];
	UIColor *colorFour=[UIColor colorWithRed:200.0/255.0 green:0.0/255.0 blue:170.0/255.0 alpha:1.0];
	UIColor *colorFive=[UIColor colorWithRed:255.0/255.0 green:247.0/255.0 blue:127.0/255.0 alpha:1.0];
	UIColor *colorBorder=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
	
	textureOne=makeRoundedRectWithBorder(50.0f, 50.0f, 10.0f, colorOne, colorBorder);
	textureTwo=makeRoundedRectWithBorder(50.0f, 50.0f, 10.0f, colorTwo, colorBorder);
	textureThree=makeRoundedRectWithBorder(50.0f, 50.0f, 10.0f, colorThree, colorBorder);
	textureFour=makeRoundedRectWithBorder(50.0f, 50.0f, 10.0f, colorFour, colorBorder);
	textureFive=makeRoundedRectWithBorder(50.0f, 50.0f, 10.0f, colorFive, colorBorder);
}

-(void)addImage:(SPImage *)image
{
	self.img=image;
	self.img.x=0-self.img.width/2;
	self.img.y=0-self.img.height/2;
	[self addChild:img];
	//now move this object to the original position
	self.x=self.img.width/2;
	self.y=self.img.height/2;
}

-(void)updateValue:(int)value
{
	if (value==1) {
		SPImage *textureImage=[SPImage imageWithTexture:self.textureOne];
		[self addImage:textureImage];
	}else if (value==2) {
		SPImage *textureImage=[SPImage imageWithTexture:self.textureTwo];
		[self addImage:textureImage];
	}else if (value==3) {
		SPImage *textureImage=[SPImage imageWithTexture:self.textureThree];
		[self addImage:textureImage];
	}else if (value==4) {
		SPImage *textureImage=[SPImage imageWithTexture:self.textureFour];
		[self addImage:textureImage];
	}else if (value==5) {
		SPImage *textureImage=[SPImage imageWithTexture:self.textureFive];
		[self addImage:textureImage];
	}else {
		SPImage *textureImage=[SPImage imageWithTexture:self.textureTwo];
		[self addImage:textureImage];
	}

}

-(void)dealloc
{
	[img release];
	[textureOne release];
	[textureTwo release];
	[textureThree release];
	[textureFour release];
	[textureFive release];
	[textureBorder release];
	[super dealloc];
}

@end

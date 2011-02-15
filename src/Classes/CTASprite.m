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
	UIColor *colorFour=[UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:255.0/255.0 alpha:1.0];
	UIColor *colorFive=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:0.0/255.0 alpha:1.0];
	
	UIColor *colorBorder=[UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
	
	textureOne=makeRoundedRectWithBorder(48.0f, 48.0f, 15.0f, colorOne, colorBorder);
	textureTwo=makeRoundedRectWithBorder(48.0f, 48.0f, 15.0f, colorTwo, colorBorder);
	textureThree=makeRoundedRectWithBorder(48.0f, 48.0f, 15.0f, colorThree, colorBorder);
	textureFour=makeRoundedRectWithBorder(48.0f, 48.0f, 15.0f, colorFour, colorBorder);
	textureFive=makeRoundedRectWithBorder(48.0f, 48.0f, 15.0f, colorFive, colorBorder);
}

-(void)renderDefault:(int)value
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

-(void)addImage:(SPImage *)image
{
	//NSLog(@"addImage : ---");
	[self removeChild:self.img];
	
	self.img=image;
	self.img.x=0-self.img.width/2;
	self.img.y=0-self.img.height/2;
	[self addChild:self.img];
	//now move this object to the original position
	//self.x=self.img.width/2;
	//self.y=self.img.height/2;
}

-(void)updateValue
{
	//NSLog(@"rand() : %i",rand());
	//NSLog(@"random() : %i",random());
	//NSLog(@"arc4random() : %i",1+arc4random()%5);
	int value=0;
	value=1+arc4random()%5;
	/*
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
	*/
	if (value==1) {
		self.img.texture=self.textureOne;
	}else if (value==2) {
		self.img.texture=self.textureTwo;
	}else if (value==3) {
		self.img.texture=self.textureThree;
	}else if (value==4) {
		self.img.texture=self.textureFour;
	}else if (value==5) {
		self.img.texture=self.textureFive;
	}else {
		self.img.texture=self.textureTwo;
	}
	
	SaumyaEvent *evt=[[SaumyaEvent alloc] initWithType:EVENT_VALUE_REFRESHED 
											   bubbles:TRUE];
	evt.newValue=value;
	[self dispatchEvent:evt];
	[evt release];
	
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

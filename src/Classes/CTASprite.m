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

-(id)initWithDefault
{
	if (self=[super init]) {
		//customisation
		//[self renderGame];
		NSLog(@"%@ is ready",self);
	}
	return self;
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

-(void)dealloc
{
	[img release];
	[super dealloc];
}

@end

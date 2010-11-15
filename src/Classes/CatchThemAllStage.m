//
//  CatchThemAllStage.m
//  CatchThemAll
//
//  Created by saumya ray on 11/14/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "CatchThemAllStage.h"


@implementation CatchThemAllStage

- (id)initWithWidth:(float)width height:(float)height
{
	if (self=[super init]) 
	{
		//Custom code
		NSLog(@"Game Stage : %@",self);
		NSLog(@"Game Stage : width %f",width);
		NSLog(@"Game Stage : height %f",height);
		//let the game begin :)
		[self renderDefaultScreen];
	}
	return self;
}

-(void)renderDefaultScreen
{
	/*
	 SPQuad *quad = [SPQuad quadWithWidth:100 height:100];
	 quad.color = 0xff0000;
	 quad.x = 50;
	 quad.y = 50;
	 [self addChild:quad];
	 */
	 //
	 UIColor *fill=[UIColor colorWithRed:0.4 green:0.2 blue:0.4 alpha:1.0];
	 UIColor *border=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
	 SPTexture *tt=makeRoundedCornerRect(50.0f, 50.0f, 10.0f,fill);
	 SPTexture *t=makeRoundedRectWithBorder(50.0f, 
	 50.0f, 
	 10.0f, 
	 fill,
	 border);
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
}

@end

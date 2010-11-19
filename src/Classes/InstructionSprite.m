//
//  IntructionSprite.m
//  CatchThemAll
//
//  Created by saumya ray on 11/19/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "InstructionSprite.h"


@implementation InstructionSprite

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
	UIColor *bgFill=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.9];
	UIColor *bgBorder=[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:0.5];
	SPTexture *bgTexture=makeRoundedRectWithBorder(300.0f, 300.0f, 40.0f, bgFill, bgBorder);
	SPImage *bg=[SPImage imageWithTexture:bgTexture];
	
	SPTextField *infoTitle=[SPTextField textFieldWithWidth:300 
													height:50 
													  text:[NSString stringWithString:[NSString stringWithFormat:@"Intruction"]] 
												  fontName:@"Zapfino" 
												  fontSize:20 
													 color:0x000000];
	SPTextField *info=[SPTextField textFieldWithWidth:300 
											   height:300 
												 text:[NSString stringWithString:[NSString stringWithFormat:@"Intruction"]] 
											 fontName:@"Courier" 
											 fontSize:15 
												color:0x000000];
	
	//position things
	bg.x=10;
	bg.y=90;
	
	infoTitle.y=90;
	info.x=10;
	info.y=100;
	//fillup information 
	info.text=[NSString stringWithFormat:@"Each colour has a value. Colors from left to right hold values in the increasing order from 1 to 5. The left most is 1(Red color). Each color can be grabbed with the same number of fingure/s. If its value is 1, you have to tap a sinlge fingure to grab it. Quest is to get the color which is displayed maximum time per question. Each question will change when timer counter hits 1000, making you loose 1 point. Catch Them All."];	
	[self addChild:bg];
	[self addChild:infoTitle];
	[self addChild:info];
}

@end

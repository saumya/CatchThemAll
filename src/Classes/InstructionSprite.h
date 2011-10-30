//
//  IntructionSprite.h
//  CatchThemAll
//
//  Created by saumya ray on 11/19/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sparrow.h"

#import "TextureUtil.h"
#import "SaumyaEvent.h"

@interface InstructionSprite : SPSprite
{
	SPSprite *infoBox;

	SPImage *one;
	SPImage *two;
	SPImage *three;
	SPImage *four;
	SPImage *five;

	SPTextField *infoColor;
	int touchCounter;
}

@property (nonatomic,retain) SPSprite *infoBox;

@property (nonatomic, retain) SPImage *one;
@property (nonatomic, retain) SPImage *two;
@property (nonatomic, retain) SPImage *three;
@property (nonatomic, retain) SPImage *four;
@property (nonatomic, retain) SPImage *five;

@property (nonatomic, retain) SPTextField *infoColor;
@property (assign) int touchCounter;

-(id)initWithInstruction;
-(void)renderDefault;
-(void)slideIn;
-(void)slideOut;

@end

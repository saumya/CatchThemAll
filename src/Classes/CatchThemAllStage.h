//
//  CatchThemAllStage.h
//  CatchThemAll
//
//  Created by saumya ray on 11/14/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sparrow.h"

#import "TextureUtil.h"
#import "CTASprite.h"
#import "CTARow.h"


@interface CatchThemAllStage : SPSprite 
{
	SPJuggler *mJuggler;
	CTASprite *background;
}

@property (nonatomic, retain) SPJuggler *mJuggler;
@property (nonatomic, retain) CTASprite *background;

- (id)initWithWidth:(float)width height:(float)height;

-(void)renderDefaultScreen;

-(void)advanceTime:(double)seconds;

@end

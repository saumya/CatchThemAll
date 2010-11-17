//
//  CTASprite.h
//  CatchThemAll
//
//  Created by saumya ray on 11/17/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sparrow.h"
#import "TextureUtil.h"

@interface CTASprite : SPSprite {
	SPImage *img;
	SPTexture *textureOne;
	SPTexture *textureTwo;
	SPTexture *textureThree;
	SPTexture *textureFour;
	SPTexture *textureFive;
	SPTexture *textureBorder;
}
@property (assign) SPImage *img;
@property (retain) SPTexture *textureOne;
@property (retain) SPTexture *textureTwo;
@property (retain) SPTexture *textureThree;
@property (retain) SPTexture *textureFour;
@property (retain) SPTexture *textureFive;
@property (retain) SPTexture *textureBorder;

-(id)initWithDefault;
-(void)bakeTheTextures;
-(void)addImage:(SPImage *)image;
-(void)updateValue:(int)value;

@end

//
//  CTASprite.h
//  CatchThemAll
//
//  Created by saumya ray on 11/17/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sparrow.h"

@interface CTASprite : SPSprite {
	SPImage *img;
}
@property (assign) SPImage *img;

-(id)initWithDefault;
-(void)addImage:(SPImage *)image;

@end

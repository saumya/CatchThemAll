//
//  TextureUtil.h
//  CatchThemAll
//
//  Created by saumya ray on 11/14/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sparrow.h"


SPTexture * makeRoundedCornerRect(float width,float height, float radius, UIColor *color);
SPTexture * makeRoundedRectWithBorder(float width,float height, float radius, UIColor *color, UIColor *borderColor);
SPTexture * makeCircle(float radius, UIColor *color);

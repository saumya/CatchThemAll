//
//  SaumyaEvent.h
//  CatchThemAll
//
//  Created by saumya ray on 11/18/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sparrow.h"

#define EVENT_SKIP_INFO @"skipInfoEvent"

#define EVENT_TYPE_TRANSITION_IN_TWEEN_END @"transitionInTweenEnd"
#define EVENT_TYPE_TRANSITION_OUT_TWEEN_END @"transitionOutTweenEnd"

#define EVENT_VALUE_REFRESHED @"spriteValueRefreshed"

@interface SaumyaEvent : SPEvent
{
	int newValue;
}

@property (assign) int newValue;

-(id)initWithType:(NSString *)type bubbles:(BOOL)bubbles;

@end

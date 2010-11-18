//
//  SaumyaEvent.m
//  CatchThemAll
//
//  Created by saumya ray on 11/18/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "SaumyaEvent.h"


@implementation SaumyaEvent

@synthesize newValue;

-(id)initWithType:(NSString *)type bubbles:(BOOL)bubbles
{
	if (self=[super initWithType:type bubbles:bubbles]) {
		//custom code
	}
	return self;
}

@end

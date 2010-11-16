//
//  Game.m
//  CatchThemAll
//
//  Created by Daniel Sperl on 14.01.10. Modified by Saumya on 14.11.2010
//  
//

#import "Game.h" 

@implementation Game

- (id)initWithWidth:(float)width height:(float)height
{
    if (self = [super initWithWidth:width height:height])
    {
		[self renderBaseStageWidth:width AndHeight:height];
    }
    return self;
}
- (void)renderBaseStageWidth:(float)width AndHeight:(float)height
{
	CatchThemAllStage *stage=[[CatchThemAllStage alloc] initWithWidth:width height:height];
	[self addChild:stage];
	[stage release];
}
@end

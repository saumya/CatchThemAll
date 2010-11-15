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
        // this is where the code of your game will start. 
        // in this sample, we add just a simple quad to see if it works.
        /*
        SPQuad *quad = [SPQuad quadWithWidth:100 height:100];
        quad.color = 0xff0000;
        quad.x = 50;
        quad.y = 50;
        [self addChild:quad];
		*/
		[self renderBaseStageWidth:width AndHeight:height];
		
    }
    return self;
}
- (void)renderBaseStageWidth:(float)width AndHeight:(float)height
{
	CatchThemAllStage *stage=[[CatchThemAllStage alloc] initWithWidth:width height:height];
	[self addChild:stage];
	//stage.rotation=01.0;
	//stage.x=200;
	[stage release];
}
@end

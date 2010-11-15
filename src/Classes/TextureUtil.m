//
//  TextureUtil.m
//  CatchThemAll
//
//  Created by saumya ray on 11/14/10.
//  Copyright 2010 Personal. All rights reserved.
//

#import "TextureUtil.h"

SPTexture * makeRoundedCornerRect(float width,float height, float radius, UIColor *color)
{
	SPTexture *t=[[SPTexture alloc] initWithWidth:width 
										   height:height 
											 draw:^(CGContextRef context)
				  {
					  CGFloat borderThickness=0.0f;
					  CGRect rect=CGRectMake(borderThickness, borderThickness, width, height);
					  //CGFloat radius=10.0f;
					  
					  CGMutablePathRef path= CGPathCreateMutable();
					  
					  CGPathMoveToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
					  CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect), 
										  CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
					  CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect), 
										  CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
					  CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect), 
										  CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
					  CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect), 
										  CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
					  CGPathCloseSubpath(path);
					  
					  CGContextAddPath(context, path);
					  /*
					   CGContextSetLineWidth(context, borderThickness);
					   CGContextStrokePath(context);
					  */
					  /*
					  CGContextSetFillColorWithColor(context, [[UIColor whiteColor] CGColor]);
					  CGContextFillPath(context);
					  */
					  /*
					  CGColorRef lightGreyColor=[UIColor colorWithRed:255.0/255.0 
																green:0.0/255.0 
																 blue:0.0/255.0 
																alpha:1.0].CGColor;
					  CGContextSetFillColorWithColor(context, lightGreyColor);
					  */
					  CGColorRef col=color.CGColor;
					  CGContextSetFillColorWithColor(context, col);
					  CGContextFillPath(context);
				  }];
	return t;
}

SPTexture * makeRoundedRectWithBorder(float width,float height, float radius, UIColor *color, UIColor *borderColor)
{
	SPTexture *t=[[SPTexture alloc] initWithWidth:width 
										   height:height 
											 draw:^(CGContextRef context)
				  {
					  //makes the background/border
					  CGFloat borderThickness=0.0f;
					  CGRect rect=CGRectMake(borderThickness, borderThickness, width, height);
					  //CGFloat radius=10.0f;
					  
					  CGMutablePathRef path= CGPathCreateMutable();
					  
					  CGPathMoveToPoint(path, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
					  CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect), 
										  CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
					  CGPathAddArcToPoint(path, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect), 
										  CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
					  CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect), 
										  CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
					  CGPathAddArcToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect), 
										  CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
					  CGPathCloseSubpath(path);
					  
					  CGContextAddPath(context, path);
					  //fill color
					  CGColorRef col=borderColor.CGColor;
					  CGContextSetFillColorWithColor(context, col);
					  CGContextFillPath(context);
					  
					  //makes the forground
					  //CGFloat borderThickness_f=0.0f;
					  CGRect rect_f=CGRectMake(borderThickness+2, borderThickness+2, width-4, height-4);
					  //CGFloat radius=10.0f;
					  
					  CGMutablePathRef path_f= CGPathCreateMutable();
					  
					  CGPathMoveToPoint(path_f, NULL, CGRectGetMidX(rect_f), CGRectGetMinY(rect_f));
					  CGPathAddArcToPoint(path_f, NULL, CGRectGetMaxX(rect_f), CGRectGetMinY(rect_f), 
										  CGRectGetMaxX(rect_f), CGRectGetMaxY(rect_f), radius);
					  CGPathAddArcToPoint(path_f, NULL, CGRectGetMaxX(rect_f), CGRectGetMaxY(rect_f), 
										  CGRectGetMinX(rect_f), CGRectGetMaxY(rect_f), radius);
					  CGPathAddArcToPoint(path_f, NULL, CGRectGetMinX(rect_f), CGRectGetMaxY(rect_f), 
										  CGRectGetMinX(rect_f), CGRectGetMinY(rect_f), radius);
					  CGPathAddArcToPoint(path_f, NULL, CGRectGetMinX(rect_f), CGRectGetMinY(rect_f), 
										  CGRectGetMaxX(rect_f), CGRectGetMinY(rect_f), radius);
					  CGPathCloseSubpath(path_f);
					  
					  CGContextAddPath(context, path_f);
					  //fill color
					  CGColorRef coll=color.CGColor;
					  CGContextSetFillColorWithColor(context, coll);
					  CGContextFillPath(context);
				  }];
	return t;
}


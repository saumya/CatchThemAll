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
					  CGRect rect_f=CGRectMake(borderThickness+4, borderThickness+4, width-8, height-8);
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

SPTexture * makeCircle(float radius, UIColor *color)
{
	float width=radius*2;
	float height=radius*2;
	SPTexture *t=[[SPTexture alloc] initWithWidth:width
										   height:height
											 draw:^(CGContextRef context)
				  {
					  CGFloat borderThickness=0.0f;
					  CGRect rect=CGRectMake(borderThickness, borderThickness, width, height);
					  //CGFloat radius=10.0f;
					  //outer circle
					  CGMutablePathRef path1= CGPathCreateMutable();
					  CGPathMoveToPoint(path1, NULL, CGRectGetMidX(rect), CGRectGetMinY(rect));
					  CGPathAddArcToPoint(path1, NULL, CGRectGetMaxX(rect), CGRectGetMinY(rect),
										  CGRectGetMaxX(rect), CGRectGetMaxY(rect), radius);
					  CGPathAddArcToPoint(path1, NULL, CGRectGetMaxX(rect), CGRectGetMaxY(rect),
										  CGRectGetMinX(rect), CGRectGetMaxY(rect), radius);
					  CGPathAddArcToPoint(path1, NULL, CGRectGetMinX(rect), CGRectGetMaxY(rect),
										  CGRectGetMinX(rect), CGRectGetMinY(rect), radius);
					  CGPathAddArcToPoint(path1, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect),
										  CGRectGetMaxX(rect), CGRectGetMinY(rect), radius);
					  CGPathCloseSubpath(path1);
					  CGContextAddPath(context, path1);
					  CGColorRef col1=[UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:0.2].CGColor;
					  CGContextSetFillColorWithColor(context, col1);
					  CGContextFillPath(context);
					  //
					  CGRect rect2=CGRectMake(borderThickness+2, borderThickness+2, width-4, height-4);
					  CGMutablePathRef path2= CGPathCreateMutable();
					  CGPathMoveToPoint(path2, NULL, CGRectGetMidX(rect2), CGRectGetMinY(rect2));
					  CGPathAddArcToPoint(path2, NULL, CGRectGetMaxX(rect2), CGRectGetMinY(rect2),
										  CGRectGetMaxX(rect2), CGRectGetMaxY(rect2), radius);
					  CGPathAddArcToPoint(path2, NULL, CGRectGetMaxX(rect2), CGRectGetMaxY(rect2),
										  CGRectGetMinX(rect2), CGRectGetMaxY(rect2), radius);
					  CGPathAddArcToPoint(path2, NULL, CGRectGetMinX(rect2), CGRectGetMaxY(rect2),
										  CGRectGetMinX(rect2), CGRectGetMinY(rect2), radius);
					  CGPathAddArcToPoint(path2, NULL, CGRectGetMinX(rect2), CGRectGetMinY(rect2),
										  CGRectGetMaxX(rect2), CGRectGetMinY(rect2), radius);
					  CGPathCloseSubpath(path2);
					  CGContextAddPath(context, path2);
					  CGColorRef col2=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.4].CGColor;
					  CGContextSetFillColorWithColor(context, col2);
					  CGContextFillPath(context);
					  //
					  CGRect rect3=CGRectMake(borderThickness+3, borderThickness+3, width-6, height-6);
					  CGMutablePathRef path3= CGPathCreateMutable();
					  CGPathMoveToPoint(path3, NULL, CGRectGetMidX(rect3), CGRectGetMinY(rect3));
					  CGPathAddArcToPoint(path3, NULL, CGRectGetMaxX(rect3), CGRectGetMinY(rect3),
										  CGRectGetMaxX(rect3), CGRectGetMaxY(rect3), radius);
					  CGPathAddArcToPoint(path3, NULL, CGRectGetMaxX(rect3), CGRectGetMaxY(rect3),
										  CGRectGetMinX(rect3), CGRectGetMaxY(rect3), radius);
					  CGPathAddArcToPoint(path3, NULL, CGRectGetMinX(rect3), CGRectGetMaxY(rect3),
										  CGRectGetMinX(rect3), CGRectGetMinY(rect2), radius);
					  CGPathAddArcToPoint(path3, NULL, CGRectGetMinX(rect3), CGRectGetMinY(rect3),
										  CGRectGetMaxX(rect3), CGRectGetMinY(rect3), radius);
					  CGPathCloseSubpath(path3);
					  CGContextAddPath(context, path3);
					  CGColorRef col3=[UIColor colorWithRed:0.0 green:1.0 blue:1.0 alpha:0.6].CGColor;
					  CGContextSetFillColorWithColor(context, col3);
					  CGContextFillPath(context);
					  //
					  CGRect rect4=CGRectMake(borderThickness+4, borderThickness+4, width-8, height-8);
					  CGMutablePathRef path4= CGPathCreateMutable();
					  CGPathMoveToPoint(path4, NULL, CGRectGetMidX(rect4), CGRectGetMinY(rect4));
					  CGPathAddArcToPoint(path4, NULL, CGRectGetMaxX(rect4), CGRectGetMinY(rect4),
										  CGRectGetMaxX(rect4), CGRectGetMaxY(rect4), radius);
					  CGPathAddArcToPoint(path4, NULL, CGRectGetMaxX(rect4), CGRectGetMaxY(rect4),
										  CGRectGetMinX(rect4), CGRectGetMaxY(rect4), radius);
					  CGPathAddArcToPoint(path4, NULL, CGRectGetMinX(rect4), CGRectGetMaxY(rect4),
										  CGRectGetMinX(rect4), CGRectGetMinY(rect4), radius);
					  CGPathAddArcToPoint(path4, NULL, CGRectGetMinX(rect4), CGRectGetMinY(rect4),
										  CGRectGetMaxX(rect4), CGRectGetMinY(rect4), radius);
					  CGPathCloseSubpath(path4);
					  CGContextAddPath(context, path4);
					  CGColorRef col4=[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.8].CGColor;
					  CGContextSetFillColorWithColor(context, col4);
					  CGContextFillPath(context);
					  //
				  }];
	return t;
}



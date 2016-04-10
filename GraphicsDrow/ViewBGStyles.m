//
//  ViewBGStyles.m
//  GraphicsDrow
//
//  Created by Denis Andreev on 10.04.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import "ViewBGStyles.h"

@implementation ViewBGStyles

+(void)setGradienWhiteGreenDarkGreen:(CGContextRef)context
{

    UIColor *start = [UIColor colorWithRed:192.0f/255.0f green:233.0f/255.0f blue:81.0f/255.0f alpha:1];
    UIColor *end = [UIColor colorWithRed:91.0f/255.0f green:145.0f/255.0f blue:33.0f/255.0f alpha:1];
    [self generateGradientStartColor:start endColor:end context:context];
}

+(void)setGradienWhiteOrangeDarkOrange:(CGContextRef)context{
    UIColor *start = [UIColor colorWithRed:240.0f/255.0f green:188.0f/255.0f blue:68.0f/255.0f alpha:1];
    UIColor *end = [UIColor colorWithRed:206.0f/255.0f green:81.0f/255.0f blue:30.0f/255.0f alpha:1];
    [self generateGradientStartColor:start endColor:end context:context];
}

+(void)setGradienWhiteBlueDarkBlue:(CGContextRef)context{
    UIColor *start = [UIColor colorWithRed:135.0f/255.0f green:216.0f/255.0f blue:251.0f/255.0f alpha:1];
    UIColor *end = [UIColor colorWithRed:25.0f/255.0f green:65.0f/255.0f blue:170.0f/255.0f alpha:1];
    [self generateGradientStartColor:start endColor:end context:context];
}

+(void)setGradienWhiteRedDarkRed:(CGContextRef)context{
    UIColor *start = [UIColor colorWithRed:222.0f/255.0f green:95.0f/255.0f blue:97.0f/255.0f alpha:1];
    UIColor *end = [UIColor colorWithRed:146.0f/255.0f green:36.0f/255.0f blue:34.0f/255.0f alpha:1];
    [self generateGradientStartColor:start endColor:end context:context];
}

+(void)generateGradientStartColor:(UIColor*)startColor endColor:(UIColor*)endColor context:(CGContextRef)context {
    CGFloat locations[2] = {0.0, 1.0};
    CFArrayRef colors = (__bridge CFArrayRef) [NSArray arrayWithObjects:(id)startColor.CGColor,
                                               (id)endColor.CGColor,
                                               nil];
    
    CGColorSpaceRef colorSpc = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpc, colors, locations);
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0.5, 0.0), CGPointMake(0.5, 100.0), kCGGradientDrawsAfterEndLocation);
    
    CGColorSpaceRelease(colorSpc);
    CGGradientRelease(gradient);
}

@end

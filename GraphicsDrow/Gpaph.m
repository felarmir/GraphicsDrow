//
//  Gpaph.m
//  GraphicsDrow
//
//  Created by Denis Andreev on 09.04.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import "Gpaph.h"
#import "ViewBGStyles.h"

@implementation Gpaph
{
    CGFloat valueSize;
    
    CGFloat minV;
    CGFloat maxV;
    
    CGFloat stepX;
    CGFloat stepY;
    
    CGRect rect;
    
    CGContextRef context;
    NSArray *data;
    
    NSInteger days;
}


- (void)addData:(NSArray*)dataArray{
    data = dataArray;
    days = [data count];
    
    stepX = (self.layer.bounds.size.width/(float)[data count])/1.6;
    minV = [self getMinValue:data];
    maxV = [self getMaxValue:data];
    valueSize = maxV - minV;
    
}

-(void)drawGraphic{
    CGFloat x = 0;
    [[UIColor greenColor] set];
    CGContextSetLineWidth(context, 2.0f);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    stepY = (self.bounds.size.height/valueSize);
    NSLog(@"Step:%f Height:%f", stepY, self.bounds.size.height);
    CGContextMoveToPoint(context, 0,self.bounds.size.height-(([[data[0] objectForKey:@"temp"] floatValue]-minV)*stepY));
    for (int i = 1; i < [data count]; i++) {
        CGFloat value = self.bounds.size.height-(([[data[i] objectForKey:@"temp"] floatValue]-minV)*stepY);
        CGContextAddLineToPoint(context, x+=stepX, value);
        NSLog(@"Height:%f Val:%f", self.bounds.size.height, (([[data[i] objectForKey:@"temp"] floatValue]-minV)));
    }
    
    CGContextStrokePath(context);
}

-(CGFloat)getMinValue:(NSArray*)array{
    CGFloat min = 0;
    BOOL isFirst = YES;
    for (NSDictionary* d in array) {
        float tmp = [[d objectForKey:@"temp"] floatValue];
        if (isFirst) {
            min = tmp;
            isFirst = NO;
        } else {
            if (min > tmp) {
                min = tmp;
            }
        }
    }
    return min;
}

-(CGFloat)getMaxValue:(NSArray*)array{
    CGFloat max = 0;
    BOOL isFirst = YES;
    for (NSDictionary* d in array) {
        float tmp = [[d objectForKey:@"temp"] floatValue];
        if (isFirst) {
            max = tmp;
            isFirst = NO;
        } else {
            if (max < tmp) {
                max = tmp;
            }
        }
    }
    return max;
}
- (void)drawRect:(CGRect)rect {
    self.layer.cornerRadius = 10.0f;
    if (!context) {
        context = UIGraphicsGetCurrentContext();
    }
    [ViewBGStyles setGradienWhiteOrangeDarkOrange:context];
    [self drawGrid];
    [self drawGraphic];
}

-(void)setStyle{

    UIColor *lightGradientColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
    UIColor *darkGradientColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:1.0];
    
    CGFloat locations[2] = {0.0, 1.0};
    CFArrayRef colors = (__bridge CFArrayRef) [NSArray arrayWithObjects:(id)lightGradientColor.CGColor,
                                      (id)darkGradientColor.CGColor,
                                      nil];
    
    CGColorSpaceRef colorSpc = CGColorSpaceCreateDeviceRGB();
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpc, colors, locations);
    
    CGContextDrawLinearGradient(context, gradient, CGPointMake(0.5, 0.0), CGPointMake(0.5, 100.0), kCGGradientDrawsAfterEndLocation);
    
    CGColorSpaceRelease(colorSpc);
    CGGradientRelease(gradient);
}


- (void)drawGrid{

    CGContextSetLineWidth(context, 0.7f);
    [[UIColor grayColor] set];
    
    CGFloat stepGrindX = self.layer.bounds.size.width/days;
    CGFloat stepGrindY = self.layer.bounds.size.height/10;
    
    for (int i = 0; i < self.layer.bounds.size.width; i+=stepGrindX) {
        CGContextMoveToPoint(context, i, 0);
        CGContextAddLineToPoint(context, i, self.layer.bounds.size.height);
    }
    for (int i = 0; i < self.layer.bounds.size.height; i+=stepGrindY) {
        CGContextMoveToPoint(context, 0, i);
        CGContextAddLineToPoint(context, self.layer.bounds.size.width, i);
    }
    CGContextStrokePath(context);
}

@end

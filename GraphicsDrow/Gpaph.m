//
//  Gpaph.m
//  GraphicsDrow
//
//  Created by Denis Andreev on 09.04.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import "Gpaph.h"

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
}

- (void)addData:(NSArray*)dataArray{
    data = dataArray;
    rect = self.layer.bounds;
    
    stepX = (float)rect.size.width/(float)[data count];
    minV = [self getMinValue:data];
    maxV = [self getMaxValue:data];
    valueSize = maxV - minV;
    stepY = (float)rect.size.height/valueSize;
}

-(void)drawGraphic{
    if (!context) {
        context = UIGraphicsGetCurrentContext();
    }
    
    CGFloat x = 0;
    [[UIColor greenColor] set];
    CGContextSetLineWidth(context, 2.0f);
    
    CGContextMoveToPoint(context, 0,rect.size.height-(([data[0] floatValue]-minV)*stepY));
    
    for (int i = 1; i < [data count]; i++) {
        CGContextAddLineToPoint(context, x+=stepX, rect.size.height-(([data[i] floatValue]-minV)*stepY));
    }
    
    CGContextStrokePath(context);
}

-(CGFloat)getMinValue:(NSArray*)array{
    CGFloat min = 0;
    BOOL isFirst = YES;
    for (NSNumber* n in array) {
            if (isFirst) {
                min = [n floatValue];
                isFirst = NO;
            } else {
                if (min > [n floatValue]) {
                    min = [n floatValue];
                }
            }
    }
    return min;
}

-(CGFloat)getMaxValue:(NSArray*)array{
    CGFloat min = 0;
    BOOL isFirst = YES;
    for (NSNumber* n in array) {
            if (isFirst) {
                min = [n floatValue];
                isFirst = NO;
            } else {
                if (min < [n floatValue]) {
                    min = [n floatValue];
                }
            }
    }
    return min;
}
- (void)drawRect:(CGRect)rect {
    [self drawGrid];
    [self drawGraphic];
}



- (void)drawGrid{
    if (!context) {
        context = UIGraphicsGetCurrentContext();
    }
    CGContextSetLineWidth(context, 0.1f);
    [[UIColor blueColor] set];
    
    CGFloat stepGrindX = rect.size.width/10;
    CGFloat stepGrindY = rect.size.height/10;
    
    for (int i = 0; i < rect.size.width; i+=stepGrindX) {
        CGContextMoveToPoint(context, i, 0);
        CGContextAddLineToPoint(context, i, rect.size.height);
    }
    for (int i = 0; i < rect.size.height; i+=stepGrindY) {
        CGContextMoveToPoint(context, 0, i);
        CGContextAddLineToPoint(context, rect.size.width, i);
    }
    CGContextStrokePath(context);
}

@end

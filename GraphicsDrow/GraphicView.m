//
//  GraphicView.m
//  GraphicsDrow
//
//  Created by Denis Andreev on 09.04.16.
//  Copyright © 2016 Denis Andreev. All rights reserved.
//

#import "GraphicView.h"

@interface GraphicView ()

@end

@implementation GraphicView

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *fData = [NSArray arrayWithObjects:[NSNumber numberWithFloat:39.13],
                      [NSNumber numberWithFloat:39.16],
                      [NSNumber numberWithFloat:39.28],
                      [NSNumber numberWithFloat:39.35],
                      [NSNumber numberWithFloat:39.05],
                      [NSNumber numberWithFloat:39.12],
                      [NSNumber numberWithFloat:39.30],
                      [NSNumber numberWithFloat:38.74],
                      [NSNumber numberWithFloat:38.5],
                      [NSNumber numberWithFloat:38.25],
                      [NSNumber numberWithFloat:38.52],
                      [NSNumber numberWithFloat:38.83],
                      [NSNumber numberWithFloat:38.7], nil];
    
    [_graph addData:fData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

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
    NSArray *dicDataArray = @[
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:5], @"temp", @"01.04",@"date", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:2], @"temp", @"02.04",@"date", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:4], @"temp", @"03.04",@"date", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:1], @"temp", @"04.04",@"date", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:8], @"temp", @"05.04",@"date", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:3], @"temp", @"06.04",@"date", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:9], @"temp", @"07.04",@"date", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:2], @"temp", @"08.04",@"date", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:15], @"temp", @"09.04",@"date", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:8], @"temp", @"10.04",@"date", nil],
                    [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithFloat:8], @"temp", @"10.04",@"date", nil]];
    
    [_graph addData:dicDataArray];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

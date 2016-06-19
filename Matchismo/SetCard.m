//
//  SetCard.m
//  Matchismo
//
//  Created by Alejandro on 5/3/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *)otherCards{
    int score = 0;
    return score;
}

-(NSString *)contents{
    return @"";
}


+ (NSArray *)validShapes{
    return @[@"●",@"■",@"▴"];
}

@synthesize shading = _shading;
@synthesize shape = _shape;
@synthesize color = _color;
@synthesize number = _number;

- (void)setShading:(int)shading{
    if(shading < 3){
        _shading = shading;
    }
}

- (void)setShape:(int)shape{
    if(shape < 3){
        _shape = shape;
    }
}

- (NSString*)getShape:(int)shape{
    if(shape < 3){
        return [SetCard validShapes][shape];
    }
    return @"?";
}

- (void)setColor:(int)color{
    if(color < 3){
        _color = color;
    }
}

- (void)setNumber:(int)number{
    if(number <= 3){
        _number = number;
    }
}


@end

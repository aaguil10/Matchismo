//
//  SetCard.h
//  Matchismo
//
//  Created by Alejandro on 5/3/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

//1 = Solid In, 2 = Outlined, 3 = Striped
@property (nonatomic) int shading;
//1 = Circle, 2 = Square, 3 = Triangle
@property (nonatomic) int shape;
//1 = Red, 2 = Purple, 3 = Green
@property (nonatomic) int color;
//Number of shapes
@property (nonatomic) int number;


+ (NSArray *)validShapes;


@end

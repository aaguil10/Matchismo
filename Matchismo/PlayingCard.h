//
//  PlayingCard.h
//  Matchismo
//
//  Created by Alejandro on 3/31/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end

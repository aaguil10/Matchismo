//
//  PlayingCard.m
//  Matchismo
//
//  Created by Alejandro on 3/31/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards{
    int score = 0;
    self.matchReason = self.contents;
    for(PlayingCard *otherCard in otherCards){
        if(otherCard.rank == self.rank){
            score = 4;
            self.matchReason = [NSString stringWithFormat:@"%@ %@", self.matchReason, otherCard.contents];
        }else if([otherCard.suit isEqualToString:self.suit]){
            score = 1;
            self.matchReason = [NSString stringWithFormat:@"%@ %@", self.matchReason, otherCard.contents];
        }
    }
    self.matchReason = [NSString stringWithFormat:@"%@ matched", self.matchReason];
    return score;
}

-(NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

- (void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit = suit;
    }
}

- (NSString *)suit{
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger)rank{
    if(rank <= [PlayingCard maxRank]){
        _rank = rank;
    }
}


+ (NSArray *)validSuits{
    return @[@"♤",@"♧",@"♡",@"♢"];
}

+ (NSArray *)rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",
             @"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank{
    return [[self rankStrings] count] - 1;
}





@end

//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Alejandro on 4/3/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck: (Deck *) deck;

- (void) chooseCardAtIndex: (NSInteger)index;
- (Card *)cardAtIndex: (NSInteger) index;

@property (nonatomic, readonly) NSInteger score;

@end

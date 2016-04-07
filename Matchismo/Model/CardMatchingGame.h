//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Alejandro on 4/6/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount: (NSInteger) count usingDeck: (Deck *) deck;

- (void) chooseCardAtIndex: (NSUInteger) index;
- (Card *) cardAtIndex:(NSUInteger) index;
- (void) redealCards:(NSUInteger)count withDeck:(Deck *) deck;

@property (nonatomic, readonly) NSInteger score;


@end

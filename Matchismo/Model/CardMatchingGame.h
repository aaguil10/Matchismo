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
- (void) setGameMode: (BOOL) gmValue; //1 = 3 card  0 = 2 card
- (int) getNumberCardsInPlay;

@property (nonatomic) BOOL gameMode; // NO = 2 card YES = 3 card game
@property (nonatomic, readonly) NSInteger score;
@property (nonatomic, readonly) NSString* gameStatus;


@end

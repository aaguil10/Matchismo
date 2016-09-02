//
//  Deck.h
//  Matchismo
//
//  Created by Alejandro on 3/31/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

@property (nonatomic) BOOL typeOfGame; //2 card game or 3 card game?

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end

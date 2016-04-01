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

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end

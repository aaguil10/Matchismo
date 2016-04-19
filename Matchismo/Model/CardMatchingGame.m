//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Alejandro on 4/6/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards; // of card
@end


@implementation CardMatchingGame

- (NSMutableArray *)cards{
    if(!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (instancetype)initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck{
    self = [super init];
    self.gameMode = NO;
    if(self){
        for(int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index{
    return (index<[self.cards count])? self.cards[index]: nil;
}


static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;
- (void)chooseCardAtIndex:(NSUInteger)index{
    Card *card = [self cardAtIndex:index];
    if(!card.isMatched){
        if(card.isChossen){
            card.chosen = NO;
        }else{
            NSMutableArray *chossenCards = [[NSMutableArray alloc] init];
            for(Card *otherCard in self.cards){
                if(otherCard.isChossen && !otherCard.isMatched){
                    [chossenCards addObject:otherCard];
                }
            }
            if(self.gameMode){ //3 card game mode logic
                if([chossenCards count] == 2){
                    Card *card1 = chossenCards[0];
                    Card *card2 = chossenCards[1];
                    int matchScore = [card match:chossenCards];
                    if(matchScore){
                        self.score += matchScore * MATCH_BONUS;
                        card1.matched = YES;
                        card2.matched = YES;
                        card.matched = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        card1.chosen = NO;
                        card2.chosen = NO;
                    }
                }
            }else{  //2 Card game mode logic
                if([chossenCards count] == 1){
                    Card *otherCard = chossenCards[0];
                    if(otherCard.isChossen && !otherCard.isMatched){
                        int matchScore = [card match:@[otherCard]];
                        if(matchScore){
                            self.score += matchScore * MATCH_BONUS;
                            otherCard.matched = YES;
                            card.matched = YES;
                        }else{
                            self.score -= MISMATCH_PENALTY;
                            otherCard.chosen = NO;
                        }
                    }
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

- (void) redealCards:(NSUInteger)count withDeck:(Deck *)deck{
    self.cards = [[NSMutableArray alloc] init];
    for(int i = 0; i < count; i++){
        Card *card = [deck drawRandomCard];
        if(card){
            card.matched = NO;
            card.chosen = NO;
            [self.cards addObject:card];
        }else{
            NSLog(@"%@",@"ran out of cards!");
            break;
        }
    }
    self.score = 0;
}



- (void) setGameMode:(BOOL)gmValue{
    if(gmValue){
        _gameMode = NO;
        NSLog(@"%@", @"Set to 2 card mode");
    }else{
        _gameMode = YES;
        NSLog(@"%@", @"Set to 3 card mode");
    }
    
}



@end

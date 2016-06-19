//
//  PlayingCardViewController.m
//  Matchismo
//
//  Created by Alejandro on 5/3/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@implementation PlayingCardViewController

- (Deck *)createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (void)updateUI{
    [super updateUI];
    for(UIButton *cardButton in self.cardButtons){
        @try{
            int cardButtonIndex = (int)[self.cardButtons indexOfObject:cardButton];
            Card *card = [self.game cardAtIndex:cardButtonIndex];
            [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        }@catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
    }
    
}

-(UIImage *)backgroundImageForCard:(Card *) card{
    return [UIImage imageNamed:card.isChossen ? @"cardfront.png":@"cardback.png"];
}


@end

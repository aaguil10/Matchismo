//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Alejandro on 5/3/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (instancetype) init{
    self = [super init];
    
    if(self){
        for(int shape = 0; shape <= 4; shape++){
            for(int color = 0; color <= 3; color++){
                for(int number = 0; number <= 3; number++){
                    for(int shading = 0; shading <= 3; shading++){
                        SetCard *card = [[SetCard alloc] init];
                        card.color = color;
                        card.number = number;
                        card.shading = shading;
                        card.shape = shape;
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
}

@end

//
//  SetViewController.m
//  Matchismo
//
//  Created by Alejandro on 5/1/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "SetViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (Deck *)createDeck{
    return [[SetCardDeck alloc] init];
}

- (void)updateUI{
    [super updateUI];
    for(UIButton *cardButton in self.cardButtons){
        @try{
            int cardButtonIndex = (int)[self.cardButtons indexOfObject:cardButton];
            SetCard *card = (SetCard*) [self.game cardAtIndex:cardButtonIndex];
            [cardButton setAttributedTitle:[self titleForCard:card] forState:UIControlStateNormal];
            [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        }@catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
    }
}

-(UIImage *)backgroundImageForCard:(Card *) card{
    return [UIImage imageNamed:card.isChossen ? @"cardchoosen.png":@"cardfront.png"];
}

-(NSMutableAttributedString *)titleForCard:(SetCard *)card{
    NSMutableString *result = [NSMutableString string];
    for(int i = 0; i < card.number; i++){
        [result appendString:[SetCard validShapes][card.shape]];
    }
    
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:result];
    [title setAttributes:@{NSStrokeWidthAttributeName: [self returnStrokeWidth:card],
                           NSForegroundColorAttributeName: [self returnColor:card],
                           NSStrokeColorAttributeName: [self returnColor:card]}
                   range:NSMakeRange(0, [title length])];
    return title;
}

- (UIColor*) returnColor:(SetCard*)card{
    double alpla = 0.3;
    if(card.color == 0){
        return [UIColor purpleColor];
    }else if(card.color == 1){
        if(card.shading == 2){
            return [[UIColor redColor] colorWithAlphaComponent:alpla];
        }else{
            return [UIColor redColor];
        }
    }else if(card.color == 2){
        if(card.shading == 2){
            return [[UIColor blueColor] colorWithAlphaComponent:alpla];
        }else{
            return [UIColor blueColor];
        }
    }else if(card.color == 3){
        if(card.shading == 2){
            return [[UIColor greenColor] colorWithAlphaComponent:alpla];
        }else{
            return [UIColor greenColor];
        }
    }
    return [UIColor blackColor];
}

- (NSNumber *) returnStrokeWidth:(SetCard*)card{
    if(card.shading == 0){
        return @0;
    } else if(card.shading == 1){
        return @3;
    }else if(card.shading == 2){
        return @-3;
    }
    return nil;
}


@end

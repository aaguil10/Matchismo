//
//  ViewController.m
//  Matchismo
//
//  Created by Alejandro on 3/29/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck *myDeck;

@end

@implementation ViewController

- (Deck *) myDeck{
    if(!_myDeck){
        _myDeck = [self createDeck];
    }
    return _myDeck;
}

- (Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (void) setFlipCount:(int)flipCount{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    NSLog(@"Flip Count = %d", self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if([sender.currentTitle length]){
        [sender setBackgroundImage:[UIImage imageNamed:@"cardback.png"]
                          forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.flipCount++;
    }else{
        Card *currentCard = [self.myDeck drawRandomCard];
        if(currentCard){
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront.png"]
                          forState:UIControlStateNormal];
            [sender setTitle:currentCard.contents forState:UIControlStateNormal];
            self.flipCount++;
        }
    }
}


@end

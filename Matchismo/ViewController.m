//
//  ViewController.m
//  Matchismo
//
//  Created by Alejandro on 3/29/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *redealButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self updateUI];
}

- (CardMatchingGame *) game{
    if(!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *) createDeck{ //abstract
    return nil;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = (int)[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (IBAction)touchRedealButton:(id)sender {
    [self.game redealCards:12 withDeck:[self createDeck]];
    [self updateUI];
}


- (void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        @try{
            int cardButtonIndex = (int)[self.cardButtons indexOfObject:cardButton];
            Card *card = [self.game cardAtIndex:cardButtonIndex];
            cardButton.enabled = !card.isMatched;
            self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];
        }@catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
    }
}








@end

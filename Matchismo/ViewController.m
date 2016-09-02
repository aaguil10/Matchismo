//
//  ViewController.m
//  Matchismo
//
//  Created by Alejandro on 3/29/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (strong, nonatomic) CardMatchingGame *game;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *redealButton;
//@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSegmentControl;
//@property (weak, nonatomic) IBOutlet UILabel *gameStatusLabel;

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
    //[self enableGameMode:NO];
}

- (IBAction)touchRedealButton:(id)sender {
    //self.scoreLabel.text = @"Re-dealing cards!";
    [self.game redealCards:12 withDeck:[self createDeck]];
    //[self enableGameMode:YES];
    [self updateUI];
}

//- (IBAction)touchGameModeSement:(id)sender {
//    BOOL mode = self.gameModeSegmentControl.selectedSegmentIndex;
//    [self.game setGameMode: !mode];
//    [self updateUI];
//}

- (void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        @try{
            int cardButtonIndex = (int)[self.cardButtons indexOfObject:cardButton];
            Card *card = [self.game cardAtIndex:cardButtonIndex];
            //[cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
            cardButton.enabled = !card.isMatched;
            self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];
        }@catch (NSException * e) {
            NSLog(@"Exception: %@", e);
        }
    }
//    self.gameStatusLabel.text = @"";
//    self.gameStatusLabel.text = self.game.gameStatus;
}


//-(void) enableGameMode: (BOOL) enable{
//    [_gameModeSegmentControl setEnabled:enable forSegmentAtIndex:0];
//    [_gameModeSegmentControl setEnabled:enable forSegmentAtIndex:1];
//}





@end

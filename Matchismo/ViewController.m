//
//  ViewController.m
//  Matchismo
//
//  Created by Alejandro on 3/29/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *redealButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeSegmentControl;

@end

@implementation ViewController

- (CardMatchingGame *) game{
    if(!_game){
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    return _game;
}

- (Deck *) createDeck{
    return [[PlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int chosenButtonIndex = (int)[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (IBAction)touchRedealButton:(id)sender {
    self.scoreLabel.text = @"Re-dealing cards!";
    [self.game redealCards:12 withDeck:[self createDeck]];
    [self updateUI];
}

- (IBAction)touchGameModeSement:(id)sender {
    //self.scoreLabel.text = @"touched Game mode!";
    //NSLog(@"seg: %ld", (long)self.gameModeSegmentControl.selectedSegmentIndex);
    BOOL mode = self.gameModeSegmentControl.selectedSegmentIndex;
    [self.game setGameMode: !mode];
}

- (void)updateUI{
    for(UIButton *cardButton in self.cardButtons){
        int cardButtonIndex = (int)[self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];
    }
    
}

-(NSString *)titleForCard:(Card *)card{
    return card.isChossen ? card.contents : @"";
}

-(UIImage *)backgroundImageForCard:(Card *) card{
    return [UIImage imageNamed:card.isChossen ? @"cardfront.png":@"cardback.png"];
}





@end

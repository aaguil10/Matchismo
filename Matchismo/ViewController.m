//
//  ViewController.m
//  Matchismo
//
//  Created by Alejandro on 3/29/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "ViewController.h"
#import "CardMatchingGame.h"

@interface ViewController ()
//@property (strong, nonatomic) CardMatchingGame *game;
//@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
//@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

//- (CardMatchingGame *)game{
//    NSLog(@"creating game!");
//    if(!_game){
//        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
//    }
//    NSLog(@"created game!");
//    return _game;
//}

//- (Deck *) createDeck{
//    return [[Deck alloc] init];
//}


//- (IBAction)touchCardButton:(UIButton *)sender {
//    int cardIndex = (int)[self.cardButtons indexOfObject: sender];
//    [self.game chooseCardAtIndex:cardIndex];
//    [self updateUI];
//}

//- (void) updateUI{
//    for(UIButton *cardButton in self.cardButtons){
//        NSInteger cardIndex = [self.cardButtons indexOfObject:cardButton];
//        Card *card = [self.game cardAtIndex:cardIndex];
//        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
//        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
//        cardButton.enabled = !card.isMatched;
//    }
//    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", (long)self.game.score];
//    
//}
//
//- (NSString *) titleForCard: (Card *) card{
//    return (card.isChossen) ? card.contents : @"";
//}
//
//- (UIImage *) backgroundImageForCard: (Card *) card{
//    return [UIImage imageNamed:card.isChossen ? @"cardfront.png" : @"cardback.png"];
//}

@end

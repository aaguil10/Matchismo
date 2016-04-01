//
//  ViewController.m
//  Matchismo
//
//  Created by Alejandro on 3/29/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) PlayingCardDeck *myDeck;
@property (strong, nonatomic) PlayingCard *currentCard;

@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    if(!_myDeck){
       _myDeck = [[PlayingCardDeck alloc] init];
    }
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
    }else{
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront.png"]
                          forState:UIControlStateNormal];
        _currentCard = (PlayingCard*)[_myDeck drawRandomCard];
        NSString *rankString = [@([_currentCard rank]) stringValue];
        NSString *cardString = [[_currentCard suit] stringByAppendingString:rankString];
        [sender setTitle:cardString forState:UIControlStateNormal];
    }
    self.flipCount++;
}


@end

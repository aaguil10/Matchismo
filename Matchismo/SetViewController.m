//
//  SetViewController.m
//  Matchismo
//
//  Created by Alejandro on 5/1/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "SetViewController.h"
#import "SetCardDeck.h"

@interface SetViewController ()

@end

@implementation SetViewController

- (Deck *)createDeck{
    return [[SetCardDeck alloc] init];
}

@end

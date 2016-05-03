//
//  SetViewController.m
//  Matchismo
//
//  Created by Alejandro on 5/1/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import "SetViewController.h"
#import "CardMatchingGame.h"

@interface SetViewController ()
@property (strong, nonatomic) IBOutletCollection(UIView) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

@end

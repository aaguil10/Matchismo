//
//  Card.h
//  Matchismo
//
//  Created by Alejandro on 3/30/16.
//  Copyright © 2016 PolloStudios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong, nonatomic) NSString *contents;
@property (strong, nonatomic) NSString *matchReason;

@property (nonatomic, getter=isChossen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end

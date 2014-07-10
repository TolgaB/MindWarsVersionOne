//
//  ChooseGame.m
//  MindWarsVersionOne
//
//  Created by Tolga Beser on 7/10/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "ChooseGame.h"

@implementation ChooseGame


-(void) play {
    NSLog(@"Play Pressed");
    /*
     2) Start a random match
     */
    [MGWU getRandomGameWithCallback:@selector(receivedRandomGame:) onTarget:self];
}



- (void)receivedRandomGame:(NSDictionary *)game {
    // when we reveive a random game, present the GamePlay with this game
    CCScene *scene = [CCBReader loadAsScene:@"GamePlay"];
    [[CCDirector sharedDirector] pushScene:scene];
}

@end

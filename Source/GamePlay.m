//
//  GamePlay.m
//  MindWarsVersionOne
//
//  Created by Tolga Beser on 7/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GamePlay.h"
#import "Tile.h"
#import "Grid.h"


@implementation GamePlay {
    CCSprite *_playerOne;
    Grid * myGrid;
    CCSprite *_playerTwo;
    
    BOOL playerOneTurn;
    
    
    NSString *_opponent;
    NSString *_gameState;
    NSMutableDictionary *_gameData;
    
    
}




-(void)didLoadFromCCB {
    
     self.userInteractionEnabled = TRUE;
    playerOneTurn = YES;
    [self gameStarted];
    
}

-(void)gameStarted {
    
    //This loads the grid
    myGrid = [[Grid alloc ]init];
    NSLog(@"The grid has been initialized");
    
    _playerOne.position = [myGrid getPositionOfTile:2 andY:0];
    
    _playerTwo.position = [myGrid getPositionOfTile:0 andY:2];
    
    
    
    
    
    
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    if (playerOneTurn) {
        CGPoint touchLocation = [touch locationInNode:self];
        Tile* myTile = [myGrid getTileForTouchPosition:touchLocation];
        _playerOne.position = myTile.position;
        playerOneTurn = false;

    }
    else {
        CGPoint touchLocation = [touch locationInNode:self];
        Tile* myTile = [myGrid getTileForTouchPosition:touchLocation];
        _playerTwo.position = myTile.position;
        playerOneTurn = true;
    }
    
    
    
    NSLog(@"Touch Gotten");
    
}


@end

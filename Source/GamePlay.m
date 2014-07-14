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
    
    
    int officialMoveNumber;
    
    bool pastFirstMove;
    
    
    
    
    
    
}




-(void)didLoadFromCCB {
    
     self.userInteractionEnabled = TRUE;
    playerOneTurn = YES;
    officialMoveNumber = 1;
    pastFirstMove =  false;
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
 
    	int gameId = [_game[@"gameid"] intValue];
    
    if (playerOneTurn) {
        CGPoint touchLocation = [touch locationInNode:self];
        Tile* myTile = [myGrid getTileForTouchPosition:touchLocation];

        
        if(myTile != nil){
            _playerOne.position = myTile.position;
            
            NSDictionary *playerMove = @{@"X": myTile.positionX, @"Y": myTile.positionY};
            
            if (pastFirstMove){
          [MGWU move:playerMove withMoveNumber:officialMoveNumber forGame:gameId withGameState:@"started" withGameData:playerMove againstPlayer:@"mgwu-random" withPushNotificationMessage:@"Opponent has moved" withCallback:@selector(moveCompleted:) onTarget:self];
          
            
            officialMoveNumber++;
            }
            
            else {
                [MGWU move:playerMove withMoveNumber:officialMoveNumber forGame:gameId withGameState:@"inprogress" withGameData:playerMove againstPlayer:@"mgwu-random" withPushNotificationMessage:@"Opponent has moved" withCallback:@selector(moveCompleted:) onTarget:self];
                
                
                officialMoveNumber++;
                
            }
            
            playerOneTurn = false;
            
        }

    }
    else {
        CGPoint touchLocation = [touch locationInNode:self];
        Tile* myTile = [myGrid getTileForTouchPosition:touchLocation];
        if(myTile != nil){
            _playerTwo.position = myTile.position;
            playerOneTurn = true;
            officialMoveNumber++;
        }
    }
    
    
    
    NSLog(@"Touch Gotten");
    
}


- (void)moveCompleted:(NSMutableDictionary*)game {
   	_game = game;
    //Reload view based on received game
    //[self reload];
}


-(void)reload {
    
    _gameState = _game[@"gamestate"];
    _gameData = _game[@"gamedata"];
    
    if (_gameState) {
        //No game exists start a game
        
        _gameState = @"started";
        _gameData = [@{@"number":@10} mutableCopy];
    }
    
    else {
        
        
        _gameState = _game[@"inprogress"];
        
        
    }

    
    
    
    
    
    
}




-(void)reloadButtonPressed {
    [MGWU getGame:0 withCallback:@selector(gotGame:) onTarget:self];
}

- (void)gotGame:(NSMutableDictionary*)game {
    
}

@end

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
    CCSprite *_hero;
    Grid * myGrid;
}




-(void)didLoadFromCCB {
    
     self.userInteractionEnabled = TRUE;
    [self gameStarted];
}

-(void)gameStarted {
    
    //This loads the grid
    myGrid = [[Grid alloc ]init];
    NSLog(@"The grid has been initialized");
    _hero.position = [myGrid getPositionOfTile:0 andY:0];
    
    
    
    
    
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    [myGrid getTileForTouchPosition:touchLocation];
    
    NSLog(@"Touch Gotten");
    
}


@end

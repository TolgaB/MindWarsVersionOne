//
//  MakeGrid.m
//  MindWarsVersionOne
//
//  Created by Tolga Beser on 7/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Tile.h"

@implementation Grid {
    NSMutableArray *_grid;
}

-(void) didLoadFromCCB {
    
}

-(id)init{
    self = [super init];
    [self generateGrid];
    return self;
    
}



-(void) generateGrid {
    NSLog(@"It works yay");
    //Initialize the main grid
    _grid = [[NSMutableArray alloc]init];
    
  
    
    for (int i = 0; i < 3; i++){
        //Each "temp" array acts as a row in this case 3 tiles in a temp
        NSMutableArray * temp = [[NSMutableArray alloc]init];
        
        for (int j = 0; j< 3; j++){
            Tile* temptile = [[Tile alloc] init];
            temptile.position = CGPointMake(i * 50 + 50, j * 50 + 50);
            [temp addObject:temptile];
        }
        
        [_grid addObject:temp];
    }
    
}

-(CGPoint) getPositionOfTile: (int) x andY: (int) y{
    Tile *tempTile = _grid [x] [y];
    return tempTile.position;
}

-(Tile *) getTileForTouchPosition: (CGPoint) pos; {
    
    NSLog(@"x: %f y: %f", pos.x, pos.y);
    
    if (pos.x > 150 || pos.y > 150) {
        NSLog(@"Touch out of grid");
        return nil;
    }
    
    if (pos.x < 25 || pos.y < 25) {
        NSLog(@"Touch out of grid");
        
        return nil;
    }
    
    float ypoint = pos.y;
    float xpoint = pos.x;
    
    Tile* anotherTempTile = _grid [(int)floorf((xpoint - 25) / 50.0)] [(int)floorf((ypoint - 25.0) / 50.0)];
    
    
    return anotherTempTile;
}

@end

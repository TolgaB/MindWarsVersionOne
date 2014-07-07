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
            temptile.point = CGPointMake(i * 50 + 25, j * 50 + 25);
            [temp addObject:temptile];
        }
        
        [_grid addObject:temp];
    }
    
}

@end

//
//  MakeGrid.m
//  MindWarsVersionOne
//
//  Created by Tolga Beser on 7/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "MakeGrid.h"
#import "Tile.h"

@implementation MakeGrid {
    NSMutableArray *grid;
}

-(void) didLoadFromCCB {
    
}




-(void) generateGrid {
    NSLog(@"It works yay");
    grid = [[NSMutableArray alloc]init];
    for (int i = 0; i < 3; i++){
        
        NSMutableArray * temp = [[NSMutableArray alloc]init];
        for (int j = 0; j< 3; j++){
            Tile* temptile = [[Tile alloc] init];
            [temp addObject:temptile];
        }
        
        [grid addObject:temp];
    }
    
}

@end

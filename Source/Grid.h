//
//  MakeGrid.h
//  MindWarsVersionOne
//
//  Created by Tolga Beser on 7/3/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCNode.h"

@interface Grid : CCNode


-(void)generateGrid;
-(id)init;
-(CGPoint) getPositionOfTile: (int) x andY: (int) y;

@end

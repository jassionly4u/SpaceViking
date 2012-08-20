//
//  GameScene.m
//  SpaceViking
//
//  Created by MSP User iMac 5NE53 on 16/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

-(id)init{
    self = [super init];
    if (self != nil) {
        
        BackgroundLayer *backgroundLayer = [BackgroundLayer node];
        [self addChild:backgroundLayer z:0];
        
        GameplayLayer *gameplayLayer = [GameplayLayer node];
        [self addChild:gameplayLayer z:5];
    }
    
    return self;
}

@end

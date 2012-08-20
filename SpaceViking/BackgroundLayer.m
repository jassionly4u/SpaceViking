//
//  BackgroundLayer.m
//  SpaceViking
//
//  Created by MSP User iMac 5NE53 on 16/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer

-(id)init{
    self = [super init];
    if (self != nil) {
        
        CCSprite *backgroundImage;
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            backgroundImage = [CCSprite spriteWithFile:@"background.png"];
        }else{
            backgroundImage = [CCSprite spriteWithFile:@"backgroundiPhone.png"];
        }
        
        CGSize screenSize = [[CCDirector sharedDirector]winSize];
        [backgroundImage setPosition:CGPointMake(screenSize.width/2, screenSize.height/2)];
        
        [self addChild:backgroundImage z:0 tag:0];
    }
    return self;
}

@end

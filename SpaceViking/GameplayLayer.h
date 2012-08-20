//
//  GameplayLayer.h
//  SpaceViking
//
//  Created by MSP User iMac 5NE53 on 16/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCLayer.h"
#import "cocos2d.h"
#import "SneakyJoystick.h"
#import "SneakyButton.h"
#import "SneakyButtonSkinnedBase.h"
#import "SneakyJoystickSkinnedBase.h"

@interface GameplayLayer : CCLayer{
    
    CCSprite *vikingSprite;
    SneakyJoystick *leftJoyStick;
    SneakyButton *jumpButton;
    SneakyButton *attackButton;
}

@end

//
//  GameplayLayer.m
//  SpaceViking
//
//  Created by MSP User iMac 5NE53 on 16/08/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GameplayLayer.h"

@implementation GameplayLayer

-(void)initJoystickAndButtons{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    CGRect joystickBaseDimensions = CGRectMake(0, 0, 128, 128);
    CGRect jumpButtonDimensions = CGRectMake(0, 0, 64, 64);
    CGRect attackButtonDimensions = CGRectMake(0, 0, 64, 64);
    
    CGPoint joystickBasePosition;
    CGPoint jumpButtonPosition;
    CGPoint attackButtonPosition;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        CCLOG(@"Positioning joystick and buttons for ipad");
        joystickBasePosition = ccp(screenSize.width*0.0625f, screenSize.height*0.052f);
        
        jumpButtonPosition = ccp(screenSize.width*0.946f, screenSize.height * 0.052f);
        
        attackButtonPosition = ccp(screenSize.width*0.947f, screenSize.height*0.169f);
        
    }else{
        CCLOG(@"Positioning joystick and buttons for iphone");
        joystickBasePosition = ccp(screenSize.width*0.07f , screenSize.height*0.11f);
        
        jumpButtonPosition = ccp(screenSize.width*0.93f, screenSize.height * 0.11f);
        
        attackButtonPosition = ccp(screenSize.width*0.93f, screenSize.height*0.35f);
    }
    
    SneakyJoystickSkinnedBase *joystickBase = [[[SneakyJoystickSkinnedBase alloc]init] autorelease];
    joystickBase.position = joystickBasePosition;
    joystickBase.backgroundSprite = [CCSprite spriteWithFile:@"dpadDown.png"];
    joystickBase.thumbSprite = [CCSprite spriteWithFile:@"joystickDown.png"];
    joystickBase.joystick = [[SneakyJoystick alloc]initWithRect:joystickBaseDimensions];
    leftJoyStick = [joystickBase.joystick retain];
    [self addChild:joystickBase];
    
    SneakyButtonSkinnedBase *jumpButtonBase = [[[SneakyButtonSkinnedBase alloc] init] autorelease];
    jumpButtonBase.position = jumpButtonPosition;
    jumpButtonBase.defaultSprite = [CCSprite spriteWithFile:@"jumpUp.png"];
    jumpButtonBase.activatedSprite  =[CCSprite spriteWithFile:@"jumpDown.png"];
    jumpButtonBase.pressSprite  =[CCSprite spriteWithFile:@"jumpDown.png"];
    jumpButtonBase.button = [[SneakyButton alloc] initWithRect:jumpButtonDimensions];
    jumpButton = [jumpButtonBase.button retain];
    jumpButton.isToggleable = NO;
    [self addChild:jumpButtonBase];
    
    SneakyButtonSkinnedBase *attackButtonBase = [[[SneakyButtonSkinnedBase alloc] init] autorelease];
    attackButtonBase.position = attackButtonPosition;
    attackButtonBase.defaultSprite = [CCSprite spriteWithFile:@"handUp.png"];
    attackButtonBase.activatedSprite  =[CCSprite spriteWithFile:@"handDown.png"];
    attackButtonBase.pressSprite  =[CCSprite spriteWithFile:@"handDown.png"];
    attackButtonBase.button = [[SneakyButton alloc] initWithRect:attackButtonDimensions];
    attackButton = [attackButtonBase.button retain];
    attackButton.isToggleable = NO;
    [self addChild:attackButtonBase];
    
}

-(void)applyJoystick:(SneakyJoystick *)aJoyStick toNode:(CCNode *)tempNode forTimeDelta:(float)deltaTime{
    
    CGPoint scaledVelocity = ccpMult(aJoyStick.velocity, 1024.0f);
    
    CGPoint newPosition = ccp(tempNode.position.x+scaledVelocity.x*deltaTime, tempNode.position.y+scaledVelocity.y*deltaTime);
    
    [tempNode setPosition:newPosition];
    
    if (jumpButton.active == YES) {
        CCLOG(@"Jump button is pressed.");
    }
    
    if (attackButton.active == YES) {
        CCLOG(@"Attack Button is pressed.");
    }
    
}

#pragma mark-
#pragma mark Update method
-(void) update:(ccTime)deltaTime{
    [self applyJoystick:leftJoyStick toNode:vikingSprite forTimeDelta:deltaTime];
}

-(id)init{
    self = [super init];
    if (self != nil) {
        
        CGSize screenSize = [CCDirector sharedDirector].winSize;
        
        self.isTouchEnabled = YES;
        
        //vikingSprite = [CCSprite spriteWithFile:@"sv_anim_1.png"];
        
        CCSpriteBatchNode *chapter2SpriteBatchNode;
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
            [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"scene1atlas.plist"];
            chapter2SpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"scene1atlas.png"];
        }else{
            [[CCSpriteFrameCache sharedSpriteFrameCache]addSpriteFramesWithFile:@"scene1atlasiPhone.plist"];
            chapter2SpriteBatchNode = [CCSpriteBatchNode batchNodeWithFile:@"scene1atlasiPhone.png"];
        }
        
        vikingSprite = [CCSprite spriteWithSpriteFrameName:@"sv_anim_1.png"];
        [chapter2SpriteBatchNode addChild:vikingSprite];
        [self addChild:chapter2SpriteBatchNode];
        
        [vikingSprite setPosition:
         CGPointMake(screenSize.width/2, 
                     screenSize.height*0.17f)];
        
        //[self addChild:vikingSprite];
        [self initJoystickAndButtons];
        [self scheduleUpdate];

        
        if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad) {
            
            [vikingSprite setScaleX:screenSize.width/1024.0f];
            [vikingSprite setScaleY:screenSize.height/768.0f];
        }
        
        
        
    }
    
    return self;
}

@end

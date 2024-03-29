//
//  HelloWorldLayer.m
//  LuaTestProject
//
//  Created by Kevin Jenkins on 4/30/12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import <UIKit/UIKit.h>

#import "KKConfig.h"
#import "kkLuaInitScript.h"
#import "KKLua.h"


// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
        wax_setup();
        
        [KKLua doString:kLuaInitScript];
        [KKLua doString:kLuaInitScriptPlatformSpecific];
        
        [KKConfig loadConfigLua];
        
        NSDictionary *dict = [KKConfig dictionaryForKey:@"testEntry"];
        [KKConfig selectKeyPath:@"testEntry.subObject.subObject2"];
        CGRect r = [KKConfig rectForKey:@"aRect"];
        NSLog(@"Dict: %@", dict);
        NSLog(@"Rect: %@", NSStringFromCGRect(r));
        
		// add the label as a child to this Layer
		[self addChild: label];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end

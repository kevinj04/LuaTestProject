//
//  RectScene.m
//  LuaTestProject
//
//  Created by Kevin Jenkins on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RectScene.h"
#import "KKLua.h"
#import "KKConfig.h"
#import "kkLuaInitScript.h"
#import "MagicRect.h"

@implementation RectScene

- (id) init {
    if (( self = [super init])) {
        
        counter = 3.0;
        
        wax_setup();
        
        [KKLua doString:kLuaInitScript];
        [KKLua doString:kLuaInitScriptPlatformSpecific];
        
        [KKConfig loadConfigLua];        
        return self;
    }
    return nil;
}
+ (id) scene {
    return [[[RectScene alloc] init] autorelease];
}
- (void) dealloc {
    [rects release];
    [super dealloc];
}


- (void) onEnterTransitionDidFinish {
    [self schedule:@selector(update:) interval:.005];
}

- (void) update:(ccTime) dt {
    
    counter -= dt;
    
    if (counter < 3.0) 
    { 
        [KKLua doFile:@"config.lua"];
        [KKConfig loadConfigLua];        
        NSDictionary *d = [KKConfig dictionaryForKey:@"testEntry"];
        NSLog(@"%@", d);
        counter = 3.0;
        
        [KKConfig selectKeyPath:@"testEntry.subObject.subObject2"];
        
        CGRect r = [KKConfig rectForKey:@"aRect"];
        float duration  = [KKConfig floatForKey:@"aRect.duration"];
        MagicRect *mr = [MagicRect magicWithRect:r andTime:duration];
        [self addChild:mr];
    }

}

@end

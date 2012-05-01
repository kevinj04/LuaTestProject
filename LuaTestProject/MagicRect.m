//
//  MagicRect.m
//  LuaTestProject
//
//  Created by Kevin Jenkins on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MagicRect.h"
#import "cocos2d.h"

@implementation MagicRect

- (id) initWithRect:(CGRect) r andTime:(ccTime) t {
    
    if (( self = [super init] )) {
        
        rect = r;
        [self performSelector:@selector(kill) withObject:nil afterDelay:t];
        
        return self;
    }
    
    return nil;
    
}
+ (id) magicWithRect:(CGRect) r andTime:(ccTime) t {
    return [[[MagicRect alloc] initWithRect:r andTime:t] autorelease];
}

- (void) draw {
    [self drawRect:rect];
}

- (void) kill {
    [self removeFromParentAndCleanup:YES];
    
}

- (void) drawRect:(CGRect) r {
    
    float width = r.size.width;
    float height = r.size.height;
    
    CGPoint ll = CGPointMake(r.origin.x, r.origin.y);
    CGPoint lr = CGPointMake(r.origin.x+width , r.origin.y);
    CGPoint ul = CGPointMake(r.origin.x, r.origin.y+height);
    CGPoint ur = CGPointMake(r.origin.x+width, r.origin.y+height);
    
    ccDrawLine(ul, ur);
    ccDrawLine(ll, lr);
    ccDrawLine(ul, ll);
    ccDrawLine(ur, lr);
}
@end

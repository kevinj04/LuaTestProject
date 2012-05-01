//
//  MagicRect.h
//  LuaTestProject
//
//  Created by Kevin Jenkins on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCNode.h"

@interface MagicRect : CCNode {
    
    CGRect rect;
    
}

- (id) initWithRect:(CGRect) r andTime:(ccTime) t;
+ (id) magicWithRect:(CGRect) r andTime:(ccTime) t;

- (void) draw;
- (void) kill;
- (void) drawRect:(CGRect) r;

@end

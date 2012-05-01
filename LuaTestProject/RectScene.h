//
//  RectScene.h
//  LuaTestProject
//
//  Created by Kevin Jenkins on 4/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CCScene.h"

@interface RectScene : CCScene {
    
    NSMutableSet *rects;
    
    ccTime counter;
    
}

- (id) init;
+ (id) scene;
- (void) dealloc;
- (void) update:(ccTime) dt;

@end

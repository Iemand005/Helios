//
//  Helios.h
//  Helios
//
//  Created by Lasse Lauwerys on 28/03/24.
//  Copyright (c) 2024 Lasse Lauwerys. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "HeliosView.h"

@interface Particle : NSObject

@property rsVec pos;
@property float *rgb;
@property float size;

@end

@interface Emitter : Particle
@property rsVec oldpos;
@property rsVec targetpos;

- (void) setTargetpos:(rsVec)targetpos;
- (void) interpolatePosition:(float)n;
    inline void interppos(float n) {};
@end

@interface Ion : Particle

@property float speed;

- (id) initWithParameters:(myParameters*)p;
- (void) start:(myParameters) p;
- (void) update:(myParameters) p;
- (void) draw:(myParameters) p;

@end
//
//  Helios.m
//  Helios
//
//  Created by Lasse Lauwerys on 28/03/24.
//  Copyright (c) 2024 Lasse Lauwerys. All rights reserved.
//

#import "Helios.h"

@implementation Particle

- (id) init {
    self.rgb = new float[3];
    return self;
}

@end

@implementation Emitter

- (id) init {
//    self.pos = rsVec(Rando)
    self.pos = rsVec(float(random()) / INT_MAX * 1000.0f - 500.0f, float(random()) / INT_MAX * 1000.0f - 500.0f, float(random()) / INT_MAX * 1000.0f - 500.0f);
}

- (void) setTargetpos:(rsVec)targetpos {
    self.oldpos = self.pos;
    self.targetpos = targetpos;
}

- (void) interpolatePosition:(float)n {
    self.pos = self.oldpos * (1.0f - n) + self.targetpos * n;
}

@end

@implementation Ion

- (id) initWithParameters:(myParameters*)p {
    float temp;
    
    self.pos = rsVec(0.0f, 0.0f, 0.0f);
    self.rgb[0] = self.rgb[1] = self.rgb[2] = 1.0f;
    self.temp = myRandf(2.0f) + 0.4f;
    self.size = float(p->dSize) * temp;
    self.speed = float(p->dSpeed) * 12.0f / temp;
}

- (void) start:(myParameters) p;
- (void) update:(myParameters) p;
- (void) draw:(myParameters) p;

@end
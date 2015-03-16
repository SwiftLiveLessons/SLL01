//
//  Fruit.m
//  Lesson5ObjC
//
//  Created by BJ on 2/20/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

#import "Fruit.h"

@implementation Fruit

- (instancetype)initWithName:(NSString *)name color:(NSString *)color calories:(NSNumber *)calories {
    
    if (self = [super init]) {
        _name = name;
        _color = color;
        _calories = calories;
    }
    
    return self;
    
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ %@ has %@ calories", self.color, self.name, self.calories];
}

@end

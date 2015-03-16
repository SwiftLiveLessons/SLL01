//
//  Cookie.m
//  Lesson5Swift
//
//  Created by BJ on 2/28/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

#import "Cookie.h"

@interface Cookie ()
@property (nonatomic, strong) NSNumber *cookieValue;
@end


@implementation Cookie

- (void)setMultiplier:(NSNumber *)multiplier {
    if (multiplier == nil) {
        _multiplier = @1;
    } else {
        _multiplier = multiplier;
    }
}

- (instancetype)initWithCookieValue:(NSNumber *)cv multiplier:(NSNumber *)multiplier {
    if (self = [super init]) {
        _cookieValue = cv;
        _multiplier = multiplier;
    }
    return self;
}

- (NSInteger)cookieIntegerValue {
    return self.cookieValue.integerValue * self.multiplier.integerValue;
}


@end

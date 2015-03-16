//
//  Cookie.h
//  Lesson5Swift
//
//  Created by BJ on 2/28/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cookie : NSObject

@property (nonatomic, strong, null_resettable) NSNumber *multiplier;

- (NSInteger)cookieIntegerValue;

- (nonnull instancetype)initWithCookieValue:(nonnull NSNumber *)cv multiplier:(nonnull NSNumber *)multiplier;

@end

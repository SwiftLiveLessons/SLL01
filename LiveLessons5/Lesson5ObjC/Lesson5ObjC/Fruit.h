//
//  Fruit.h
//  Lesson5ObjC
//
//  Created by BJ on 2/20/15.
//  Copyright (c) 2015 Six Five Software, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fruit : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) NSNumber *calories;

- (instancetype)initWithName:(NSString *)name color:(NSString *)color calories:(NSNumber *)calories;

@end

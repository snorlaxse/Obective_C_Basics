//
//  Person.m
//  自定义构造方法
//
//  Created by Captain on 05/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

- (id)init
{
    if (self = [super init])
    {
        _name = @"Captain";
    }
    return self;
}

- (id)initWithName:(NSString *)name
{
    if (self = [super init])
    {
        _name = name;
    }
    return self;
}

- (id)initWithAge:(int)age
{
    if (self = [super init])
    {
        _age = age;
    }
    return self;
}

- (id)initWithName:(NSString *)name andAge:(int)age
{
    if (self = [super init])
    {
        _name = name;
        _age = age;
    }
    return self;
}
@end

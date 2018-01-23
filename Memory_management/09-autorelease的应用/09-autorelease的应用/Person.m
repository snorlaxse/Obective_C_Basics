//
//  Person.m
//  09-autorelease的应用
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (id)person
{
    return [[[self alloc] init] autorelease];
}

+ (id)personWithAge:(int)age
{
    Person *p = [self person];
    p.age = age;
    return p;
}

- (void)dealloc
{
    NSLog(@"%d岁的人被销毁了",_age);
    
    [super dealloc];
}

@end

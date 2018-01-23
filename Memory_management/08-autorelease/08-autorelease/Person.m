//
//  Person.m
//  08-autorelease
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"Person对象被销毁");
    [super dealloc];
}

@end

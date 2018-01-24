

//
//  Dog.m
//  03-ARC的循环引用
//
//  Created by Captain on 23/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Dog.h"

@implementation Dog

- (void)dealloc
{
    NSLog(@"Dog --- dealloc");
}

@end

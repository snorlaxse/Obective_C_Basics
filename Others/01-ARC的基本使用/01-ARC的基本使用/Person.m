
//
//  Person.m
//  01-ARC的基本使用
//
//  Created by Captain on 23/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Person.h"

@implementation Person


- (void)dealloc
{
    NSLog(@"Person is dealloc");
    
    //[super dealloc];
}

@end

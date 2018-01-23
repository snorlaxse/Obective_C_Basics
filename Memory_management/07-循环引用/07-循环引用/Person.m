//
//  Person.m
//  07-循环引用
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Person.h"
#import "Card.h"

@implementation Person

- (void)dealloc
{
    
    NSLog(@"Person对象被销毁了");
    
    [_card release];
    
    [super dealloc];
}
@end

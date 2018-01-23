//
//  Card.m
//  07-循环引用
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Card.h"
#import "Person.h"

@implementation Card

- (void)dealloc
{
    
    NSLog(@"Card被销毁了");
    
    //[_person release];
    
    [super dealloc];
}
@end

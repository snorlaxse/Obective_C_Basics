//
//  Student.m
//  04-@property参数
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Student.h"

@implementation Student

- (void)dealloc
{
    [_book release];
    [_name release];
    
    [super dealloc];
}

@end

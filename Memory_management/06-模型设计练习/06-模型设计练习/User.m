//
//  User.m
//  06-模型设计练习
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "User.h"

@implementation User

- (void)dealloc
{
    [_name release];
    [_account release];
    [_password release];
    [_icon release];
    [_phone release];
    
    [super dealloc];
}

@end

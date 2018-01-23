//
//  Person.m
//  04-@property参数
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Person.h"

@implementation Person

//- (void)setBook:(Book *)book
//{
//    if (_book != book)
//    {
//        [_book release];
//
//        _book = [book retain];
//
//    }
//}


- (void)dealloc
{
    [_book release];
    [_name release];
    [super dealloc];
}
@end

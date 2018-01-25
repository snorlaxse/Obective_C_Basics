//
//  Person.m
//  07-协议的应用-代理模式
//
//  Created by Captain on 25/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Person.h"

@implementation Person


// 买电影票
- (void)buyTickets
{
    // 叫代理去帮自己买票(询问一下票价、询问一下票的剩余票数)
    double price = [_delegate ticketPrice];
    int number = [_delegate leftTicketsNumber];
    
    NSLog(@"通过代理的帮忙,票价为%f,还剩%d张票",price,number);
}

@end

//
//  TicketDelegate.h
//  07-协议的应用-代理模式
//
//  Created by Captain on 25/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>


// 声明一些跑腿的方法
@protocol TicketDelegate <NSObject>


// 返回票价
- (double) ticketPrice;

// 剩余票数
- (int) leftTicketsNumber;

@end

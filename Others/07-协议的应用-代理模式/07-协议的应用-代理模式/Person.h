//
//  Person.h
//  07-协议的应用-代理模式
//
//  Created by Captain on 25/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TicketDelegate.h"

@interface Person : NSObject


- (void)buyTickets;

// 拥有一个代理属性
// id - 代理的类型随便，必须遵守TicketDelegate协议
@property (nonatomic,strong) id<TicketDelegate> delegate;

@end

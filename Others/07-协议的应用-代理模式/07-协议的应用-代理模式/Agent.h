//
//  Agent.h
//  07-协议的应用-代理模式
//
//  Created by Captain on 25/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

// 负责询问电影票情况的代理

#import <Foundation/Foundation.h>
#import "TicketDelegate.h"

@interface Agent : NSObject <TicketDelegate>



@end

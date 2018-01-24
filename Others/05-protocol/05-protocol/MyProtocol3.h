//
//  MyProtocol3.h
//  05-protocol
//
//  Created by Captain on 24/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyProtocol.h"

// 一个协议遵守了另一个协议，就可以拥有另一个协议的所有方法声明
@protocol MyProtocol3 <NSObject,MyProtocol>

- (void) hehehe;

@end

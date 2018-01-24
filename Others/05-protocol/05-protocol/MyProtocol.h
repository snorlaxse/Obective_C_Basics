//
//  MyProtocol.h
//  05-protocol
//
//  Created by Captain on 24/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

// 定义了一个名叫MyProtocol的协议
@protocol MyProtocol <NSObject>


// @required 要求实现，不实现就会发出警告（默认）
// @optional 不要求实现

- (void) test4;

@required
- (void) test;
- (void) test2;


@optional
- (void) test3;

@end

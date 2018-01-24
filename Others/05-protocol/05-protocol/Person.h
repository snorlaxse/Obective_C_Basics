//
//  Person.h
//  05-protocol
//
//  Created by Captain on 24/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

// 只要一个类遵守了某一份协议，就能拥有这份协议中的所有方法声明

// : 继承
// <> 遵守协议

#import <Foundation/Foundation.h>

//#import "MyProtocol2.h"
//#import "MyProtocol3.h"

@class  Hashiqi;

@protocol MyProtocol2;

@protocol MyProtocol3;

@interface Person : NSObject <MyProtocol2, MyProtocol3>

@property (nonatomic,strong) id<MyProtocol2> obj; 

@property (nonatomic,strong)  Hashiqi *dog;

@end

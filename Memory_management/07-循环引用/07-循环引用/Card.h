//
//  Card.h
//  07-循环引用
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

// 仅仅告诉编译器，Person是一个类
@class Person;

@interface Card : NSObject

@property (nonatomic,assign) Person *person;

@end

//
//  Dog.h
//  03-ARC的循环引用
//
//  Created by Captain on 23/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface Dog : NSObject

@property (nonatomic,weak) Person *person;

@end

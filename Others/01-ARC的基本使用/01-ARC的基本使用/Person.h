//
//  Person.h
//  01-ARC的基本使用
//
//  Created by Captain on 23/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Dog;

@interface Person : NSObject

@property (nonatomic,strong) Dog *dog;
// 即Person成员变量_dog用强指针

//@property (nonatomic,weak) Dog *dog;
// 即Person成员变量_dog用弱指针

@property (nonatomic,strong) NSString *name;

@property (nonatomic,assign) int age;

@end

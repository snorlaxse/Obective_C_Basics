//
//  Person.h
//  05-@property参数
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 1. 内存管理相关的参数
 * retain : release 旧值， retain新值(适用于OC对象类型 )
 * assign : 直接赋值(默认,适用于非OC对象类型)
 * copy   : release旧值，copy新值
 
 2.是否要生成set方法
 * readwrite : 同时生成setter和getter的声明、实现(默认)
 * readonly  : 只会生成getter的声明、实现
 
 3.多线程管理
 * nonatomic : 性能高(一般就用这个)
 * atomic    : 性能低(默认)
 
 4.setter和getter方法的名称
 * setter : 决定了set方法的名称，一定要有个冒号 :
 * getter : 决定了get方法的名称(一般使用在BOOL类型)
 
 * getter=abc,setter=setAbc: 只影响方法名，不影响成员变量名 _abc
 
 */
@interface Person : NSObject

// 返回BOOL类型的方法名一般以is开头
@property (getter=isRich) BOOL rich;



@property (nonatomic,assign,readwrite) int weight;
//setWeight:
// weight


//
@property (readwrite,assign) int height; // setHeight:  height

@property (nonatomic ,assign)  int age;

@property (retain) NSString *name;

@end

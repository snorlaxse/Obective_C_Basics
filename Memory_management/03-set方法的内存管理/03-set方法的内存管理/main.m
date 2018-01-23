//
//  main.m
//  03-set方法的内存管理
//
//  Created by Captain on 21/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Dog.h"
#import "Person.h"
#import "Student.h"

/*
 内存管理代码规范：
 1.只要调用了alloc，必须有release(autorelease)
    如果对象不是通过alloc产生的，就不需要release
 
 2.set方法的代码规范：
 1> 基本数据类型：直接复制
 - (void)setAge:(int)age
 {
    _age = age;
 }
 
 2> OC对象类型
 - (void)setCar:(Car *)car
{
    // 1.先判断是不是新传进来对象
    if(car !=  _car)
 {
    // 2.对旧对象做一次release
    [_car release];
 
    // 3.对新对象做一次retain
    _car = [car retain];
 }
 }
 - (Car *)car
 {
 return _car;
 }
 
 3. dealloc方法的代码规范
 1> 一定要[super dealloc]，而且放在最后面
 2> 对self(当前)所拥有的其他对象做一次release
 - (void)dealloc
 {
 
    [_car release];
 
    [super dealloc];
 }
 */
int main(int argc, const char * argv[])
{
    Student *stu = [[Student alloc]init];
   
//    Car *c = [[Car alloc]init];
//    stu.car = c;

//    // 这行代码有内存泄漏
//    stu.c = [[Car alloc]init];
    
    // 这行代码有内存泄漏
//    [[Car alloc]init].speed = 100;
    
//    [c release];
    [stu release];
    return 0;
}

void test3()
{
    Student *stu = [[Student alloc]init];
    
    Car *c = [[Car alloc] init];
    stu.car = c;
    
    Dog *d = [[Dog alloc]init];
    stu.dog = d;
    
    stu.name = @"Micheal";
    // 不出现alloc，无须出现[s release];
    // 其中，NSString *s = @"Micheal";
    
    [d release];
    [c release];
    [stu release];
}

void test2()
{
    Person *p1 = [[Person alloc] init];
    p1.age = 20;
    
    Car *c1 = [[Car alloc]init];
    c1.speed = 100;
    p1.car = c1;
    
    Car *c2 = [[Car alloc]init];
    c2.speed = 200;
    p1.car = c2;
    
    [c1 release];
    [c2 release];
    [p1 release];
}

void test1()
{
    Person *p = [[Person alloc]init];
    p.age = 20;
    
    Car *c1 = [[Car alloc] init];
    c1.speed = 250;
    
    p.car = c1;
    [c1 release];
    
    
    p.car = c1;
    p.car = c1;
    p.car = c1;
    p.car = c1;
    
    
    [p release];
}

void test()
{
    Person *p = [[Person alloc]init];
    p.age = 20;
    
    Car *c1 = [[Car alloc] init];
    c1.speed = 250;
    
    // p想拥有c1
    p.car = c1; // [p setCar:c1];
    
    Car *c2 = [[Car alloc] init];
    c2.speed = 300;
    
    // p 将车换乘了c2
    p.car = c2;
    
    
    [c1 release];
    [c2 release];
    [p release];
    
}

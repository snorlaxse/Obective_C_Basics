//
//  main.m
//  05-protocol
//
//  Created by Captain on 24/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

/*
 1.协议的定义
 @protocol 协议名称 <NSObject>
 // 方法声明列表...
 @end
 
 2.如何遵守协议
 1> 类遵守协议
 @interface 类名 : 父类名 <协议名称1，协议名称2>
 
 @end
 
 2> 协议遵守协议
 @protocol 协议名称 <协议1, 协议2>
 
 @end
 
 3.协议中方法声明的关键字
 1> @required (默认)
    要求实现，若不实现，编译器会发出警告
 
 2> @optional
    不要求实现，怎样都不会有警告
 
 4.定义一个变量的时候，限制这个变量保存的对象遵守某个协议
 类名 <协议名称> *变量名;
 id <协议名称> 变量名;
 NSObject *obj;
 id<MyProtocol> obj2;
 
 如果没有遵守对应的协议，编译器会警告
 
 5. @property 中声明的属性也可用做一个遵守协议的限制
 @property (nonatomic,strong) 类名<协议名称> *属性名;
 @property (nonatomic,strong) id<协议名称> 属性名;

 @property (nonatomic,strong) Dog<MyProtocol> *dog;
 @property (nonatomic,strong) id<MyProtocol> dog2;
 
 6.协议可用定义在单独的.h文件中，也可以定义在某个类中
 1> 如果这个协议只用在某个类中，应该把协议定义在该类中
 
 2> 如果这个协议用在很多类中,就应该定义在单独文件中
 
 7.分类可用定义在单独的.h和.m文件中，也可以定义在原来类中
 1> 一般情况下，都是定义在单独文件
 2> 定义在原来类中的分类，只要求能看懂语法

 */
#import <Foundation/Foundation.h>
#import "MyProtocol2.h"
#import "MyProtocol3.h"
#import "Person.h"
#import "Dog.h"
#import "Hashiqi.h"

int main(int argc, const char * argv[])
{
    Person *p =[[Person alloc] init];
    
    p.obj = [[Hashiqi alloc] init];
    
    //int a;  // 会出现非严重警告
    
    //p.obj = [[NSObject alloc] init]; // 会出现严重警告
    
    return 0;
}


void test()
{
    //    NSObject *obj1 = [[NSObject alloc] init];
    
    //    NSObject *obj2 = @"123456";  // 多态
    
    // 要求obj3保存的对象必须是遵守MyProtocol协议
    
    //    NSObject<MyProtocol> *obj3 =  [[NSObject alloc] init];
    
    NSObject<MyProtocol> *obj3 =  [[Person alloc] init];
    
    obj3 = nil;
    
    id<MyProtocol> obj4 = [[Person alloc] init];
    
    obj4 = nil;
    
    
    // 要求obj5保存的对象必须是遵守MyProtocol3协议,并且继承了Person
    Person<MyProtocol3> *obj5 = [[Person alloc] init];
    
    obj5 = nil;
    
}

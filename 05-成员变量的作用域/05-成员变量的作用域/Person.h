//
//  Person.h
//  05-成员变量的作用域
//
//  Created by Captain on 2017/11/26.
//  Copyright © 2017年 captain. All rights reserved.
//

/*
 @public : 在任何地方都能直接访问对象的成员变量
 @private : 只能在当前类的对象方法中直接访问（@implementation中默认是@private）
 @protected: 可以在当前类及其子类的对象方法中直接访问（@interface中默认就是@protected）
 @package : 只要处在同一个框架中，就能直接访问对象的成员变量
 */
#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    //默认@protected
    int _no;
    
    @public  // 在任何地方都能直接访问对象的成员变量
    int _age;
    
    @private    //只能在当前类的对象方法中直接访问
    int _height;

    @protected  // 只能在当前类和子类的对象方法中直接访问
    int _weight;
}

- (void)setHeight:(int)height;
- (int)height;

- (void)test;
@end

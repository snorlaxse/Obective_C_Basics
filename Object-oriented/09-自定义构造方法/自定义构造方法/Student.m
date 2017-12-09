//
//  Student.m
//  自定义构造方法
//
//  Created by Captain on 05/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "Student.h"

@implementation Student

-(id)initWithNo:(int)no
{
    if (self = [super init])
    {
        _no = no;
    }
    return self;
}

//- (id)initWithName:(NSString *)name andAge:(int)age andNo:(int)no
//{
//    if (self = [super init])
//    {
//        //[self setName:name];
//        //[self setAge:age];
//        self.name = name;
//        self.age = age;

//        _no = no;
//    }
//
//    return self;
//}

- (id)initWithName:(NSString *)name andAge:(int)age andNo:(int)no
{
    //将name和age传递给父类的方法中进行初始化
    //自己初始化自己的成员变量
    //子类与父类的初始化分开实现，当父类改变成员变量名称时，子类方法无需更改
    if (self = [super initWithName:name andAge:age])
    {
        _no = no;
    }
    return self;
}

@end

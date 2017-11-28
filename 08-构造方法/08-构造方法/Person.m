//
//  Person.m
//  08-构造方法
//
//  Created by Captain on 2017/11/28.
//  Copyright © 2017年 captain. All rights reserved.
//

#import "Person.h"

@implementation Person


//重写-init方法
//- (id)init
//{
//
//    //1.一定要调用回super的init方法：初始化父类中声明的一些成员变量和其他
//    self = [super init];   // 当前对象 self
//
//    //2.如果对象初始化成功，才有必要进行接下来的初始化
//    if (self != nil)
//    {
//        //初始化成功
//        _age = 10 ;
//    }
//
//    //3.返回一个已经初始化完毕的对象
//    return self;
//}


- (id)init
{

    if (self = [super init])
    {
        //初始化成功
        _age = 10 ;
    }

    //3.返回一个已经初始化完毕的对象
    return self;
}


@end

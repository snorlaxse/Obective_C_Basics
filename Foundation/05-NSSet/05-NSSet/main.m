//
//  main.m
//  05-NSSet
//
//  Created by Captain on 27/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

/*
 NSSet和NSArray的对比:
 1> 共同点
 * 都是集合，都能存放多个OC对象
 * 只能存放OC对象，不能存放非OC对象类型(基本数据类型: int\char\float等，结构体，枚举)
 * 本身都不可变，都有一个可变的子类
 
 2> 不同点
 * NSArray有顺序，NSSet没有顺序
 
 */

#import <Foundation/Foundation.h>


int main(int argc, const char * argv[])
{
    NSMutableSet *s = [NSMutableSet set];
    
    // 添加元素
    [s addObject:@"Hadoop"];
    [s addObject:@"Spark"];
    
    // 删除元素
    //[s removeAllObjects];
    //[s removeObject:@"Hadoop"];
    
    NSLog(@"%@",s);
    
    return 0;
}

// NSSet的基本使用
void test()
{
    NSSet *s = [NSSet set];
    
    NSSet *s2 = [NSSet setWithObjects:@"Captain",@"Micheal",@"Jack",@"Hahaha", nil];
    
    // NSLog(@"%@",s2);
    
    // 随机取出一个元素
    NSString *str = [s2 anyObject];
    
    NSLog(@"%@",str);
    
}

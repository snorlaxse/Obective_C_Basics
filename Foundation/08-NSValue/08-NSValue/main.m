//
//  main.m
//  08-NSValue
//
//  Created by Captain on 28/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

// NSNumber 之所以能包装基本数据类型为对象，是因为继承了NSValue

int main(int argc, const char * argv[])
{
    // 结构体 ---> OC 对象
    
    CGPoint p = CGPointMake(10, 10);
    
    // 将结构体转换为Value对象
    NSValue *value = [NSValue valueWithPoint:p];
    
    // 将value转换为相应的结构体
    //[value pointerValue];
    
    NSArray *array = @[value];
    
    
    
    return 0;
}

//
//  main.m
//  07-NSNumber
//
//  Created by Captain on 27/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    // @20 将 20 包装成一个NSNumber对象
    
    NSArray *persons = @[
                @{@"name" : @"Captain", @"age" : @20 }, // [NSNumber numberWithInteger:20] == @20
                @{@"name" : @"Micheal", @"age" : @21},
                @{@"name" : @"Jack",    @"age" : @22},
                @{@"name" : @"Rose",    @"age" : @23}
        ];
    
    // 将各种基本数据类型包装成NSNumber对象
    @10.5;
    @YES;
    @'A';     // NSNumber对象
    
    @"A";   // NSString对象
    
    
    // 将age变量包装成NSNumber对象
    int age = 10;
    @(age);     // [NSNumber numberWithInt:age];
    
    
    NSNumber *n = [NSNumber numberWithDouble:10.5];
    
    int d = [n doubleValue];
    
    
    int a = 20;
    
    // @"20"
    NSString *str = [NSString stringWithFormat:@"%d",a];
    
    NSLog(@"%d",[str intValue]);
    
    return 0;
}

void test()
{
    NSNumber *num = [NSNumber numberWithInteger:10];
    
    NSDictionary *dict = @{ @"name" : @"Captain", @"age": num };
    
    NSNumber *num2 = dict[@"age"];
    
    NSLog(@"%@",num2);
    
    int a = [num2 intValue];
    
    NSLog(@"%d",a);
}

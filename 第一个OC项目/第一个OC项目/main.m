//
//  main.m
//  第一个OC项目
//
//  Created by Captain on 2017/11/25.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Student.h"


int main()
{
    NSLog(@"2333333");
    
    int a =10;
    
    int b = a;
    b = 10;
    
    Student *stu = [Student new];
    [stu setAge:10];
    
    int c = [stu age];
    NSLog(@"age is %d",c);
    
    return 0;
}

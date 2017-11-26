//
//  main.m
//  第2个OC项目
//
//  Created by Captain on 2017/11/25.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


int main(int argc, const char * argv[])
{
   
    Person *p = [Person new];
    //p->_age = 10;  //需要public成员变量
    [p setAge:10];
    
    int a = [p age];
    
    NSLog(@"年龄是%d",a);
    
    return 0;
}

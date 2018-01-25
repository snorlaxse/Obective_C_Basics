//
//  main.m
//  07-协议的应用-代理模式
//
//  Created by Captain on 25/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Agent.h"
#import "NextAgent.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool 
    {
        Person *p = [[Person alloc] init];
        
        NextAgent *a = [[NextAgent alloc] init];
        
        p.delegate = a;
        
        [p buyTickets]; 

    }
    return 0;
}


void test()
{
    // 人
    Person *p = [[Person alloc] init];
    // 代理
    Agent *a = [[Agent alloc] init];
    
    // 设置人的代理
    p.delegate = a;
    
    // 人打算看电影
    [p buyTickets];
    
}

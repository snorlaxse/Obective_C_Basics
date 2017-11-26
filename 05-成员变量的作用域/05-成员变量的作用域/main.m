//
//  main.m
//  05-成员变量的作用域
//
//  Created by Captain on 2017/11/26.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {

        Person *p =[Person new];
        
        p->_age = 10;
        
//        p->_height = 20;
        
//        p->_weight = 100;
        
    }
    return 0;
}

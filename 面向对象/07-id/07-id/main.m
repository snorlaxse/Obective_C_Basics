//
//  main.m
//  07-id
//
//  Created by Captain on 2017/11/28.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [Person new];
        
        NSObject *o = [Person new];
        
        //id == NSObject *
        //万能指针，能指向\操作任何OC对象，内部含有*
        id d = [Person new];
        
        [d setAge:10];
        
        [d setObj:@"1234567"];
        
        NSLog(@"%d",[d age]);
        
    }
    return 0;
}

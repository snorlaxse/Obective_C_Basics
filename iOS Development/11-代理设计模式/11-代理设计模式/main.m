//
//  main.m
//  11-代理设计模式
//
//  Created by Captain on 10/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Baby.h"
#import "Nurse.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool 
    {
        // 护士
        Nurse *n = [[Nurse alloc] init];
        
        // 学生
        Student *s = [[Student alloc] init];
        
        // 婴儿
        Baby *b = [[Baby alloc] init];
        b.age = 1;
        //b.nanny = n;
        b.nanny = s;
        
        
        [b sleep];
        
    }
    return 0;
}

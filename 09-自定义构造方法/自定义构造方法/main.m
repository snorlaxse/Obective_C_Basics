//
//  main.m
//  自定义构造方法
//
//  Created by Captain on 05/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
      
        Person *p1 = [[Person alloc] init];
        
        Person *p2 = [[Person alloc] initWithName:@"Jack"];
        
        Person *p3 = [[Person alloc] initWithAge:10];
        
        Person *p4 = [[Person alloc] initWithName:@"Michael" andAge:20];
        
        Student *Stu1 = [[Student alloc] initWithNo:25];
        Student *Stu2 = [[Student alloc] initWithName:@"Jim" andAge:29 andNo:10];
        
        NSLog(@"\n p1 name:%@\n p2 name:%@\n p3 age:%d\n p4 name:%@ age:%d\n",[p1 name],[p2 name],[p3 age],[p4 name],[p4 age]);
        
        NSLog(@"\n Stu1 name:%@ age:%d no:%d\n Stu2 name:%@ age:%d no:%d",[Stu1 name],[Stu1 age],[Stu1 no],[Stu2 name],[Stu2 age],[Stu2 no]);
        
    }
    return 0;
}

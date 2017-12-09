//
//  main.m
//  06-@property和@synthesize
//
//  Created by Captain on 2017/11/27.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        Person *p = [Person new];
        [p setAge:10];
        
        [p test];
        */
        
        /*
        Car *c = [Car new];
        
        c.speed = 100;
        
        [c test];
//        NSLog(@"%d",c.speed);
         */
        
        Dog *d = [Dog new];
        d.age = 5;
        NSLog(@"%d",d.age);
        
    }
    return 0;
}

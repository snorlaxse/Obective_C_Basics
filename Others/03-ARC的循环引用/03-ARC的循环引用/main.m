//
//  main.m
//  03-ARC的循环引用
//
//  Created by Captain on 23/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//
/*
 当两端循环引用的时候，解决方案:
 1> ARC
 1端用strong，另1端用weak
 
 2> 非ARC
  1端用retain，另1端用assign
 */
#import <Foundation/Foundation.h>
#import "Person.h"
#import "Dog.h"

int main(int argc, const char * argv[])
{
    Dog *d = [[Dog alloc] init];
    
    Person *p = [[Person alloc] init];
    
    p.dog = d;
    
    d.person = p;
    
    return 0;
}

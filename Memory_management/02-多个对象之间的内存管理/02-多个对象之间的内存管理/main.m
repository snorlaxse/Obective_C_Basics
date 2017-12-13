//
//  main.m
//  02-多个对象之间的内存管理
//
//  Created by Captain on 13/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Book.h"

int main(int argc, const char * argv[]) {
    Book *b = [[Book alloc] init];
    
    Person *p1 = [[Person alloc] init];
    
    [b release];
    b = nil;
    
    // p1想占有b这本书
    [p1 setBook:b];
    
    [p1 release];
    p1 = nil;
    
    return 0;
}
 

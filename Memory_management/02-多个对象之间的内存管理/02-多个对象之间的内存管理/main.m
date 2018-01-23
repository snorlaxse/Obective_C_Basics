//
//  main.m
//  02-多个对象之间的内存管理
//
//  Created by Captain on 13/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//
/**
 1. 你想使用(占用)某个对象，就应该让对象的计数器+1 (让对象做一次retain操作)
 2.你不想再使用(占用)某个对象，就应该让对象的计数器-1(让对象做一次release)
 3.谁retain，谁release
 4.谁alloc，谁release
 */
#import <Foundation/Foundation.h>
#import "Person.h"
#import "Book.h"

int main(int argc, const char * argv[]) {
    
    Book *b = [[Book alloc] init]; // 有alloc 必有release
    
    Person *p1 = [[Person alloc] init];
    

    // p1想占有b这本书
    [p1 setBook:b];
    
    [b release]; // release 仅完成计数器－1操作 并非释放
    b = nil;
    
    [p1 release];
    p1 = nil;
   
    return 0;
}
 

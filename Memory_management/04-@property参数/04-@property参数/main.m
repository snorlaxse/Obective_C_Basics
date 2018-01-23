//
//  main.m
//  04-@property参数
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "Person.h"

int main(int argc, const char * argv[]) {
    
    Person *p = [[Person alloc]init];
    
    Book *b = [[Book alloc]init];
    
    p.book = b;
    
    NSLog(@"%ld",[b retainCount]);
    
    [b release];
    [p release];
    return 0;
}

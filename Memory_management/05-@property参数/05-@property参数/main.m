//
//  main.m
//  05-@property参数
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[])
{
    Person *p = [[Person alloc]init];
    
    p.rich = YES;
//    [p setRich:YES];
    
    NSLog(@"%d", p.isRich);
    
    
    return 0;
}

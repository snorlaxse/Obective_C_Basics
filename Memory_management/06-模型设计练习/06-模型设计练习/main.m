//
//  main.m
//  06-模型设计练习
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import "Status.h"

int main(int argc, const char * argv[])
{
    // 新建2个用户
    User *u = [[User alloc] init];
    u.name = @"2B";
    
    User *u2 = [[User alloc] init];
    u2.name = @"NB";
    
    // 新建2条微博
    Status *s = [[Status alloc] init];
    s.text = @"今天天气真好";
    s.user = u;
    
    Status *s2 = [[Status alloc]  init];
    s2.text = @"今天天气真的很好";
    s2.retweetStatus = s;
    s2.user = u2;

  
    [u release];
    [u2 release];
    [s release];
    [s2 release];
    return 0;
}

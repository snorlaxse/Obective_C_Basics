//
//  Babe.m
//  11-代理设计模式
//
//  Created by Captain on 10/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Baby.h"
#import "Nurse.h"

@implementation Baby

- (void)hungry
{
    NSLog(@"%d岁的baby饿了",_age);
    
    // 通知保姆
    [_nanny babyHungry:self];
}

- (void)cry
{
    NSLog(@"%d岁的baby哭了",_age);
    
    // 通知保姆
    [_nanny babyCry:self];

    
}

- (void)sleep
{
    NSLog(@"%d岁的baby想睡觉",_age);
    
    // 通知保姆
    [_nanny babySleep:self];
}
@end

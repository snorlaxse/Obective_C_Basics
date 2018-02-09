//
//  Student.m
//  11-代理设计模式
//
//  Created by Captain on 10/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Student.h"
#import "Baby.h"

@implementation Student


- (void)babyHungry:(Baby *)baby
{
    NSLog(@"学生正在喂%d岁的Baby",baby.age);
}

- (void)babyCry:(Baby *)baby
{
    NSLog(@"学生正在安抚%d岁的Baby",baby.age);
}

- (void)babySleep:(Baby *)baby
{
    NSLog(@"学生正在哄%d岁的Baby睡觉",baby.age);
}


@end

//
//  Nurse.m
//  11-代理设计模式
//
//  Created by Captain on 10/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Nurse.h"
#import "Baby.h"

@implementation Nurse

- (void)babyHungry:(Baby *)baby
{
    NSLog(@"护士正在喂%d岁的Baby",baby.age);
}

- (void)babyCry:(Baby *)baby
{
    NSLog(@"护士正在安抚%d岁的Baby",baby.age);
}

- (void)babySleep:(Baby *)baby
{
    NSLog(@"护士正在哄%d岁的Baby睡觉",baby.age);
}

@end

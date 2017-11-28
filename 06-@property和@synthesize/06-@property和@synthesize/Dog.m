//
//  Dog.m
//  06-@property和@synthesize
//
//  Created by Captain on 2017/11/28.
//  Copyright © 2017年 captain. All rights reserved.
//

#import "Dog.h"

@implementation Dog


//默认实现age，而非_age
//如果没有age,就会自动生成@private类型的age实现
@synthesize  age;


@end

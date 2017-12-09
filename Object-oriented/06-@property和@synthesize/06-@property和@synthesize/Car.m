//
//  Car.m
//  06-@property和@synthesize
//
//  Created by Captain on 2017/11/27.
//  Copyright © 2017年 captain. All rights reserved.
//

#import "Car.h"

@implementation Car

//@synthesize  speed = _speed,wheels = _wheels;

@synthesize speed = _speed;
@synthesize wheels = _wheels;

-(void)test
{
    NSLog(@"speed = %d",_speed);
}
@end

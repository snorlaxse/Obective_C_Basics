//
//  Car.h
//  06-@property和@synthesize
//
//  Created by Captain on 2017/11/27.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
//    int _speed;
//    int _wheels;
}

//会访问_speed这个成员变量，如果不存在，就会自动生成@private类型的_speed和_wheels变量
@property int speed;
@property int wheels;
//@property int speed, wheels;

- (void)test;

@end

//
//  Dog.h
//  06-@property和@synthesize
//
//  Created by Captain on 2017/11/28.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dog : NSObject
{
    int age;
    int _age;
}


//如果没有_age，默认生成@private类型的_age
@property int age;

@end

//
//  Person.h
//  03-set方法的内存管理
//
//  Created by Captain on 21/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
@interface Person : NSObject
{
    Car *_car;
    int _age;
}

- (void)setAge:(int)age;
- (int)age;


- (void)setCar:(Car *)car;
- (Car *)car;
@end

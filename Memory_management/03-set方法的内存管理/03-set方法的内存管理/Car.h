//
//  Car.h
//  03-set方法的内存管理
//
//  Created by Captain on 21/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject
{
    int _speed;
    
}


- (void)setSpeed:(int)speed;
- (int)speed;
@end

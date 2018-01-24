//
//  Person.h
//  03-ARC的循环引用
//
//  Created by Captain on 23/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>


@class Dog;

@interface Person : NSObject

@property (nonatomic,strong) Dog *dog;

@end

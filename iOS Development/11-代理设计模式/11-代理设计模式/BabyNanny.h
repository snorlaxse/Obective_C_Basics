//
//  BabyNanny.h
//  11-代理设计模式
//
//  Created by Captain on 10/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Baby;

@protocol BabyNanny <NSObject>

- (void)babyCry:(Baby *)baby;
- (void)babyHungry:(Baby *)baby;
- (void)babySleep:(Baby *)baby;

@end

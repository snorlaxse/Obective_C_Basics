//
//  Person.h
//  07-循环引用
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

// @class 仅仅是告诉编译器，Card是一个类
@class Card;

@interface Person : NSObject

@property (nonatomic,retain)  Card *card;

@end

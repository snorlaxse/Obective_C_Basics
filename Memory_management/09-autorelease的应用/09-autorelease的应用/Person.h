//
//  Person.h
//  09-autorelease的应用
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic,assign) int age;


+ (id)person;

+ (id)personWithAge:(int)age;
@end

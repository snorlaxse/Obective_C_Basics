//
//  Person.h
//  第2个OC项目
//
//  Created by Captain on 2017/11/25.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    int _age;
    NSString *_name;
}

//年龄的getter和setter方法
- (void)setAge:(int)age;
- (int)age;


- (void)setName:(NSString *)name;
- (NSString *)name;

@end

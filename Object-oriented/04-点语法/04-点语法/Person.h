//
//  Person.h
//  04-点语法
//
//  Created by Captain on 2017/11/26.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
    NSString *_name;
}

- (void)setAge:(int)age;
- (int)age;

- (void)setName:(NSString *)name;
- (NSString *)name;
@end

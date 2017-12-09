//
//  Person.h
//  06-@property和@synthesize
//
//  Created by Captain on 2017/11/27.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

{
    int _age;
//    int age;
    
    int _height;
    
    double _weight;
    
    NSString *_name;
}


//@property ：可以自动生成某个成员变量的setter和getter声明
@property int age;
//- (void)setAge:(int)age;
//- (int)age;


@property int height;
//- (void)setHeight:(int)height;
//- (int)height;

@property double weight;

@property NSString *name;


- (void)test;
@end

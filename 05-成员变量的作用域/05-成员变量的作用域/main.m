//
//  main.m
//  05-成员变量的作用域
//
//  Created by Captain on 2017/11/26.
//  Copyright © 2017年 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Student.h"

/*
 没有@interface，只有@implementation也可以开发一个类；不建议如此使用
 */
@implementation Car: NSObject
{
    @public
    int _speed;
    
    @protected
    int _wheels;
    
}

- (void)setSpeed:(int)speed
{
    _speed = speed;
}
- (int)speed
{
    return _speed;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //说明Student内中包含其父类声明的成员变量
        Student *stu = [Student new];
        
        [stu setHeight:10];
        
        NSLog(@"%d",[stu height]);
        
        /*
        Car *c = [Car new];
        
        //_speed is private （no @public）
        c->_speed = 100;
        
//        c.speed = 10;
        
        NSLog(@"c.speed is %d",c.speed);
        */
        
        /*
        Person *p =[Person new];
        
        //_bbb 在.m文件中声@public声明，无法观测故无法访问
//        p->_bbb = 10;
         p->_age = 10;
        
//        p->_height = 20;
        
//        p->_weight = 100;
        */
    }
    return 0;
}

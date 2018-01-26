//
//  main.m
//  01-结构体
//
//  Created by Captain on 26/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
 /*
  NSRange (location length)
  NSPoint\CGPoint
  NSSize\CGSize
  NSRect\CGRect (CGpoint CGSize)
  */
    
    // 使用这些函数的前提是添加CoreGraphics框架
    // NextStep 公司
    
    // 比较两个点是否相同(x、y)
    BOOL b = CGPointEqualToPoint(CGPointMake(10, 10), CGPointMake(10, 10));
    
    //CGSizeEqualToSize(CGSize size1, CGSize size2)
    //CGRectEqualToRect(CGRect rect1, CGRect rect2)
    
    
    // CoreGraphics
    // x ∈ (50, 150)  y ∈ (40, 90)
    NSLog(@"%d", CGRectContainsPoint(CGRectMake(50, 40, 100, 50), CGPointMake(120, 60)));
    
    return 0;
}

void point()
{
    CGPoint p1 = NSMakePoint(10, 10);
    NSPoint p2 = CGPointMake(20, 20); // 最常用
    
    NSSize s1 = CGSizeMake(100, 50);
    NSSize s2 = NSMakeSize(200, 100);
    CGSize s3 = NSMakeSize(100, 200);
    
    CGRect r1 = CGRectMake(0, 0, 100, 50);
    CGRect r2 = {{10,10},{100,90}};
    CGRect r3 = {p1, s1};
    CGRect r4 = {CGPointZero, CGSizeMake(100, 80)};
    
    // CGSizeZero
    // CGRectZero
    
    // 表示原点
    // CGPointZero == CGPointMake(0, 0)
    
    //    NSLog(@"x = %f,y = %f,width = %f, height = %f ",r1.origin.x,r1.origin.y,r1.size.width,r1.size.height);
    
    // 将结构体转为字符串
    //    NSString *str = NSStringFromPoint(p1);
    //    NSLog(@"%@", str);
    //
    //    NSLog(@"%@",NSStringFromSize(s1));
    
    NSLog(@"%@", NSStringFromRect(r3));
}

void range()
{
    struct Date {
        int year ;
        int month;
        int day;
    };
    
    //struct Date d = {2011,9,1};
    
    // @"i love u" // love 的范围
    //NSRange r1 = {2,4}; // 不建议使用
    //NSRange r2 = {.location = 2, .length = 4 }; // 不建议使用
    //NSRange r3 =  NSMakeRange(2, 4); // 掌握
    
    NSString *str = @"i love u";
    
    // 查找某个字符串在str中的范围
    // 若找不到，length=0,location=NSNotFound=-1
    NSRange rang = [str rangeOfString:@"Captain"];
    
    NSLog(@"loc = %d,length = %ld",rang.location,rang.length);
    
}

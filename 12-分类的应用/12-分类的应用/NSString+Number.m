//
//  NSString+Number.m
//  12-分类的应用
//
//  Created by Captain on 05/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "NSString+Number.h"

@implementation NSString (Number)

 + (int)numberCountOfString:(NSString *)str
{
//    //1.定义变量计算数字的个数
//    int count = 0; //局部变量一定要初始化
//
//    for (int i = 0; i<str.length; i++)
//    {
//         unichar c = [str characterAtIndex:i];
//
//        if (c >= '0' && c <= '9')
//        {
//            count++;
//        }
//    }
//   return count;
    
    return [str numberCount];
}

- (int)numberCount
{
    //return [NSString numberCountOfString:self];
    int count = 0; //局部变量一定要初始化
    
    for (int i = 0; i<self.length; i++)
    {
        unichar c = [self characterAtIndex:i];
        
        if (c >= '0' && c <= '9')
        {
            count++;
        }
    } 
    return count;
}
    
@end

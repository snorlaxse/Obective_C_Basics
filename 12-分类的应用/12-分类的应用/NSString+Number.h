//
//  NSString+Number.h
//  12-分类的应用
//
//  Created by Captain on 05/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

/*
 给NSString增加一个类方法：计算某个字符串中阿拉伯数字的个数
 @"abc1234ab12"
 给NSString增加一个对象方法：计算当前字符串中阿拉伯数字的个数
 */

#import <Foundation/Foundation.h>

@interface NSString (Number)

+ (int)numberCountOfString:(NSString *)str;
- (int)numberCount;
@end

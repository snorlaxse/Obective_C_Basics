//
//  main.m
//  09-NSDate
//
//  Created by Captain on 28/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    NSString *time = @"2018/01/28 01:12";
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyy/MM/dd HH:mm";
    
    NSDate *date = [formatter dateFromString:time];
    
    NSLog(@"%@",date);
    
    return 0;
}

void date2string()
{
    NSDate *date = [NSDate date];
    
    // 日期格式化类
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // y年 M月 d日
    // m分 s秒 H (24)时 h (12)时
    formatter.dateFormat = @"yyy-MM-dd HH:mm:ss";
    
    NSString *str = [formatter stringFromDate:date];
    
    NSLog(@"%@",str);
}

void use()
{
    // 创建一个时间对象
    NSDate *date = [NSDate date];
    
    // 打印出的时间是当前时间
    NSLog(@"%@",date);
    
    NSDate *date2 = [NSDate dateWithTimeInterval:5 sinceDate:date];  // 单位: s
    
    // 从1970开始走过的秒数
    NSTimeInterval seconds = [date2 timeIntervalSince1970];
    
    //[date2 timeIntervalSinceNow];
    
}

//
//  main.m
//  02-NSString
//
//  Created by Captain on 26/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 NSString : 不可变字符串
 
 NSMutableString : 可变字符串
 
 */

int main(int argc, const char * argv[])
{
    NSMutableString *s1 = [NSMutableString stringWithFormat:@"age is %d ",10];
    // 拼接内容到s1的后面
    [s1 appendString:@"11 12"];
    // 获取is的范围
//    NSRange rang = [s1 rangeOfString:@"is"];
//    [s1 deleteCharactersInRange:rang];
    
    NSString *s2 = [NSString stringWithFormat:@"age is 10 "];
    NSString *s3 = [s2 stringByAppendingString:@"11 12"];
    
    NSLog(@"\ns1= %@\ns2= %@\ns3= %@\n",s1,s2,s3);
    
    return 0;
}

void stringExport()
{
    // 字符串的导出
    [@"Captain\nCaptain" writeToFile:@"/Users/Captain/Desktop/02-NSString.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    
    NSString *str = @"234567";
    NSURL *url = [NSURL fileURLWithPath:@"/Users/Captain/Desktop/02-NSString2.txt"];
    [str writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
}


void StringCreate()
{
    /*
     1. 字符串的创建
     */
    
    NSString *s1 = @"2345";
    
    //    NSString *s2 = [[NSString alloc] initWithString:@"Captain"];
    
    NSString *s3 = [[NSString alloc] initWithFormat:@"age is %d",10];
    
    // C字符串 --> OC字符串
    NSString *s4 = [[NSString alloc] initWithUTF8String:"Captain"];
    
    // OC字符串 --> C字符串
    const char *cs = [s4 UTF8String];
    
    // NSUTF8StringEncoding 用到中文就可以用这种编码
    NSString *s5 = [[NSString alloc] initWithContentsOfFile:@"/Users/Captain/Desktop/02-NSString.txt" encoding:NSUTF8StringEncoding error:nil];
    
    //NSLog(@"%@",s5);
    
    // URL : 资源路径
    // 协议头:// 路径
    // http://  例如 http://weibo.com/a.png
    // file://
    // ftp://
    
    
    //    NSURL *url = [[NSURL alloc] initWithString:@"file:///Users/Captain/Desktop/02-NSString.txt"];
    NSURL *url1 = [NSURL fileURLWithPath:@"/Users/Captain/Desktop/02-NSString.txt"];
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.baidu.com"];
    NSString *s6 = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
    NSLog(@"s6内容如下所示\n%@",s6);
    
    // 一般都会有一个类方法跟对象方法配对
    // 相应类方法
    //    [NSString stringWithFormat:@""];
    //    [NSString stringWithContentsOfFile:@"" encoding:NSUTF8StringEncoding error:nil];
    //    [NSString stringWithContentsOfURL:@"" encoding:NSUTF8StringEncoding error:nil];
    //    [NSURL URLWithString:@""];
    
}

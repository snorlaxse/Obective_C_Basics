//
//  main.m
//  04-统计代码行数
//
//  Created by Captain on 27/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

/*
 * 考察NSString、NSArray的使用
 * NSFileManager
 
 */
#import <Foundation/Foundation.h>

// 计算单个文件的代码行数
/*
 * path : 文件的全路径（可能是文件夹，也可能是文件）
 * 返回值 int : 代码行数
 */
NSUInteger codeLineCount(NSString *path)
{
    // 1.获得文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    
    // 2. 判断path是文件夹还是文件路径
    BOOL dir = NO;  // 标记是否为文件夹
    // 这个路径是否存在
    BOOL exist = [mgr fileExistsAtPath:path isDirectory:&dir];
    
    // 3. 如果不存在，直接返回0
    if (!exist)
    {
        NSLog(@"文件路径不存在");
        return 0;
    }
    
    // 4. 路径存在
    if (dir)
    {
        //NSLog(@"是个文件夹");
        
        // 装着当前文件夹下的所有内容名称(文件夹、文件)
        NSArray *array =  [mgr contentsOfDirectoryAtPath:path error:nil];
        
        // NSLog(@"%@",array);
        
        int count = 0;
        
        // 遍历数组中的所有文件(夹)名
        for (NSString *filename in array)
        {
            // 子文件(夹)的全路径
            NSString *fullPath = [NSString stringWithFormat:@"%@/%@",path,filename];  // @"%@/%@"  其中%@之间的 / 很重要
            
            // NSLog(@"%@",fullPath);
            
            // 累加每个子路径的总行数
            count += codeLineCount(fullPath);
        }
        
        return  count;
        
    }
    else
    {
        // NSLog(@"是个文件");
        
        // 1. 判断文件的拓展名(忽略大小写)
        NSString *extension = [[path pathExtension] lowercaseString];
        // NSLog(@"%@", extension);
        
        if (![extension isEqualToString:@"h"] && ![extension isEqualToString:@"m"] && ![extension isEqualToString:@"c"])
        {
            // 文件拓展名不合理:非.h 非.m 非.c
            return 0;
        }
        
        // 2. 加载文件内容
        NSString *content = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        
        //NSLog(@"%@",content);
        
        // 3. 将文件内容切割为每一行
        NSArray *array = [content componentsSeparatedByString:@"\n"];
        
        
//        int i =0;
//        for (NSString *line in array)
//        {
//            //NSUInteger i = [array indexOfObject: line];
//            NSLog(@"%d - %@", i, line);
//            i++;
//        }
        
        
        NSRange range = [path rangeOfString:@"/Users/Captain/Downloads/Git_Rrpositories/Obective_C_Basics"];
        NSString *str = [path stringByReplacingCharactersInRange:range withString:@""];
        
        NSLog(@"%@ - %ld",str , array.count);
        
        return array.count;
    }
    
    return 0;
    
}

int main(int argc, const char * argv[])
{
    NSUInteger count = codeLineCount(@"/Users/Captain/Downloads/Git_Rrpositories/Obective_C_Basics");
    
    NSLog(@"%ld", count);
    
    return 0;
}

void test()
{
    //[@"Captain\nJack" writeToFile:@"/User/Captain/Desktop/hahaha.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSString *str = @"sb-nb-mmp-rose";
    
    [str writeToFile:@"/User/Captain/Desktop/hahaha.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *array = [str componentsSeparatedByString:@"-"];
    
    int i =0;
    for (NSString *line in array)
    {
        NSLog(@"%d - %@", i, line);
        i++;
    }
    
    //    int count = codeLineCount(@"/Users/Captain/Downloads/Git_Rrpositories/Obective_C_Basics/Foundation/03-NSArray/03-NSArray/main.m");
    
    //    NSLog(@"count = %d",count);
}

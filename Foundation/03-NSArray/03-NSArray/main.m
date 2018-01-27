//
//  main.m
//  03-NSArray
//
//  Created by Captain on 27/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"


/*
 NSArray : 不可变数组
 
 NSMutableArray : 可变数组
 
 */

int main(int argc, const char * argv[])
{
    Person *p = [[Person alloc] init];
    
    NSArray *array = @[p,@"Captain",@"Micheal"];
    
//    for (int i = 0; i <array.count; i++)
//    {
//        NSLog(@"%@", array[i]);
//    }

    // 快速遍历NSArray元素
    // id obj代表着数组中的每一个元素
    // int i = 0;
//    for (id obj in array)
//    {
//        NSUInteger i = [array indexOfObject:obj];
//        NSLog(@"%ld - %@", i, obj);
//        //i++;
//
//        // 确定在合适的数组位置退出循环
//        if (i == 1)
//        {
//            break;
//        }
//    }
    
    
    [array enumerateObjectsUsingBlock:
     
     // 每遍历到一个元素，就会调用一次block
     // 并且当前元素和索引位置当做参数传给block
     ^(id obj, NSUInteger idx, BOOL * _Nonnull stop) {
         NSLog(@"%ld - %@",idx,obj);
         
         if (idx == 1)
         {
             // 停止遍历
             *stop = YES;
         }
     }];
    
    
//    void (^myblock)(id , NSUInteger , BOOL *) = ^(id obj, NSUInteger idx, BOOL * _Nonnull stop)
//    {
//        NSLog(@"%ld - %@",idx,obj);
//
//        if (idx == 1)
//        {
//            // 停止遍历
//            *stop = YES;
//        }
//    };
//
//
//    for (int i = 0; i<array.count; i++) {
//        // 用来标记是否需要停止遍历
//        BOOL isStop = NO;
//
//        // 取出元素
//        id obj = array[i];
//
//        myblock(obj , i, &isStop);
//
//        if (isStop)
//        {
//            break;
//        }
//    }
  
    
//    void (^sumBlock)(int,int) = ^(int a,int b)
//    {
//        return a+b;
//    };
//
//    sumBlock(10,11);
    
    return 0;
}


void use()
{
    /*
     int a = 5;
     
     int ages[10] = {1, 90, 89, 17};
     
     Person *p = [[Person alloc] init];
     
     Person *person[5] = {p, [[Person alloc] init]};
     */
    
    // OC数组不能存放nil值(空值)
    // OC数组只能存放OC对象，不能存放非OC对象类型，比如int、struct、enum等
    
    /*
     1.NSArray的创建
     */
    // 这个array永远是空数组
    //NSArray *array = [NSArray array];
    
    NSArray *array2 = [NSArray arrayWithObject:@"Captain"];
    
    // nil是数组元素结束的标记
    NSArray *array3 = [NSArray arrayWithObjects:@"Jack",@"Rose", nil];
    
    //NSArray *array4 = [NSArray arrayWithObjects:@"Captain",@"Jack",@"Micheal",@"1234", nil];
    
    // 快速创建一个NSArray对象
    NSArray *array4 =@[@"Captain",@"Jack",@"Micheal",@"1234"];
    
    /*
     2. NSArray的元素个数
     */
    //[array2 count] == array2.count
    NSLog(@"%ld", array2.count);
    
    
    /*
     3. NSArray中元素的访问
     */
    NSLog(@"%@", [array3 objectAtIndex:1]);
    NSLog(@"%@",array3[0]);
    
}

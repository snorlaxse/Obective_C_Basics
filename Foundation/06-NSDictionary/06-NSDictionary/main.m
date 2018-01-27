//
//  main.m
//  06-NSDictionary
//
//  Created by Captain on 27/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

/*
 OC         Java
 NSArray    ArrayList
 NSSet      Set
 NSDictionary Map
 */

/*
 集合
 1.NSArray\NSMutableArray
 * 有序
 * 快速创建(不可变): @[@"obj1",@"obj2",...]
 * 快速访问元素: 数组名[i]
 
 
 2. NSSet\NSMutableSet
 * 无序
 * 无快速创建
 
 3. NSDictionary\NSMutableDictionary
 * 无序
 * 快速创建: @{@"key1" : @"value1" , @"key2" : @"value2"}
 * 快速访问元素: 字典名[key]
 
 */

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
   NSArray *persons =  @[
      @{ @"name" : @"Captain", @"address" : @"浙江", @"QQ" : @"87654321",@"books" : @[@"5分钟突破iOS编程",@"5分钟突破Android编程"]},
      @{ @"name" : @"Micheal", @"address" : @"浙江", @"QQ" : @"87654322"},
      @{ @"name" : @"Jack", @"address" : @"北京", @"QQ" : @"87654323"},
      @{ @"name" : @"Rose", @"address" : @"上海", @"QQ" : @"87654324"}
      ];
    
    //NSDictionary *Micheal = persons[1];
    //NSLog(@"%@",Micheal);
    
    // 先取出1位置对应的字典
    // 再取出该字典中name这个key对应的数据value(Micheal)
    //NSLog(@"%@",persons[1][@"name"]);  // persons[1][@"name"] == Micheal[@"name"]
    
    //NSArray *array = persons[0][@"books"];
    //NSLog(@"%@", array);
    
    NSLog(@"%@",persons[0][@"books"][0]);
    
    
    return 0;
}

void use4()
{
    // 字典不允许有相同的key，但允许有相同的value(Object)
    NSDictionary *dict = @{
                           @"name" : @"Captain",
                           @"name2" : @"Captain",
                           @"name3" : @"Captain",
                           @"address" : @"浙江",
                           @"QQ" : @"87654321"};
    
    
    /* for Statement方法 遍历
     NSArray *keys = [dict allKeys];     // 字典没有顺序
     //NSLog(@"%@",keys);
     
     for (int i = 0; i<dict.count; i++)
     {
     NSString *key = keys[i];
     NSString *object = dict[key];
     
     NSLog(@"%@ - %@",key,object);
     }
     */
    
    // block 方法遍历
    [dict enumerateKeysAndObjectsUsingBlock:
     ^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
         NSLog(@"%@ - %@",key,obj);
         
         // *stop = YES;
     }];
}

void use3()
{
    /* 错误写法
     NSMutableDictionary *dict = @{@"name" : @"Captain"};
     
     [dict setObject:@"rose" forKey:@"name"];
     */
}

void use2()
{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    // 添加键值对
    [dict setObject:@"Captain" forKey:@"name"];
    
    [dict setObject:@"浙江(ZJ)" forKey:@"address"];
    
    // @"Micheal"将覆盖@"Captain"
    [dict setObject:@"Micheal" forKey:@"name"];
    
    // 移除键值对
    // [dict removeObjectForKey:(nonnull id)];
    
    //NSString *str = dict[@"name"];
    //NSLog(@"%@", str);
    
    NSLog(@"%@",dict);
}

void use()
{
    /*
     字典:
     
     key ---> value
     索引 ---> 文字内容
     
     字典内存储的东西都是键值对<key, value>
     */
    
    // NSDictionary *dict = [NSDictionary dictionaryWithObject:@"Captain" forKey:@"name"];
    
    
    //NSArray *keys = @[@"name",@"address"];
    //NSArray *objects = @[@"Captain",@"浙江"];
    //NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    /*
     NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:@"Captain",@"name", @"浙江",@"address", @"898978769",@"QQ",nil];
     */
    
    NSDictionary *dict = @{@"name": @"Captain",@"address": @"浙江",@"QQ" : @"898978769"};
    
    //id obj = [dict objectForKey:@"QQ"];
    id obj = dict[@"QQ"];
    
    NSLog(@"%@", obj);
    
    // 返回的是键值对的个数
    NSLog(@"%ld",dict.count);
}

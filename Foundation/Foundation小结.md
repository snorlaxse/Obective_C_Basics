#### 结构体

#####  NSRange

```
// NSRange (location length)
NSString *str = @"i love Captain";
NSRange rang = [str rangeOfString:@"Captain"];
```

#####  NSPoint\CGPoint

```
CGPoint p1 = NSMakePoint(10, 10);
NSPoint p2 = CGPointMake(20, 20); // 最常用
```

#####  NSSize\CGSize

```
NSSize s1 = CGSizeMake(100, 50); 
NSSize s2 = NSMakeSize(200, 100);
CGSize s3 = NSMakeSize(100, 200);
```

#####  NSRect\CGRect 

```
// NSRect\CGRect (CGpoint, CGSize)
CGRect r1 = CGRectMake(0, 0, 100, 50);
CGRect r2 = {{10,10},{100,90}};
CGRect r3 = {p1, s1};
CGRect r4 = {CGPointZero, CGSizeMake(100, 80)};
```

##### CoreGraphics常用函数

```
- 是否相等
CGPointEqualToPoint(CGPoint point1, CGPoint point2)
CGSizeEqualToSize(CGSize size1, CGSize size2)
CGRectEqualToRect(CGRect rect1, CGRect rect2)
- 是否具有包含关系
CGRectContainsRect(CGRect rect1, CGRect rect2)
CGRectContainsPoint(CGRect rect, CGPoint point)
```



#### NSString

```
- NSString : 不可变字符串
- NSMutableString : 可变字符串
```

##### 1. 字符串的创建

```
 NSString *s1 = @"2345";
 NSString *s2 = [[NSString alloc] initWithString:@"Captain"];       
 NSString *s3 = [[NSString alloc] initWithFormat:@"age is %d",10];
 NSString *s4 = [[NSString alloc] initWithUTF8String:"Captain"]; // C字符串 --> OC字符串
 const char *cs = [s4 UTF8String]; // OC字符串 --> C字符串
 
 NSString *s5 = [[NSString alloc] initWithContentsOfFile:@"/Users/Captain/Desktop/02-NSString.txt" encoding:NSUTF8StringEncoding error:nil]; 
    
  NSURL *url = [[NSURL alloc] initWithString:@"http://www.baidu.com"];
  NSString *s6 = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
```



##### 2. 字符串的导出

```
[@"Captain\nCaptain" writeToFile:@"/Users/Captain/Desktop/02-NSString.txt" atomically:YES encoding:NSUTF8StringEncoding error:nil];

 NSString *str = @"234567";
 NSURL *url = [NSURL fileURLWithPath:@"/Users/Captain/Desktop/02-NSString2.txt"];
 [str writeToURL:url atomically:YES encoding:NSUTF8StringEncoding error:nil];
```



##### 3. 字符串的拼接

```
NSMutableString *s1 = [NSMutableString stringWithFormat:@"age is %d ",10];  // 可变(长)字符串
[s1 appendString:@"11 12"];   // 拼接内容到s1的后面

NSString *s2 = [NSString stringWithFormat:@"age is 10 "];  // 不可变(长)字符串	
NSString *s3 = [s2 stringByAppendingString:@"11 12"];	// 不可变(长)字符串
```



#### NSArray

```
- NSArray : 不可变数组 
- NSMutableArray : 可变数组
 
- OC数组不能存放nil值(空值)
- OC数组只能存放OC对象，不能存放非OC对象类型，比如int、struct、enum等
```

##### 1.NSArray的创建

```
NSArray *array1 = [NSArray array];		// 这个array1永远是空数组
NSArray *array2 = [NSArray arrayWithObject:(nonnull id)];
NSArray *array3 = [NSArray arrayWithObjects:(nonnull id), ..., nil];  // nil是数组元素结束的标记
NSArray *array4 = @[objects, ...];	//快速创建NSArray对象
```

```
例如，
NSArray *array2 = [NSArray arrayWithObject:@"Captain"];
NSArray *array3 = [NSArray arrayWithObjects:@"Jack",@"Rose", nil];
NSArray *array4 =@[@"Captain",@"Jack",@"Micheal",@"1234"];
```

##### 2. NSArray的元素计数

```
NSLog(@"%ld", array2.count);  //[array2 count] == array2.count
```

##### 3. NSArray中元素的访问

```
NSLog(@"%@", [array3 objectAtIndex:0]);
NSLog(@"%@", array3[1]);
```

#####  4. NSArray的遍历

1> for statement

```
    for (id obj in array)
    {
        NSUInteger i = [array indexOfObject:obj];
        NSLog(@"%ld - %@", i, obj);

        // 确定在合适的数组位置退出循环
        if (i == 1)
        {
            break;
        }
    }

```

2> block statement 

```
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
```

##### 5. NSMutableArray

```
    NSMutableArray *array0 = [NSMutableArray array]; // 空数组
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"Captain",@"Jack", nil];
    
    // 添加元素
    [array addObject: [[Person alloc] init]];
    
    [array addObject:@"1234567"];
    
    // 错误写法
    //[array addObject:10];
    
    // 删除元素
    //[array removeAllObjects];
    
    // 删除指定对象
    [array removeObject:@"Jack"];
    
    [array removeObjectAtIndex:2];
```

#### NSSet

##### 1. NSSet的基本使用

```
	NSSet *s = [NSSet set];
    
    NSSet *s2 = [NSSet setWithObjects:@"Captain",@"Micheal",@"Jack",@"Hahaha", nil];
    
    // NSLog(@"%@",s2);
    
    // 随机取出一个元素
    NSString *str = [s2 anyObject];
```

##### 2. NSMutableSet基本使用

```
NSMutableSet *s = [NSMutableSet set];
    
    // 添加元素
    [s addObject:@"Hadoop"];
    [s addObject:@"Spark"];
    
    // 删除元素
    //[s removeAllObjects];
    [s removeObject:@"Hadoop"];
```

##### 3.  NSSet和NSArray的对比

```
 1> 共同点
 * 都是集合，都能存放多个OC对象
 * 只能存放OC对象，不能存放非OC对象类型(基本数据类型: int\char\float等，结构体，枚举)
 * 本身都不可变，都有一个可变的子类
 
 2> 不同点
 * NSArray有顺序，NSSet没有顺序
```



#### NSDictionary

```
理解:
key ---> value
索引 ---> 文字内容
     
字典内存储的东西都是键值对<key, value>
```

##### 1. NSDictionary的创建

```
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"Captain" forKey:@"name"];
    
    
    NSArray *keys = @[@"name",@"address"];
    NSArray *objects = @[@"Captain",@"浙江"];
    NSDictionary *dict = [NSDictionary dictionaryWithObjects:objects forKeys:keys];
    
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
    		@"Captain",@"name",
    		@"浙江",@"address",
            @"898978769",@"QQ",nil];
   
    // 快速创建
    NSDictionary *dict = @{@"name": @"Captain",@"address": @"浙江",@"QQ" : @"898978769"};
    
```

##### 2. NSDictionary元素访问

```
    id obj = [dict objectForKey:@"QQ"];
    id obj = dict[@"QQ"];
    
    NSLog(@"%@", obj);
    
    // 返回的是键值对的个数
    NSLog(@"%ld",dict.count);
```

```
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
```



##### 3.NSMutableDictionary

```
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
```

```
/* 错误写法

	NSMutableDictionary *dict = @{@"name" : @"Captain"};
     
     [dict setObject:@"rose" forKey:@"name"];
     
 */
```

##### 4. NSDictionary的遍历

```
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
```

#### NSNumber

##### NSNumber的创建

```
 	NSNumber *num = [NSNumber numberWithInteger:10];
 
 	// @20 将 20 包装成一个NSNumber对象
 	// 即 [NSNumber numberWithInteger:20] == @20
 	
 	// 将各种基本数据类型包装成NSNumber对象
    @10.5;
    @YES;
    @'A';     // NSNumber对象
    
    @"A";   // 注:NSString对象
```

```
	// NSNumber ---> int
	NSNumber *num = [NSNumber numberWithInteger:10];
    int a = [num intValue];
 
    // NSNumber --->  Double
    NSNumber *n = [NSNumber numberWithDouble:10.5];
    int d = [n doubleValue];
```

#### NSValue

```
   // 结构体 ---> OC 对象
    
    CGPoint p = CGPointMake(10, 10);
    
    // 将结构体转换为Value对象
    NSValue *value = [NSValue valueWithPoint:p];
    
    // 将value转换为相应的结构体
    //[value pointerValue];
    
    NSArray *array = @[value];
  
```


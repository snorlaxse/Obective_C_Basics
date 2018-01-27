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



##### 3. 字符串拼接

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

#####  4. 遍历

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


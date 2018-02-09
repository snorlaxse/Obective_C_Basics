### 一、类扩展(class extension,匿名分类)

1. 格式

```
@interface ViewController ()
{
    // 成员变量...
}

// 方法声明...

@end
```

2. 作用

1> 写在.m文件中

2> 一般用在扩展私有成员变量、@property属性、方法等



### 二、随机数生成

1. arc4random() 会生成任意正整数和0
2. arc4random_uniform(100) 会生成0~99的整数(包括0和99)





### 三、UIView常见方法

1. `addSubview:(UIView *)child` — 添加子控件(最新添加的子控件，会显示在最上面) 

2. `NSArray *subviews` — 通过addSubview:方法添加的子控件都会存在于这个数组中

3. `removeFromSuperview` — 将控件本身从父控件中移除(控件本身也会从父控件的subviews数组中移除).

4. `(UIView *)viewWithTag:(int) mytag` — 返回`tag值为mytag`的子控件

   — 如果有多个子控件的tag值一样，只会返回第一个匹配的子控件(执行匹配操作时，也包含控件本身)

5. `UIView *superview` — 返回父控件




### 四、xib的基本使用

1. 可以认为xib和nib是同义词

2. 加载xib文件

   ```
   [[NSBundle mainBundle] loadNibNamed:@"RowView" owner:self options:nil];
   // 加载MyView.xib 文件，创建Objects下面的所有控件，并且按顺序装到数组中返回
   ```


3. storyboard和xib的异同

  1> 区别

- storyboard：描述软件界面，大范围，重量级，比较适合描述整个软件的所有界面
- xib：描述软件界面，小范围，轻量级，比较适合描述小界面(局部界面)

  2> 相同点：本质都是转成代码



4. File's Owner的使用步骤

  1> 在xib文件中设置File‘s Owner的class属性(目的是在xib中能找到Owner的方法,将xib文件与.h/.m文件相关联)

  2> 建立File's Owner跟控件之间的联系

  3> 利用代码加载xib文件，传递Owner参数

```
- (nullable NSArray *)loadNibNamed:(NSString *)name owner:(nullable id)owner options:(nullable NSDictionary *)options
{
    // 解析MyView.xib文件 --- XML
    
    // 创建Objects下面的所有对象
    // 创建View
    UIView *blue = [[UIView alloc] init];
    blue.backgroundColor = [UIColor blueColor];
    // ...设置View其他属性
    
    // 创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"我是按钮" forState:UIControlStateNormal];
    [btn addTarget:owner action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    // ...设置Button其他属性
    
    [blue addSubview:btn];
    
    // 创建文本输入框
    UITextField *field = [[UITextField alloc] init];
    // ...设置field其他属性
    
    return @[blue,field];
}
```


# Block

- Block封装了一段代码,可以在任何时候执行
- Block可以作为函数参数或者函数的返回值，而其本身又可以带输入参数或返回值。
- 苹果官方建议尽量多用block。在多线程、异步任务、集合遍历、集合排序、动画转场用的很多



## Blocks的定义

```
Blocks的定义：
int (^MySum)(int, int) = ^(int a, int b) {
	return a+b;
};

定义了一个叫MySum的blocks对象，它带有两个int参数，返回int。等式右边就是blocks的具体实现
Block可以访问局部变量，但是不能修改。

int sum = 10;
int (^MyBlock)(int) = ^(int num) {
	sum++;//编译报错
	return num * sum;
};

如果要修改就要加关键字：__block
__block int sum = 10;
```



## Blocks和函数指针对比

- 定义函数指针     int(*myFn)();


- 定义Blocks         int(^MyBlocks)(int,int);


- 调用函数指针     (*myFn)(10,20);


- 调用Blocks         MyBlocks(10,20);



## Blocks的赋值

```
- 在声明的同时定义变量，然后赋值
int (^MySum)(int,int) = ^(int a,int b) {
	return a + b;
};

- 也可先用typedef先声明类型，再定义变量进行赋值
typedef int (^MySum)(int,int);
MySum sum = ^(int a,int b) {
	return a + b;
}; 
```


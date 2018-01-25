#####  一、self(关键字)的用途

```
1> 概念：指向当前的对象或类(谁调用了当前方法，self就代表谁)   
* self出现在对象方法中，self就代表当前对象    * self出现在类方法中，self就代表类  
2> 在对象方法中可以利用“self->成员变量名”访问当前对象内部的成员变量(类方法中不能访问成员变量) 
3> [self 方法名]可以代用其他对象方法或者类方法
```


##### 二、self访问成员变量(self -> 成员变量)

```
1.当方法内部定义的局部变量和成员变量名称一样时，调用此方法就会调用局部变量（就近原则）
2.如果必须要访问对象的成员变量时，可以使用self关键字
```
![](http://upload-images.jianshu.io/upload_images/5267500-6a55fcf2fc5494be.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](http://upload-images.jianshu.io/upload_images/5267500-aab971b2310413a7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



##### 三、self调用方法

可以利用[self 方法名]调用其他方法/类方法；

![](http://upload-images.jianshu.io/upload_images/5267500-a691980f2812324d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](http://upload-images.jianshu.io/upload_images/5267500-770df651a31ef68e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



##### 四、self的使用注意点

```
1. 使用不当有可能会引发死循环
2. 在类方法中的self就代表类，这时self后面的方法必须是类方法，并且有明确的声明和实现，没有实现就会报错，不能发送消息给谁谁的经典错误
3. 在对象方法中的self就代表当前对象，这时self后面的方法名必须是对象方法，并且有明确的声明和实现，没有实现就会报错，不能发送消息给谁谁的经典错误
```
![](http://upload-images.jianshu.io/upload_images/5267500-83ea8567ea7a5445.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![](http://upload-images.jianshu.io/upload_images/5267500-3877e4553c75f534.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

原文：http://www.cnblogs.com/unique-ios/p/4324599.html

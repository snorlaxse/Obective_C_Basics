## 05-面向对象语法-super关键字



#### 1.作用

```
直接调用父类中的方法；
[super 方法名] 处在对象方法中，super就会调用父类中的对象方法；
[super 方法名] 处在类方法中，super就会调用父类中的类方法；
```


#### 2.使用场合

```
子类重写父类的方法时，想保留父类中的一些行为；
```


#### 3.代码练习

```
#import <Foundation/Foundation.h>

@interface Zoombie : NSObject
- (void)walk;
@end

@implementation Zoombie
- (void)walk
{
    NSLog(@"走两下------");
}
@end


@interface JumpZoombie : Zoombie

@end

@implementation JumpZoombie
- (void)walk
{
    // 1.先跳两下
    NSLog(@"跳两下。。。。");
    
    // 2.再跳=走两下
    // NSLog(@"走两下------"); // 与父类中的代码重复
    
    [super walk]; // 用super关键字直接调用父类中的walk方法
}
@end

int main()
{
    JumpZoombie *jz = [JumpZoombie new];
    
    [jz walk];
    
    return 0;
}
```
运行结果：

![super.png](http://upload-images.jianshu.io/upload_images/5267500-ae29d51f1e872146.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


原文：http://www.cnblogs.com/unique-ios/p/4324926.html
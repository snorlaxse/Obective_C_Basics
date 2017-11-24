//目的：因为使用了NSObject
#import <Foundation/Foundation.h>
//1、类的声明
//声明对象的属性、行为
//NSObject 目的是：让Car这个类具备创建对象的能力
//OC对象本身是结构体
@interface Car : NSObject
{
//@public可以让外部的指针间接访问对象内部的成员变量
@public
//用来声明对象属性（成员变量，也叫实例变量，默认会初始化为0）
int wheels;//轮胎的个数
int speed;//时速（xxkm/h）
//实例变量不允许在这里初始化 int wheels = 4这种写法是错误的
//不能随便将成员变量当做C语言中的变量来使用 static int wheels;这种写法是错误的
}
//方法（行为）: 方法名 、 参数 、返回值 （声明、实现）
//只要是OC对象的方法，必须以减号 - 开头
//OC方法中任何数据类型都必须用小括号()括住
//OC方法中的小括号()的作用只有一个：括住数据类型
- (void) run;
//类的声明完毕
@end
//2、类的实现
//用来实现interface中声明的方法
@implementation Car
//方法的实现（说清楚方法里面有什么代码）
- (void) run
{
//方法内可直接访问、调用成员变量
NSLog(@"%d个轮子、%d车速的车跑起来了",wheels,speed);
}
//类的实现完毕
@end
int main()
{
//在使用类创建对象之前，会将类加载进内存（只有一次）,类的内存里只存放方法列表
//定义的对象内部都有一个默认的isa指针，指向对象所对应的类
//OC中，想执行一些行为，就写上一个中括号[行为执行者,行为名称]
//利用类来创建对象
//执行了Car这个类的new行为来创建新的对象
//OC中只能用指针变量来间接操作对象
//定义了一个指针变量p，p将来指向的是Car类型的对象
//[Car new]会创建出一个新对象，并且会返回新对象本身(新对象的地址)
Car *p = [Car new];
Car *p2 = [Car new]; //又创建出一个新对象p2
//给p所指向对象的wheels属性赋值4
p->wheels = 4;
p2->speed = 300;
//给p所指向对象发送一条run消息 (OC中的消息机制)
[p run];
[p2 run];
NSLog(@("p车有%d个轮胎,速度是%dkm/h\tp2车有%d个轮胎,速度是%dkm/h"),
p->wheels,p->speed,p2->wheels,p2->speed);
//将p里存储的地址值，赋值给了p3，两个指向的地址值是相同的，指向同一个对象
Car *p3 = p;
p3->speed = 200;
[p run];
[p3 run];
//将p2里存储的地址赋值给p
p = p2;
p->wheels = 3;
[p run];
[p2 run];
return 0;
}
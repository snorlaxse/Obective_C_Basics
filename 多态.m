#import <Foundation/Foundation.h>

@interface Animal : NSObject
- (void)eat;
@end

@implementation Animal
- (void)eat
{
   NSLog(@"Animal---吃东西");
}
@end


@interface Dog : Animal
- (void)run;
@end

@implementation Dog
- (void)eat
{
   NSLog(@"Dog---吃东西");
}
- (void)run
{
   NSLog(@"狗跑起来了");
}
@end

@interface Cat : Animal

@end

@implementation Cat
- (void)eat
{
   NSLog(@"Cat---吃东西");
}
@end

// 喂狗
void feed(Dog *d)
{
   [d eat];
}

// 喂猫
void feed2(Cat *c)
{
   [c eat];
}

// 由于喂狗和喂猫的代码基本一致，所以考虑将其抽取到一个函数内
// 多态的好处：如果形参中使用的是父类类型，就可以传入父类、子类对象
void feed3(Animal *a)
{
   [a eat];
}

int main()
{
   /***************1.多态的基本使用******************/
   
   // 多态：父类指针指向子类对象
   Animal *a = [Dog new];
   
   // 调用方法时会动态检测对象的真实类型，这里对象a的真实类型是Dog
   [a eat]; // 输出：Dog---吃东西
   
   
   /***************2.OC的弱语法******************/
   
   /* 注意点：
    OC的弱语法：这里仅仅是一个警告(warning: incompatible pointer types initializing 'Dog *' with an expression of type 'Animal *' [-Wincompatible-pointer-types])
    */
   // Dog *d = [Animal new]; // 虽然仅仅是一个警告，但是在意思上不合理(动物是狗)
   
   // [d eat]; // 输出：Animal---吃东西
   
   
   /***************3.多态的好处******************/
   // 多态的好处：如果形参中使用的是父类类型，就可以传入父类、子类对象
   
   Dog *d2 = [Dog new];
   feed(d2);
   
   Cat *c2 = [Cat new];
   feed2(c2);
   
   Dog *d3 = [Dog new];
   feed3(d3);
   
   Cat *c3 = [Cat new];
   feed3(c3);
   
   /***************4.多态的局限性******************/
   
   Dog *dd = [Dog new]; // Dog类型
   
   Animal *aa = [Dog new]; // Animal类型
   
   // OC的弱语法： warning: 'Animal' may not respond to 'run'
   // 对于编译器来讲，编译器认为aa的类型是Animal，这里[aa run]就会去Animal中找是否有run的具体实现，没有找到就会警告，但是
   //还是会运行成功，因为在运行是会动态检测aa的真实类型(Dog)，Dog类中有run方法的具体实现，就能正常运行
   // 多态的局限性：父类类型的变量不能用来调用子类特有的方法
   // [aa run];
   
   // 对于上面的问题，可以将aa强制转换成Dog类型，编译器就不会警告
   Dog *dd = (Dog *)aa; // 将aa强制转换成Dog *类型
   
   [dd run];
   
   
   return 0;
}
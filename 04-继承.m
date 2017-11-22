#import <Foundation/Foundation.h>

/*********Animal类的声明**********/
@interface Animal : NSObject
{
    int _age;
    double _weight;
}

- (void)setAge:(int)age;
- (int)age;
@end

/*********Animal类的实现**********/
@implementation Animal
- (void)setAge:(int)age
{
    _age = age;
}
- (int)age
{
    return _age;
}
@end
// : Animal 代表Dog类继承了Animal类，那么Dog类中就拥有了Animal类中的所有成员变量及方法
// Animal类就是Dog类的父类
// Dog类就是Animal的子类

/*********Dog类的声明**********/
@interface Dog : Animal

@end

/*********Dog类的实现**********/
@implementation Dog

@end

int main()
{
    Dog *d = [Dog new];
    
    [d setAge:10];
    
    NSLog(@"age=%d", [d age]);
    
    return 0;
}
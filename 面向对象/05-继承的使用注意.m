#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    int _age;
}

- (void)run;
@end

@implementation Person
- (void)run
{
    NSLog(@"person---跑");
}
@end

// 注意点1：子类的声明必须写在父类的声明后面
@interface Student :Person
{
    int _no;
// 注意点2：不允许在子类中有和父类相同的成员变量
    // int _age; // 报错：重复定义_age(error: duplicate member '_age')
}

// - (void)run; // 这里可以不写，因为在其父类中已经有声明，如果子类实现中有该方法的实现，就是重写(子类重新实现父类中的某个方法)
@end

@implementation Student
// 重写：子类重新实现父类中的某个方法，这是在子类中调用该方法就会优先执行子类中重新实现的方法，覆盖父类以前的方法
- (void)run
{
    NSLog(@"student---跑");
}
@end

int main()
{
    Student *s = [Student new];
    
    [s run]; // 会现在子类中找run方法，找到了就优先执行当前类中run方法，没有找到就会去其父类中找
    
    return 0;
}
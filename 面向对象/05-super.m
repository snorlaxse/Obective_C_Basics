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

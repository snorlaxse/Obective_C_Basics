#import <Foundation/Foundation.h>

@interface Score : NSObject
{
    int _cScore;
    int _ocScore;
}
@end

@implementation Score

@end

// 继承：xx 是 xxx
// 组合：xx 拥有 xxx

@interface Student :NSObject
{
    int _no;
    int _age;
    Score *_score; // 这里用的就是组合
}

@end

@implementation Student

@end

int main()
{
    
    return 0;
}
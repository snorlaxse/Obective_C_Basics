#import <Foundation/Foundation.h>
#import "Point2D.h"

@interface Circle : NSObject
{
	double _radius;		// 默认 初始为0
	Point2D *_point;  // 指针 8字节
}

//半径的getter和setter
- (void)setRadius:(double)radius;
- (double)radius;

//圆心的getter和setter
- (void)setPoint:(Point2D *)point;
- (Point2D *)point;

//判断跟其他圆是否有重叠部分 (重叠返回YES，否则返回NO)
//返回值是BOOL类型，一般方法名都以is开头
- (BOOL) isInteractWithOther:(Circle *)other;
//判断两个圆是否有重叠部分 (重叠返回YES，否则返回NO)
+ (BOOL) isInteractBetweenCirclee1:(Circle *)c1 andCircle2:(Circle *)c2;
@end


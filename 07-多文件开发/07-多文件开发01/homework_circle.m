/*
设计一个类Circle，用来表示二维平面中的圆
1> 属性
* double _radius （半径）
* Point2D *_point （圆心）    //类的组合关系

2> 方法
* 属性相应的set和get方法
* 设计一个对象方法判断跟其他圆是否有重叠部分 (重叠返回YES，否则返回NO)
* 设计一个类方法判断两个圆是否有重叠部分 (重叠返回YES，否则返回NO)
*/

#import <Foundation/Foundation.h>
#import "homework_Point2D.m"  
//注释掉homework_Point2D.m中的main()，否则error: redefinition of 'main'

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


@implementation Circle 
//半径的getter和setter
- (void)setRadius:(double)radius
{
	_radius = radius;
}
- (double)radius
{
	return _radius;
}

//圆心的getter和setter
- (void)setPoint:(Point2D *)point
{
	_point = point;
}
- (Point2D *)point
{
	return _point;
}


//判断跟其他圆是否有重叠部分 (重叠返回YES，否则返回NO)
//返回值是BOOL类型，一般方法名都以is开头
- (BOOL) isInteractWithOther:(Circle *)other
{
	// return [Circle isInteractBetweenCirclee1:c1 andCircle2:c2];

	//如果两个圆心的距离 < 两个圆的半径和  重叠
	//如果两个圆心的距离 >= 两个圆的半径和  不重叠

	Point2D *p1 = [self point];
	Point2D *p2 = [other point];
	//圆心之间的距离
	double distance = [p1 distanceWithOther:p2];

	//半径和
	double radiusSum = [self radius] + [other radius];

	/*
	if(distance < radiusSum) 
	{
		return YES;
	}
	else
	{
		return NO;
	}*/ 

	return ( distance < radiusSum );
}
//判断两个圆是否有重叠部分 (重叠返回YES，否则返回NO)
+ (BOOL) isInteractBetweenCirclee1:(Circle *)c1 andCircle2:(Circle *)c2
{
	return [c1 isInteractWithOther:c2];
}
@end

//只有利用类名调用类方法的时候，不需要在类名后写*
//其他情况下，类名后面统一加上一个*  （指针）

int main()
{
	Circle *c1 = [Circle new];
	//设置圆的半径
	[c1 setRadius:2];
	//创建圆心对象
	Point2D *p1 = [Point2D new];
	[p1 setX:10 andY:15];
	//设置圆心
	[c1 setPoint:p1];

	[[c1 point] setX:15]; // c1 圆心：(15,15) 半径：2

	//圆对象
	Circle *c2 = [Circle new];
	//设置圆的半径
	[c2 setRadius:2];

	//创建圆心对象
	Point2D *p2 = [Point2D new];
	[p2 setX:12 andY:19];
	//设置圆心
	[c2 setPoint:p2];	//c2 圆心：(12,19) 半径：2

	BOOL b1 = [c1 isInteractWithOther:c2];
	BOOL b2 = [Circle isInteractBetweenCirclee1:c1 andCircle2:c2];

	NSLog(@"%d  %d",b1,b2);
	return 0;
}
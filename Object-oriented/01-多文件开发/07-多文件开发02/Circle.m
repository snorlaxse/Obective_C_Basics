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

#import "Circle.h"  

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
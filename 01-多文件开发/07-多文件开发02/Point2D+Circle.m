/*
总结：
1.只有利用类名调用类方法的时候，不需要在类名后写*  其他情况下，类名后面统一加上一个*  （指针）
Circle *c1 = [Circle new];
- (BOOL)isInteractWithOther:(Circle *)other;

2.返回值是BOOL类型，一般方法名都以is开头
- (BOOL) isInteractWithOther:(Circle *)other;

3. 想要拥有某个对象，就先创建对象，然后调用set方法将对象传递给内部的成员变量
//创建圆心对象
	Point2D *p2 = [Point2D new];
	[p2 setX:12 andY:19];
	//设置圆心
	[c2 setPoint:p2];

- (void) setPoint:(Point2D *)point
{
	_point = point;
}

4.定义一个类分2个文件:.h文件 、 .m文件
.h ： 成员变量、方法的声明
.m ： 方法的实现

5.如果想使用某一个类，只需要#import类的.h文件即可

6. 生成可执行文件格式：
$ cc  Point2D+Circle.m Point2D.m Circle.m -o Point2D+Circle -framework Foundation
*/
#import <Foundation/Foundation.h>
#import <math.h>
#import "Point2D.h"
#import "Circle.h"

int main()
{	
	// //Point2D
	// Point2D *p1 = [Point2D new];
	// //(10.15)
	// [p1 setX:10 andY:15];

	// Point2D *p2 = [Point2D new];
	// //(13,19)
	// [p2 setX:13 andY:10];

	// //double d1 = [p1 distanceWithOther:p2];
	// double d2 = [Point2D distanceBetweenPoint1:p1 andPoint2:p2];
	// NSLog(@"%f",d2);

	//Circle
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
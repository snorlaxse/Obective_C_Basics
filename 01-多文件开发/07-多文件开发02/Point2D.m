/*
设计一个类Point2D,用来表示二维平面中某个点

1> 属性
* double _x
* double _y
 
2> 方法
* 属性相应的set和get方法
* 设计一个对象方法同时设置x和y
* 设计一个对象方法计算跟其他点的距离
* 设计一个类方法计算两个点直接的距离

3> 提示
* C语言的math.h中有个函数:double pow(double n,double m); 计算n的m次方
* C语言的math.h中有个函数:double sqrt(double n); 计算根号n的值
*/

#import "Point2D.h"
#import <math.h>

// 二维点
@implementation Point2D
// x值的getter方法和setter方法
- (void)setX:(double)x
{
	_x = x;
}
- (double)x
{
	return _x;
}

// y值的getter方法和setter方法
- (void)setY:(double)y
{
	_y = y;
}
- (double)y
{
	return _y;
}

//同时设置x和y
- (void)setX:(double)x andY:(double)y
{
	 /*
	 _x = x;
	 _y = y;*/
	
	/*
	 self->_x = x;
	 self->_y = y;
	 */

	 [self setX:x];
	 [self setY:y];
}


//计算跟其他点的距离
- (double)distanceWithOther:(Point2D *)other
{
	//[ (x1-x2)的平方 + (y1-y2)的平方 ] 开根号
	//return [distanceBetweenPoint1:self andPoint2:other];


	//x1-x2
	double xDelta = [self x] - [other x];
	//double xDelta = self->_x - other->_x;
	//(x1 - x2)^2
	double xDeltaPF = pow(xDelta , 2);

	//y1-y2
	double yDelta = [self y] - [other y];
	//(y1 - y2)^2
	double yDeltaPF = pow(yDelta , 2);

	//返回距离
	return sqrt(xDeltaPF + yDeltaPF);

	
}
//计算两个点直接的距离
+ (double)distanceBetweenPoint1:(Point2D *)p1 andPoint2:(Point2D *)p2
{
	/*
	//x1-x2
	double xDelta =  [p1 x] - [p2 x];
	//double xDelta = self->_x - other->_x;
	//(x1 - x2)^2
	double xDeltaPF = pow(xDelta , 2);

	//y1-y2
	double yDelta = [p1 y] - [p2 y];
	//(y1 - y2)^2
	double yDeltaPF = pow(yDelta , 2);

	//返回距离
	return sqrt(xDeltaPF + yDeltaPF);
	
	*/

	return [p1 distanceWithOther:p2];
	return [p2 distanceWithOther:p1];
}
@end

#import <Foundation/Foundation.h>


@interface Person : NSObject
{
	NSString *name;
}
@end 

int main()
{	
	/*
	//最简单的创建字符串的方式
	NSString *str = @"itcast";
	char *name = "itcast";

	NSLog(@"我在%@上课",str);
	NSLog(@"%s",name);
	*/

	int age = 10;
	int no = 5;
	NSString *name = @"哈哈jack";

	//length方法算的是字数，非字符数
	int size = [name length];
	NSLog(@"-------%d",size);

	//创建OC字符串的另一种方式
	NSString *newStr = [NSString stringWithFormat:@"My age is %d and no is %d and name is %@",age,no,name];

	NSLog(@"-------%@",newStr);
	NSLog(@"-------%ld ",[newStr length]);

	return 0;	
}
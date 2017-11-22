/*第一个OC程序*/
#include <stdio.h>

int main()
{
	printf("第一个OC程序\n", );
	return 0;
}

/*第2个OC程序*/
#import <Foundation/Foundation.h>

int main()
{
    //NSLog输出内容会自动换行
    NSLog(@"第2个OC程序!!!");
    return 0;
}

/*第3个OC程序*/
//one.m文件：
#import "two.h"

int main()
{    
    test();
    return 0;
}

//two.m文件：
#import<Foundation/Foundation.h>

void test()
{
    NSLog(@"调用了test函数 ");
}

//two.h文件：
void test();

/*第4个OC程序*/
//one.m文件：
#import"two.h"

int main()
{
    test();
    return 0;
}

//two.c文件：  （注意此处非.m文件）
#include<stdio.h>

void test()
{
    printf("调用了test函数.\n");
}

//two.h文件：
void test();

/*第5个OC程序*/
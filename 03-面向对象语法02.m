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

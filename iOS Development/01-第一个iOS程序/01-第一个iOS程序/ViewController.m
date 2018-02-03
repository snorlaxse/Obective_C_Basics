//
//  ViewController.m
//  01-第一个iOS程序
//
//  Created by Captain on 28/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
}


#pragma mark 监听按钮点击
- (void)btnClick
{
    //NSLog(@"按钮被点击了");
    
    /*
    UITextField *textfield =  self.num1;    // self.num1 -- 点语法:访问self的_num1成员变量
    
    NSString *text1 = textfield.text;
     */
    
    // 1. 获得文本输入框的文字
    NSString *text1 = self.num1.text;
    NSString *text2 = self.num2.text;
    
    // 2. 将字符串转为整数
    int i1 = [text1 intValue];
    int i2 = [text2 intValue];
    
    // 输出测试
    //NSLog(@"%d",i1 + i2);
    
    // 3. 将结果显示到右边的标签中
    self.result.text = [NSString stringWithFormat:@"%d",i1 + i2];
    
}

@end

//
//  ViewController.m
//  02-代码创建按钮
//
//  Created by Captain on 29/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

/* storyboard 本质是代码 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark 控制器的View加载完毕的时候就会调用一次
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //NSLog(@"viewdidload----------");
    
    //1. 创建按钮
    // 1.1 创建
    UIButton *btn = [[UIButton alloc] init];
    // 1.2 设置按钮的尺寸和位置
    btn.frame = CGRectMake(130, 110, 110, 110);
    // 1.3 设置按钮的普通状态下的属性(背景图片\文字...)
    // 1.3.1 背景图片
    UIImage *normal = [UIImage imageNamed:@"小新01.jpg"];
    [btn setBackgroundImage:normal forState:UIControlStateNormal];
    // 1.3.2 设置文字
    [btn setTitle:@"Touch" forState:UIControlStateNormal];
    // 1.3.3 设置文字颜色
     [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    // 1.4 设置按钮的高亮状态下的属性(背景图片\文字...)
    // 1.4.1 背景图片
    UIImage *highlighted = [UIImage imageNamed:@"小新02.jpg"];
    [btn setBackgroundImage:highlighted forState:UIControlStateHighlighted];
    // 1.4.2 设置文字
    [btn setTitle:@"OK" forState:UIControlStateHighlighted];
    // 1.4.3 设置文字颜色
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    // 设置btn圆角
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 10;

    
    // 1.5 监听按钮事件
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 2. 添加按钮到控制器的View中
    [self.view addSubview:btn];
    
    /*
    // 3. 添加文本输入框
    UITextField *field = [[UITextField alloc] init];
    field.frame = CGRectMake(0, 0, 110, 50);    // 不要忘记设置frame
    
    // 设置中点
    //CGFloat centerX = self.view.frame.size.width * 0.5;
    //CGFloat centerY = self.view.frame.size.height * 0.5;
    //field.center = CGPointMake(centerX, centerY);
    field.center = CGPointMake(self.view.center.x, self.view.center.y);
    // 设置输入框背景颜色
    [field setBackgroundColor:[UIColor blueColor]];
    // 设置字体大小
    field.font = [UIFont systemFontOfSize:30];
    
    // 添加文字输入框到控制器的View中
    [self.view addSubview:field];
     */
    
    
}

# pragma mark  监听按钮点击
- (void) btnClick
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}


@end

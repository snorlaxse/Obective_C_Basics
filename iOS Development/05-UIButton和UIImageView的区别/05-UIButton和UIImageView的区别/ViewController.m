//
//  ViewController.m
//  05-UIButton和UIImageView的区别
//
//  Created by Captain on 2018/2/6.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"


/*
 1. 显示图片
 1> UIImageView只能显示一种图片(图片会默认填充整个UIImageView)   .image\setImage:
 2> UIButton 能显示2种图片
    * 背景(背景会填充整个UIButton)   setBackgroundImage:    forState:
    * 前置(覆盖在背景上面的图片，按照之前的尺寸显示)      setImage:    forState:
    * 显示文字
 
 2. 点击事件
 1> UIImageView默认是不能响应点击事件
 2> UIButton能响应点击事件 [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
 
 3. 使用场合
 1> UIImageView : 只显示图片，不监听点击，点击了图片后不做任何反应
 2> UIButton : 既显示图片，又监听点击，点击了图片后做一些其他事情
 
 4. 继承结构
 1> UIButton之所以能添加监听器来监听事件，是因为它继承自UIcontrol
 2> UIImageView之所以不能添加监听器来监听事件，是因为它直接继承自UIView
 */

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 添加ImageView
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"010.png"];
    imageView.frame = CGRectMake(20, 20, 50, 50);
    [self.view addSubview:imageView];
    
    // 2. 添加UIButton
    UIButton *btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(50, 100, 300, 150);
    
    // 设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:@"8.jpg"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"011.png"] forState:UIControlStateNormal];   /*setBackgroundImage:与setImage:不同*/
  
    
    [btn setTitle:@"我是按钮" forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    UISlider *slider = [[UISlider alloc] init];
    slider.frame = CGRectMake(10, 250, 200, 50);
    [slider addTarget:self action:@selector(sliderChange:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
}

- (void)btnClick:(UIButton *)mybtn
{
    NSLog(@"%@",mybtn);
}

- (void)sliderChange:(UISlider *)myslider
{
    NSLog(@"%@",myslider);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  09-UIscrollView01-大图展示
//
//  Created by Captain on 09/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);   // 指UIScrollView的可视范围
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"1.jpg"];
    imageView.frame = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
    [scrollView addSubview:imageView];
    
    // 设置UIScrollingView的滚动范围(内容大小)
    scrollView.contentSize = imageView.image.size;
    
    // 隐藏水平\垂直滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    // 去掉弹簧效果
    //scrollView.bounces = NO;
    
    // 增加额外的滚动区域
    // top left bottom right
    //scrollView.contentInset = UIEdgeInsetsMake(10, 20, 30, 40);
    
    // 用来记录scrollView滚动的位置
    //scrollView.contentOffset
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

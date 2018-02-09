//
//  ViewController.m
//  10-图片缩放
//
//  Created by Captain on 09/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
{
    UIImageView *_imageView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 添加UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    
    // 2. 添加图片
    UIImage *image = [UIImage imageNamed:@"5.jpg"];
    // 调用initWithImage:方法创建出来的UIImageView，ta的宽高默认与图片的宽高保护一致
    _imageView = [[UIImageView alloc] initWithImage:image];
    // 设置图片
    //imageView.image = [UIImage imageNamed:@"5.jpg"];
    // 设置frame
    //imageView.frame = CGRectMake(0, 0, imageView.image.size.width, imageView.image.size.height);
    
    [scrollView addSubview:_imageView];
    
    // 设置内容范围
    scrollView.contentSize = image.size;
    
    // 设置scrollView的代理对象
    scrollView.delegate = self;
    
    //UIView *zoom = [scrollView.delegate viewForZoomingInScrollView:scrollView];
    
    // 设置最大伸缩比例
    scrollView.maximumZoomScale = 2.0;
    // 设置最小伸缩比例
    scrollView.minimumZoomScale = 0.2;
}

#pragma  mark - UIScrollView 的代理方法
#pragma  mark 这个方法返回的控件就能进行捏合手势缩放操作
#pragma mark 当UIScrollView尝试进行缩放的时候就会调用
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
 
    //NSLog(@"zoom------------------");
    
    return _imageView;
}

#pragma mark 当缩放完毕的时候调用
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
   // NSLog(@"结束缩放----------- %f",scale);
}


#pragma mark 当正在缩放的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //NSLog(@"--------");
}

@end

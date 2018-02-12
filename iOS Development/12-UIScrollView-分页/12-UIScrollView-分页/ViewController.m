//
//  ViewController.m
//  12-UIScrollView-分页
//
//  Created by Captain on 10/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

#define kCount 8

@interface ViewController () <UIScrollViewDelegate>
{
    UIPageControl *_pageControl;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    int w = self.view.frame.size.width;
    int h = self.view.frame.size.height;
    
    for (int i = 0 ; i < kCount; i++) {
        
        UIImageView *imageView = [[UIImageView alloc] init];
        
        // 设置frame
        imageView.frame = CGRectMake(i * w, 0, w, h);
        
        // 设置图片
        NSString *image = [NSString stringWithFormat:@"%02d.jpg",(i + 1)];
        imageView.image = [UIImage imageNamed:image];
        
        [_scrollView addSubview:imageView];
        
    }
    
    // height == 0 代表 禁止🚫垂直方向滚动
    _scrollView.contentSize = CGSizeMake(kCount * w , 0);
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.delegate = self;
    
    // 分页效果
    _scrollView.pagingEnabled = YES;
    
    
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.center = CGPointMake(w * 0.5, h - 20);
    pageControl.bounds = CGRectMake(0, 0, 200, 50);
    
    pageControl.numberOfPages = kCount;
    
    pageControl.pageIndicatorTintColor = [UIColor grayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    pageControl.enabled = NO;
    
    [self.view addSubview:pageControl];
    
    _pageControl = pageControl;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page = _scrollView.contentOffset.x / _scrollView.frame.size.width;
    
    _pageControl.currentPage = page;
}

@end

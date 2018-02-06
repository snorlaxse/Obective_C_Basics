//
//  ViewController.m
//  04-图片排列
//
//  Created by Captain on 2018/2/6.
//  Copyright © 2018年 captain. All rights reserved.
//

#import "ViewController.h"

#define kImgW 60
#define kImgH 60

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 定义列数、间距
    int columns = 2;    //每行3列
    // 每个表情之间的间距 = (控制器View的宽度 - 列数 * 表情的宽度) / (列数 + 1)
    CGFloat margin = (self.view.frame.size.width - columns * kImgW)/(columns + 1);
    
    // 2. 第一个表情的X\Y值   （第一个表情位于第0行 第0列）
    CGFloat oneX = margin;
    CGFloat oneY = 170;
    
    // 3. 创建所有表情
    for (int i = 0; i < 11 ; i++) {
        // i 位置对应的列数
        int cols = i % columns;
        // i 位置对应的行数
         int row = i / columns;
        
        // 列数(col)决定了x值
        CGFloat x = oneX + cols * (kImgW + margin);
        // 行数(row)决定了y值
        CGFloat y  = oneY + row * (kImgH + margin);
        
        int no = i % 9 ;    // no == [ 0, 8 ]
        NSString *imgName = [NSString stringWithFormat:@"01%d.png",no];
        [self addImage:imgName x:x y:y];
    }
   
   
}

#pragma mark 添加表情 icon:表情图片名
- (void)addImage:(NSString *)icon x:(CGFloat)x y:(CGFloat)y
{
    UIImageView *one = [[UIImageView alloc] init];
    one.image = [UIImage imageNamed:icon];
    one.frame = CGRectMake(x, y, kImgW, kImgH);
    [self.view addSubview:one];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma  mark 更改表情的列数
- (IBAction)indexChange:(UISegmentedControl *)sender
{
    //NSLog(@"%ld",(long)sender.selectedSegmentIndex);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    // 1. 定义列数、间距
    int columns = (int)(sender.selectedSegmentIndex + 2);
    // 每个表情之间的间距 = (控制器View的宽度 - 列数 * 表情的宽度) / (列数 + 1)
    CGFloat margin = (self.view.frame.size.width - columns * kImgW)/(columns + 1);
    
    // 2. 第一个表情的X\Y值   （第一个表情位于第0行 第0列）
    CGFloat oneX = margin;
    CGFloat oneY = 170;
    
    // 3. 创建所有表情
    for (int i = 0; i < 11 ; i++) {
        // i 位置对应的列数
        int cols = i % columns;
        // i 位置对应的行数
        int row = i / columns;
        
        // 列数(col)决定了x值
        CGFloat x = oneX + cols * (kImgW + margin);
        // 行数(row)决定了y值
        CGFloat y  = oneY + row * (kImgH + margin);
        
        
        // 取出i位置对应的imageView，设置x\y值
        UIView *child = self.view.subviews[i + 1];
        
        // 1.取出frame
        CGRect tempF = child.frame;
        // 2. 修改x\y
        //tempF.origin.x = x;
        //tempF.origin.y = y;
        tempF.origin =  CGPointMake(x, y);
        
        // 3. 重新赋值frame
        child.frame = tempF;
        
        //[self addImage:imgName x:x y:y];
    }
    
    //NSLog(@"子控件数量:%lu",self.view.subviews.count);
    
    [UIView commitAnimations];
}
@end

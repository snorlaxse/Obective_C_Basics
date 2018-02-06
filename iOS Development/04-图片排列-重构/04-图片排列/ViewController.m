//
//  ViewController.m
//  04-图片排列
//
//  Created by Captain on 2018/2/6.
//  Copyright © 2018年 captain. All rights reserved.
//

/*
 1. adjustImagePosWithColumns:去掉第二个参数---add:(BOOL)add
 2. 在表情最后增加一个“+”按钮，添加按钮在尾部添加一个表情(表情随机)
 */

#import "ViewController.h"

#define kImgW 60
#define kImgH 60
#define kInitCount 11

@interface ViewController ()

@end

@implementation ViewController

#pragma mark 调整图片的位置
- (void) adjustImagePosWithColumns:(int)columns add:(BOOL)add
{
    
    // 1. 定义列数、间距
//#warning different
    //int columns = 3;
    // 每个表情之间的间距 = (控制器View的宽度 - 列数 * 表情的宽度) / (列数 + 1)
    CGFloat margin = (self.view.frame.size.width - columns * kImgW)/(columns + 1);
    
    // 2. 第一个表情的X\Y值   （第一个表情位于第0行 第0列）
    CGFloat oneX = margin;
    CGFloat oneY = 170;
    
    // 3. 创建所有表情
    for (int i = 0; i < kInitCount ; i++) {
        // i 位置对应的列数
        int cols = i % columns;
        // i 位置对应的行数
        int row = i / columns;
        
        // 列数(col)决定了x值
        CGFloat x = oneX + cols * (kImgW + margin);
        // 行数(row)决定了y值
        CGFloat y  = oneY + row * (kImgH + margin);
        
//#warning different
        if (add) {  // 添加新的imageView
            int no = i % 9 ;    // no == [ 0, 8 ]
            NSString *imgName = [NSString stringWithFormat:@"01%d.png",no];
            [self addImage:imgName x:x y:y];
        }else{      // 取出旧的imageView 设置x\y
            // 取出i位置对应的imageView，设置x\y值
            // +1 是为了跳过最前面的UISegmentControl
            UIView *child = self.view.subviews[i + 1];
            
            // 1.取出frame
            CGRect tempF = child.frame;
            // 2. 修改x\y
            tempF.origin =  CGPointMake(x, y);
            
            // 3. 重新赋值frame
            child.frame = tempF;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self adjustImagePosWithColumns:3 add:YES];
   
   
}

#pragma mark 添加表情 icon:表情图片名
- (void)addImage:(NSString *)icon x:(CGFloat)x y:(CGFloat)y
{
    UIImageView *one = [[UIImageView alloc] init];
    one.image = [UIImage imageNamed:icon];
    one.frame = CGRectMake(x, y, kImgW, kImgH);
    [self.view addSubview:one];
}


# pragma  mark 更改表情的列数
- (IBAction)indexChange:(UISegmentedControl *)sender
{
    //NSLog(@"%ld",(long)sender.selectedSegmentIndex);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    [self adjustImagePosWithColumns:(int)(sender.selectedSegmentIndex + 2) add:NO];
    
    [UIView commitAnimations];
}
@end

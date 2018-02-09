//
//  ViewController.m
//  07-联系人管理
//
//  Created by Captain on 07/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"
#import "RowView.h"

#define kDuration 0.5
#define kRowH 44
#define kNameTag 10

// 类扩展(class extension,匿名分类)
@interface ViewController ()
{
    NSArray *_allNames;
}

@end


#pragma  mark 控制器的View加载完毕的时候调用一次
@implementation ViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    
    _allNames =@[@"天行健，君子以自强不息",@"地势坤，君子以厚德载物",@"如山间清爽的风",@"如古城温暖的光"];

    
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark 添加一行
- (IBAction)add:(UIBarButtonItem *)sender
{
    
    // 0. 取出最后一个子控件
    UIView *last = [self.view.subviews lastObject];
    // 新增行的Y值 = 最后一个子控件的Y + 最后一个子控件的高度 + 间距
    CGFloat rowY = (last.frame.origin.y + last.frame.size.height + 1);
    
    // 1. 创建一行
    UIView *rowView = [self createRowView];
    
    // 2.添加一行到控制器的view中
    [self.view addSubview:rowView];
    
    // 3. 让TrashItem有效
    _trashItem.enabled = YES;
    
    // 4. 执行动画
    rowView.frame = CGRectMake(320, rowY, 375, kRowH);
    rowView.alpha = 0;
    
    // 4.1 开始动画
    //[UIView beginAnimations:nil context:nil];
    //[UIView setAnimationDuration:1.0];
    
//    [UIView animateWithDuration:1.0 animations:^{
//        rowView.frame = CGRectMake(0, rowY, 375, kRowH);
//        rowView.alpha = 1;
//    }];
    
    [UIView animateWithDuration:kDuration animations:^{
        rowView.frame = CGRectMake(0, rowY, 375, kRowH);
        rowView.alpha = 1;
    } ];

    //[UIView commitAnimations];
    
}


#pragma  mark 创建一行
// xib == nib
- (UIView *) createRowView
{
    NSString *icon = [NSString stringWithFormat:@"小埋%02d.jpg",arc4random_uniform(9)];
    NSString *name = _allNames[arc4random_uniform((int)_allNames.count)];
    RowView *rowView = [RowView rowViewWithIcon:icon name:name];
    

   
    return rowView;
}

# pragma mark 监听删除像按钮点击
- (void)deleteClick:(UIButton *)btn
{
    [UIView animateWithDuration:kDuration animations:^{
        CGRect tempF = btn.superview.frame;
        tempF.origin.x = 320;
        btn.superview.frame = tempF;
        btn.alpha = 0;
    }completion:^(BOOL finished) {
        
        // 1. 检测即将删除的这行在数组中的位置
        int startIndex = (int)[self.view.subviews indexOfObject:btn.superview];
        
        // 2. 删除当前行
        [btn.superview removeFromSuperview];
        
        // 3. 遍历移动后面的子控件
        [UIView animateWithDuration:(kDuration * 0.5) animations:^{
            for (int i = startIndex; i<self.view.subviews.count; i++) {
                UIView *child = self.view.subviews[i];
                CGRect tempF = child.frame;
                tempF.origin.y -= kRowH + 1;        // tempF.size.height == kRowH   1 ---- margin
                child.frame = tempF;
            }
        }];
        // 4. 若剩余子控件个数不为1, 则可以点击"trashItem"
       _trashItem.enabled = (self.view.subviews.count != 1);
    }];
    
}

# pragma mark 监听头像按钮点击
- (void)iconClick:(UIButton *)btn
{
    // 1.取得按钮父控件（因为label和btn处在同一个父控件中）
    // btn.superview
    
    // 2. 获得文本标签
    UILabel *label = (UILabel *)[btn.superview viewWithTag:kNameTag];
    
    // 3.打印
    NSLog(@"%@",label.text);
    
}

# pragma mark 删除一行
- (IBAction)remove:(UIBarButtonItem *)sender
{
    // 1. 取出最后一个子控件
    UIView *last = [self.view.subviews lastObject];
   
   // 判断是否为UIToolbar
    //if ([last isKindOfClass:[UIToolbar class]])
    //{
      //  _trashItem.enabled = NO;
        //return;
    //}
    
     // 2.移除子控件
    [UIView animateWithDuration:kDuration animations:^{
        CGRect tempF = last.frame;
        tempF.origin.x = 320;
        last.frame = tempF;
        
        last.alpha = 0;
    } completion:^(BOOL finished) {
         [last removeFromSuperview];
        
        // 3.判断剩下的子控件个数
        //if (self.view.subviews.count == 1) {
        //  _trashItem.enabled = NO;
        //}
        // 若剩余子控件个数不为1, 则可以点击"trashItem"
        _trashItem.enabled = (self.view.subviews.count != 1);
    }];
    
    
    
}
@end

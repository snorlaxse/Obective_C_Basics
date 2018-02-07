//
//  ViewController.m
//  07-联系人管理
//
//  Created by Captain on 07/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

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
    
    _allNames =@[@"天行健，君子以自强不息",@"地势坤，君子以厚德载物",@"如山间清爽的风",@"一个人的心需要另一个人来点亮"];

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
- (UIView *) createRowView
{
    // 1. 创建父控件
    //UIView *rowView = [[UIView alloc] initWithFrame:CGRectMake(0, rowY, 375, kRowH)];
    UIView *rowView = [[UIView alloc] init];
    //rowView.frame = CGRectMake(0, rowY, 375, kRowH); /*无动画*/
    
    rowView.backgroundColor = [UIColor purpleColor];
    
    // 2. 添加描述(标签)
    UILabel *desc = [[UILabel alloc] init];
    desc.frame = CGRectMake(0, 0, self.view.frame.size.width, kRowH);
    //desc.center = CGPointMake(160, kRowH * 0.5);
    int nameIndex = arc4random_uniform((int)_allNames.count);
    desc.text = _allNames[nameIndex];
    desc.numberOfLines = 0;
    // 设置文字居中
    desc.textAlignment = NSTextAlignmentCenter;
    
    
    desc.tag = kNameTag;
    
    [rowView addSubview:desc];
    
    // 3. 添加头像
    //UIButton *icon = [[UIButton alloc] init];
    UIButton *icon = [UIButton buttonWithType:UIButtonTypeCustom];
    icon.frame = CGRectMake(20, 0, 40, 40);
    
    // 随机产生文件名
    //int randomIndex = arc4random() % 9;
    int randomIndex = arc4random_uniform(9);
    NSString *iconName = [NSString stringWithFormat:@"小埋%02d.jpg",randomIndex];
    [icon setBackgroundImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    
    // 设置按钮边界圆角
    icon.layer.masksToBounds = YES;
    icon.layer.cornerRadius = 5;
    
    // 监听监听器
    [icon addTarget:self action:@selector(iconClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [rowView addSubview:icon];
    
    
    return rowView;
}

# pragma mark 监听按钮点击
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

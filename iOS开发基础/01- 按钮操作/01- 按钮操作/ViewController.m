//
//  ViewController.m
//  01- 按钮操作
//
//  Created by Captain on 29/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#define kDelta 50
//const int DELTA = 50;     /* C++ 写法 */

#import "ViewController.h"

@interface ViewController ()

@end



/*
 一、 控件的属性
 1. frame
 `@property(nonatomic) CGRect  frame;`
 1> 表示控件的位置和尺寸（以父控件的左上角为坐标原点(0,0)）
 2> 修改这个属性，可以调整控件的位置和尺寸
 
 2. center
 `@property(nonatomic) CGPoint center;      // center is center of frame.`
 1> 表示控件的中点(以父控件的左上角为坐标原点)
 2> 修改这个属性，可以调整控件的位置
 
 3. bounds
 1> 表示控件的位置和尺寸(以自己的左上角坐标原点，位置永远是(0,0))
 2> 修改这个属性，只能调整控件的尺寸
 
 4. tag
 `@property(nonatomic) NSInteger tag;       // default is 0`
 1> 表示控件的标识
 2> 通过不同标识可以区分不同的控件
 
 5. transform
 1> 表示控件的形变状态(旋转角度、缩放比例)
 2> 创建
 ```
 CGAffineTransformIdentity;     // 重置形变
 CGAffineTransformRotate(CGAffineTransform t, CGFloat angle);   // 旋转(效果可累加)
 CGAffineTransformScale(CGAffineTransform t, CGFloat sx, CGFloat sy);   // 缩放(效果可累加)
 ```
 
 */
@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 设置btn圆角
//    self.btn.layer.masksToBounds = YES;
//    self.btn.layer.cornerRadius = 10;
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnClickWithBlock:(void (^)(void)) block
{
    // 0. 动画(头部-开始动画)
    [UIView beginAnimations:nil context:nil];
    // 设置动画的执行时间
    [UIView setAnimationDuration:0.6];
    
    block();
    
    // 1. 动画(尾部---提交动画---执行动画)
    [UIView commitAnimations];
}

# pragma mark 控制按钮移动(上下左右)
- (IBAction)move:(id)sender
{
    //NSLog(@"%@",sender);
    
    [self btnClickWithBlock:^{
        
        // OC语法规定:不允许直接修改 某个对象结构体属性的成员
        
        // 1. 先取出frame\center (值调用)
        // CGRect tempFrame = _btn.frame ;  // 结构体变量 声明时无*
        CGPoint tempCenter = _btn.center;
        
        // 2. 修改坐标值
        NSUInteger tag = [sender tag];
        //CGFloat delta = 50;
        switch (tag) {
            case 1:     // top
                //tempFrame.origin.y -= kDelta;
                tempCenter.y -= kDelta;
                break;
            case 2:     // bottom
                //tempFrame.origin.y += kDelta;
                tempCenter.y += kDelta;
                break;
            case 3:     // left
                //tempFrame.origin.x -= kDelta;
                tempCenter.x -= kDelta;
                break;
            case 4:     // right
                //tempFrame.origin.x += kDelta;
                tempCenter.x += kDelta;
                break;
                
            default:
                break;
        }
        
        // 3. 重新赋值按钮的frame\center
        // _btn.frame = tempFrame;
        _btn.center = tempCenter;
        
    }];
    
    
}

# pragma mark 旋转
- (void)rotate:(id)sender
{
    [self btnClickWithBlock:^{
        
        // 弧度制 3.14 --- PI --- 180°  即M_PI_4 --- 45°
        // 顺时针旋转: 正值  逆时针旋转: 负值
        //_btn.transform = CGAffineTransformMakeRotation(- M_PI_4); /*仅在初始状态上作旋转，操作结果不累加*/
        
        /*
         if ([sender tag] == 1)
         {
         _btn.transform = CGAffineTransformRotate(_btn.transform, - M_PI_4);
         }else if ([sender tag] == 2)
         {
         _btn.transform = CGAffineTransformRotate(_btn.transform, M_PI_4);
         }
         */
        
        _btn.transform = CGAffineTransformRotate(_btn.transform,  M_PI_4 * ((1 == [sender tag])? -1 : 1 ));    // 代码量更小
       
    }];
    
    
}


# pragma mark 缩放
- (void)zoom:(id)sender
{
    [self btnClickWithBlock:^{
        
        // 缩放(放大\缩小)为原来的scale倍
        CGFloat scale = (1 == [sender tag])? 1.2 : 0.8;
        _btn.transform = CGAffineTransformScale(_btn.transform, scale, scale);
        
        
    }];
    
    
    //_btn.transform = CGAffineTransformMakeScale(scale, scale);
    /*
     if ([sender tag] == 1){
     
     // 缩放(放大)为原来的scale倍
     CGFloat scale = 1.2;
     _btn.transform = CGAffineTransformScale(_btn.transform, scale, scale);
     
     }else if ([sender tag] == 2)
     {
     
     // 缩放(缩小)为原来的scale倍
     CGFloat scale = 0.8;
     _btn.transform = CGAffineTransformScale(_btn.transform, scale, scale);
     
     }
     */
    
}


#pragma mark 重置
- (IBAction)btnReset:(id)sender
{
    [self btnClickWithBlock:^{
        
        // 清空之前所有的形变状态(消除以前的旋转、缩放等状态)
        _btn.transform = CGAffineTransformIdentity;
        
    }];
    
    
}

@end

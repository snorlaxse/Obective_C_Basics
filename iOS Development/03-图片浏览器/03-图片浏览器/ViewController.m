//
//  ViewController.m
//  03-图片浏览器
//
//  Created by Captain on 03/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *_allDescs;
}
@end

@implementation ViewController


#pragma  mark 控制器的view加载完毕后会调用一次
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1. 获得所有描述(通过解析plist文件来创建数组对象，比如传入文件的全路径)
    // 如果要访问项目中资源包里面的所有资源.应该用mainBundle
    NSBundle *bundle =  [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"desc" ofType:@"plist"];
    
    // 加载path对应的文件来创建数组
    _allDescs = [NSArray arrayWithContentsOfFile:path];
    
    // 2. 设置默认的描述
    _imageDesc.text = _allDescs[0];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)sliderValueChange:(UISlider *)sender {
    
    // 1.设置中间的图片
    // 获得图片名称
    NSString *imageName = [NSString stringWithFormat:@"%.f.jpg",sender.value + 1];  // %.f 不保留任何小数
   
    _imageView.image = [UIImage imageNamed:imageName];
    //[_imageView setImage:<#(UIImage * _Nullable)#>];
    
    // 2.设置序号
    _imageNo.text = [NSString stringWithFormat:@"%.f/12",sender.value + 1]; // value 从 0 开始
    
    // 3.设置描述
    int no = (int)(sender.value + 0.5);
    _imageDesc.text = _allDescs[no];
    
}

# pragma mark 点击了设置
-(IBAction)setting
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    //_settingView.frame.origin.y = 20;
    
    // 1. 取出中点
    CGPoint tempCenter = _settingView.center;
    
    // 2. 修改
    // tempCenter.y -= _settingView.bounds.size.height;
    
    if (_settingView.frame.origin.y == self.view.frame.size.height){ // 设置界面目前不可见
    tempCenter.y -= _settingView.frame.size.height;
    }else{  // 设置界面可见
        tempCenter.y += _settingView.frame.size.height;
    }
    
    // 3. 重新赋值
    _settingView.center = tempCenter;
    
    [UIView commitAnimations];
    
}

- (IBAction)imageSizeChange:(UISlider *)sender
{

 /*
    // 1. 取出frame
    CGRect tempFrame = _imageView.frame;

    // 2. 修改frame
    tempFrame.size.width = sender.value * 343;
    tempFrame.size.height = sender.value * 222;
    
    // 3. 重新赋值frame
    _imageView.frame = tempFrame;
  */
    _imageView.transform = CGAffineTransformMakeScale(sender.value, sender.value);
}

- (IBAction)nightMode:(UISwitch *)sender
{
    if (sender.on ) {   // 开
        self.view.backgroundColor = [UIColor darkGrayColor];
    }else{  // 关
        self.view.backgroundColor = [UIColor whiteColor];
    }
    
}
@end

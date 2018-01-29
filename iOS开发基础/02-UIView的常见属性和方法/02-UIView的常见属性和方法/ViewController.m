//
//  ViewController.m
//  02-UIView的常见属性和方法
//
//  Created by Captain on 29/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@end

@implementation ViewController

- (void)btnClick:(UIButton *)btn
{
    NSLog(@"%ld个子控件",self.view.subviews.count);
    
    if (btn.tag == 10)
    {
        NSLog(@"点击了上面的Button");
    }else if(btn.tag == 20)
    {
        NSLog(@"点击了上面的Button");
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.h
//  01-第一个iOS程序
//
//  Created by Captain on 28/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//


//IBAction --- 方法
//IBOutlet --- 属性


#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// 声明一个方法来监听按钮点击  IBAction == void 能否让方法显示到storyboard文件的右击列表
- (IBAction)btnClick;


// 声明2个属性用来保存2个文本输入框 IBOutlet:能否让属性显示到storyboard文件的右击列表
@property (nonatomic, weak) IBOutlet UITextField *num1;
@property (nonatomic, weak) IBOutlet UITextField *num2;

@property (nonatomic, weak) IBOutlet UILabel *result;


@end


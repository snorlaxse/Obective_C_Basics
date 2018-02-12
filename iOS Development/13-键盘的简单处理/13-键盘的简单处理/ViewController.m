//
//  ViewController.m
//  13-键盘的简单处理
//
//  Created by Captain on 10/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIToolbar *keyboardTool = [[NSBundle mainBundle] loadNibNamed:@"keyboardTool" owner:nil options:nil][0];
    
    // 设置键盘顶部显示的工具条
    _nameField.inputAccessoryView = keyboardTool;
    _phoneField.inputAccessoryView = keyboardTool;
    _addressField.inputAccessoryView = keyboardTool;
    
    // 自定义键盘
    //_nameField.inputView
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 退出键盘
- (IBAction)exitKeyBoard:(UIButton *)sender
{
    // 响应者: 能处理事件的对象
    // 第一响应者: 此时,调出键盘的文本框
    
    // 退出键盘
    //[_nameField resignFirstResponder];
    //[_phoneField resignFirstResponder];
    //[_addressField resignFirstResponder];
    
    // self.view 内部所有子控件(文本框)都会退出键盘
    [self.view endEditing:YES];
    
}
@end

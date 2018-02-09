//
//  ViewController.m
//  08-xib_owner
//
//  Created by Captain on 08/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()
{
    Person *_p1;
    Person *_p2;
}

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 加载xib文件
    NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"MyView" owner:self options:nil];
    
    UIView *greenView = array[0];
    CGRect temF = greenView.frame;
    temF.origin.y = 20;
    greenView.frame = temF;
    
    // 2. 添加到控制器的view
    [self.view addSubview:greenView];
    
    // 3. 监听按钮操作
//    UIButton *left = (UIButton *)[greenView viewWithTag:10];
//    [left addTarget:self action:@selector(leftClick) forControlEvents:(UIControlEventTouchUpInside)];
//
//    UIButton *right = (UIButton *)[greenView viewWithTag:20];
//    [right addTarget:self action:@selector(rightClick) forControlEvents:(UIControlEventTouchUpInside)];
    
    _p1 = [[Person alloc] init];
    _p1.age = 10;
    
    _p2 = [[Person alloc] init];
    _p2.age = 20;
    
    UIView *blueView = [[NSBundle mainBundle] loadNibNamed:@"HerView" owner:_p1 options:nil][0]; // 可见，亦可将类实例作为owner. 唯有确定owner，才能确定关联哪一对象的内部方法
   
    blueView.center = CGPointMake(375 * 0.5, 110);
    
    [self.view addSubview:blueView];
 

}

- (void)leftClick
{
    NSLog(@"left-------------");
}

- (void)rightClick
{
    NSLog(@"right-------------");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (nullable NSArray *)loadNibNamed:(NSString *)name owner:(nullable id)owner options:(nullable NSDictionary *)options
//{
//    // 解析MyView.xib文件 --- XML
//    
//    // 创建Objects下面的所有对象
//    // 创建View
//    UIView *blue = [[UIView alloc] init];
//    blue.backgroundColor = [UIColor blueColor];
//    // ...设置View其他属性
//
//    // 创建按钮
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [btn setTitle:@"我是按钮" forState:UIControlStateNormal];
//    [btn addTarget:owner action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
//    // ...设置Button其他属性
//    
//    [blue addSubview:btn];
//    
//    // 创建文本输入框
//    UITextField *field = [[UITextField alloc] init];
//    // ...设置field其他属性
//
//    return @[blue,field];
//}


@end

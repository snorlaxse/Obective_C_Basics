//
//  ViewController.m
//  21-UITableView-自定义cell
//
//  Created by Captain on 13/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"
#import "MyCell2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 注册一个xib文件
    // 如果tableView通过@"Cell"这个标志去缓存池中没有取到可循环利用的Cell，就会加载MyCell1.xib文件来创建cell
    //[self.tableView registerNib:[UINib nibWithNibName:@"MyCell1" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.tableView registerClass:[MyCell2 class] forCellReuseIdentifier:@"cell2"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0. 定义一个标识
//    static NSString *ID = @"Cell";
//
//    // 1.去缓存池中取出可循环利用的cell
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//
    // 2.缓存池没有可循环利用的cell，重新创建cell
//    if (cell == nil) {
//        cell = [[NSBundle mainBundle] loadNibNamed:@"MyCell1" owner:nil options:nil][0];    // @"MyCell1" 不加后缀名".xib"
//    }
    
    // 3. 传递模型数据

    
    MyCell2 *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
    
//    if (cell == nil) {
//        cell = [[MyCell2 alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell2"];
//    }
//
    return cell;
    
}

@end

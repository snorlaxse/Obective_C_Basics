//
//  ViewController.m
//  16-UITableView01-性能优化的应用
//
//  Created by Captain on 17/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.加载plist，array中装的都是NSDictionary对象
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shop.plist" ofType:nil];
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"shop" ofType:@"plist"];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];    // arrayWithContentsOfFile:方法 传得是 全路径
    
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 定义一个标识
    NSString *ID = [NSString stringWithFormat:@"cell-TB"];
    
    // 2.去缓存池里取出可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];   // 注意：dequeueReusableCellWithIdentifier:是tableView的类方法
    
    // 3. 若缓存中没有可循环利用的cell
    if ( cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
    }
    
    return cell;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

//
//  ViewController.m
//  14-UITableView01-多组数据展示
//
//  Created by Captain on 12/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

#define kGroup 3

@interface ViewController ()    <UITableViewDataSource>
{
    NSArray *_zjCities;
    NSArray *_sxCities;
    NSArray *_jsCities;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1. 添加UITableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:(UITableViewStyleGrouped)];
    
    tableView.dataSource = self;
    
    [self.view addSubview: tableView];
    
    // 2. 初始化数据
    // 浙江
    _zjCities = @[@"杭州",@"宁波",@"温州",@"余姚"];
    // 陕西
    _sxCities = @[@"西安",@"延安",@"天水"];
    // 江苏
    _jsCities = @[@"南京",@"扬州"];
    
}

#pragma  mark - 数据源方法
#pragma mark 一共有多少组(section = 区域\组)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //NSLog(@"numberOfSections");
    
    return kGroup;
}

#pragma mark 第section组一共有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"numberOfRows");
    
    if (section == 0) { // 浙江
        return _zjCities.count;
    }else if(section == 1){      // 陕西
        return _sxCities.count;
    }else {    // 江苏
        return _jsCities.count;
    }
}

#pragma mark 返回每一行显示的内容(每一行显示怎样的cell)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"cellForRow-------");
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
    
    // indexPath标识唯一的行 --- 第Section组的第row行
    //indexPath.section
    //indexPath.row
    
    //cell.textLabel.text = [NSString stringWithFormat:@"第 %ld 组的第 %ld 行",(long)indexPath.section,(long)indexPath.row];
    
    if (indexPath.section == 0) {  // 浙江
        cell.textLabel.text = _zjCities[indexPath.row];
    }else if(indexPath.section == 1){   // 陕西
        cell.textLabel.text = _sxCities[indexPath.row];
    }else if (indexPath.section == 2){  // 江苏
        cell.textLabel.text = _jsCities[indexPath.row];
    }
    
    return cell;
}
@end

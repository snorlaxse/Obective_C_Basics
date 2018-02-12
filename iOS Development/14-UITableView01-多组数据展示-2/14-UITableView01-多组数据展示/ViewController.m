//
//  ViewController.m
//  14-UITableView01-多组数据展示
//
//  Created by Captain on 12/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

// 省份字典中用到的key
#define kHeader @"header"
#define kFooter @"footer"
#define kCities @"cities"

@interface ViewController ()    <UITableViewDataSource>
{
    
    NSArray *_allProvince;
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
    _allProvince = @[
                     @{
                         kHeader : @"浙江",
                         kFooter : @"(∩_∩)",
                         kCities : @[@"杭州",@"宁波",@"温州",@"余姚"]
                         },
                     @{
                         kHeader : @"陕西",
                         kFooter : @"O_~",
                         kCities : @[@"西安",@"延安",@"韩城",@"渭南"]
                         },
                     @{
                         kHeader : @"江苏",
                         kFooter : @"^O^ ",
                         kCities : @[@"南京",@"扬州",@"无锡",@"苏州"]
                         },
                     @{
                         kHeader : @"山东",
                         kFooter : @"(⊙o⊙)",
                         kCities : @[@"济南",@"青岛",@"威海",@"烟台"]
                         },
                     @{
                         kHeader : @"安徽",
                         kFooter : @"QAQ",
                         kCities : @[@"合肥",@"芜湖",@"蚌埠",@"淮南"]
                         }
                     ];

    
}

#pragma  mark - 数据源方法
#pragma mark 一共有多少组(section = 区域\组)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return _allProvince.count;
}

#pragma mark 第section组一共有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 1. 取得第section组的省份名
    NSDictionary *province =  _allProvince[section];
    
    // 2. 取出省份对应的城市名
    NSArray *cities = province[@"cities"];
    
    // 3. 城市的个数
    return cities.count;
    
}

#pragma mark 返回每一行显示的内容(每一行显示怎样的cell)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
    
    // 1.取出第section组的第row行的文字数据
    NSDictionary *province =  _allProvince[indexPath.section];
    NSArray *cities = province[kCities];
    NSString *text = cities[indexPath.row];
    
    // 2.展示文字数据
    cell.textLabel.text = text;
    
    return cell;
}

#pragma mark 第section组显示的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *province =  _allProvince[section];
    NSString *header = province[kHeader];
    return header;
}

#pragma mark 第section组显示的尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    
    return  _allProvince[section][kFooter];
}
@end

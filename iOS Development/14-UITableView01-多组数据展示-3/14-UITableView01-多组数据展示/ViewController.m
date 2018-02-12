//
//  ViewController.m
//  14-UITableView01-多组数据展示
//
//  Created by Captain on 12/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"

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
    // 浙江(模型对象，数据对象，Model，仅仅用来存放数据的对象)
    Province *zj = [[Province alloc] init];
    zj.header = @"浙江";
    zj.footer = @"(∩_∩)";
    zj.cities = @[@"杭州",@"宁波",@"温州",@"余姚"];
    
    Province *sx = [[Province alloc] init];
    sx.header = @"陕西";
    sx.footer = @"O_~";
    sx.cities = @[@"西安",@"延安",@"韩城",@"渭南"];
    
    Province *js = [[Province alloc] init];
    js.header = @"江苏";
    js.footer = @"^O^ ";
    js.cities = @[@"南京",@"扬州",@"无锡",@"苏州"];
    
    Province *sd = [[Province alloc] init];
    sd.header =  @"江苏";
    sd.footer =  @"^O^ ";
    sd.cities =  @[@"南京",@"扬州",@"无锡",@"苏州"];
    
    Province *ah = [[Province alloc] init];
    ah.header = @"安徽";
    ah.footer = @"QAQ";
    ah.cities = @[@"合肥",@"芜湖",@"蚌埠",@"淮南"];
    
    _allProvince = @[zj,sx,js,sd,ah];

    
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
    Province *province =  _allProvince[section];
    
    // 2. 取出省份对应的城市名
    NSArray *cities = province.cities;
    
    // 3. 城市的个数
    return cities.count;
    
}

#pragma mark 返回每一行显示的内容(每一行显示怎样的cell)
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
    
    // 1.取出第section组的第row行的文字数据
    Province *province =  _allProvince[indexPath.section];
    NSString *text = province.cities[indexPath.row];
    
    // 2.展示文字数据
    cell.textLabel.text = text;
    
    return cell;
}

#pragma mark 第section组显示的头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Province *province =  _allProvince[section];
    
    return province.header;
}

#pragma mark 第section组显示的尾部标题
-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    
    return  [_allProvince[section] footer];
}
@end

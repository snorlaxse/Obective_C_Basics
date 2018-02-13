//
//  ViewController.m
//  15-UITableView02-单组数据展示
//
//  Created by Captain on 12/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 一共1组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

#pragma mark 这一组里面有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 9;
}

#pragma mark 返回地indexPath这行对应的内容
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    /*
     Default : 不显示detailTextLabel
     Value1 : 在右边显示detailTextLabel
     Value2 : 不显示图片，显示detailTextLabel
     Subtitle : 在底部显示detailTextLabel
     */
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:nil];
    
    NSString *imageName = [NSString stringWithFormat:@"00%ld.png",indexPath.row + 1];
    cell.imageView.image = [UIImage imageNamed:imageName];
    
    cell.textLabel.text = [NSString stringWithFormat:@"产品--%ld",(long)indexPath.row];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"产品%ld很棒",indexPath.row];
    
    // 设置右边的小图标
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 自定义最右边显示的控件
    //cell.accessoryView = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
    
    return cell;
}


#pragma mark - 代理方法
#pragma mark 返回indexPath这行cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}
@end

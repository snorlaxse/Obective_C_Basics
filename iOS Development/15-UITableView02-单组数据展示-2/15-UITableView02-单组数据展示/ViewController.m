//
//  ViewController.m
//  15-UITableView02-单组数据展示
//
//  Created by Captain on 12/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"
#import "Shop.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>
{
    NSMutableArray *_shops;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 创建数组
    _shops = [NSMutableArray array];
    
    // 创建数据
    Shop *shop1 = [Shop shopWithName:@"图书/音像" icon:@"001.png" desc:@"小说，情感..."];
    Shop *shop2 = [Shop shopWithName:@"玩具" icon:@"002.png" desc:@"积木,小汽车"];
    
    [_shops addObjectsFromArray:@[shop1,shop2]];
    
    // 添加假数据
    for (int i = 0; i<20; i++) {
        NSString *icon = [NSString stringWithFormat:@"00%d.png",(i % 9) + 1];
        NSString *name = [NSString stringWithFormat:@"产品%d",i + 1];
        NSString *desc = [NSString stringWithFormat:@"产品%d好好好", i + 1];
        
        Shop *shop = [Shop shopWithName:name icon:icon desc:desc];
        
        [_shops addObject:shop];
        
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 一共1组
// 不实现此方法，默认就是1组
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
//{
//    return 1;
//}

#pragma mark 这一组里面有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _shops.count;
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
    
    Shop *shop = _shops[indexPath.row];
    
    
    cell.imageView.image = [UIImage imageNamed:shop.icon];
    
    // 名称
    cell.textLabel.text = shop.name;
    
    // 描述
    cell.detailTextLabel.text = shop.desc;
    
    // 设置右边的小图标
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    // 自定义最右边显示的控件
    //cell.accessoryView = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
    
    return cell;
}


#pragma mark 选中了某一行的cell就会调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0.取出所点击这行的产品对象
    int row = (int)indexPath.row;
    Shop *shop = _shops[row];
    
    // 1.创建弹框
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"产品展示" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    // 设置样式（一个明文文本框）
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        
        textField.placeholder = @"请输入用户名" ;
        
        // 设置文本框的默认文字
        textField.text = shop.name;
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        NSString *text = alertController.textFields[0].text;
        
        shop.name = text;
        
        ;

        // 刷新表格
        //[_tableView reloadData]; // 整体刷新（每一行都会刷新）
        
        NSArray *paths = @[indexPath];
        [_tableView reloadRowsAtIndexPaths:paths withRowAnimation:(UITableViewRowAnimationLeft)];

        /*
         重新向数据源索取数据
         重新向数据源发送消息
         重新调用数据源的方法，根据返回值决定显示什么数据
         */
        
    }];
    
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
    
    
}



@end

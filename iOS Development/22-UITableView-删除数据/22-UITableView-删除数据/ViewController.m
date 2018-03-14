//
//  ViewController.m
//  22-UITableView-删除数据
//
//  Created by Captain on 14/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_persons;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _persons = [NSMutableArray array];
    for (int i = 0; i<30; i++) {
        Person *p = [[Person alloc] init];
        p.name = [NSString stringWithFormat:@"Person --- %d",i];
        p.phone = [NSString stringWithFormat:@"%d",10000 + arc4random_uniform(100000)];
        [_persons addObject:p];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _persons.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0. 定义一个标识
    static NSString *ID = @"cell";
    
    // 1.去缓存池中取出可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.缓存池没有可循环利用的cell，重新创建cell
    if (cell == nil) {
        //cell = [[NSBundle mainBundle] loadNibNamed:@"<#name#>.xib" owner:nil options:nil][0];
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:ID];
    }
    
    // 3. 传递模型数据
    Person *p = _persons[indexPath.row];
    cell.textLabel.text = p.name;
    cell.detailTextLabel.text = p.phone;
    
    return cell;
    


}

#pragma mark 代理方法
#pragma mark 用户提交一个编辑操作时就会调用(比如说点击了"delete"按钮)
/*只要实现了这个方法，就会默认添加滑动删除功能*/
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 如果不是删除操作，直接返回
    if (editingStyle != UITableViewCellEditingStyleDelete)         return;
    
    
    // 1. 刷新模型数据
    [_persons removeObjectAtIndex:indexPath.row];
    
    // 2. 刷新表格
    //[tableView reloadData];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationTop)];
}

#pragma mark 排序 - 当移动了某一行cell就会调用
/*只要实现了这个方法，就会默认添加排序功能*/
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //[_persons exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    
    // 1. 取出要拖动的模型数据
    Person *p = _persons[sourceIndexPath.row];
    
    // 2. 删除之前位置的模型
    [_persons removeObjectAtIndex:sourceIndexPath.row];
    
    // 3.将p插入到最新的位置
    [_persons insertObject:p atIndex:destinationIndexPath.row];
    
}

#pragma mark 删除
- (IBAction)remove:(id)sender {
    // 1.进入编辑模式
    //self.tableView.editing = YES;     // 默认进入删除模式
    BOOL result = !self.tableView.editing;
    [self.tableView setEditing:result animated:YES];
}
@end

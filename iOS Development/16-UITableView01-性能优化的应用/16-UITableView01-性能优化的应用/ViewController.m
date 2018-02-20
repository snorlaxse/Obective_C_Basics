//
//  ViewController.m
//  16-UITableView01-性能优化的应用
//
//  Created by Captain on 17/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"
#import "Shop.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_shops;
    NSMutableArray *_deleteShops;   // 存放即将要删除的模型数据 (此时存放的是Shop对象)
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 1.加载plist，array中装的都是NSDictionary对象
    NSString *path = [[NSBundle mainBundle] pathForResource:@"shops.plist" ofType:nil];
    //NSString *path = [[NSBundle mainBundle] pathForResource:@"shop" ofType:@"plist"];
    
    NSArray *array = [NSArray arrayWithContentsOfFile:path];    // arrayWithContentsOfFile:方法 传得是 全路径
    
    // 2. 将array中的字典对象转成 Shop模型对象
    _shops = [NSMutableArray array];
    
    for (NSDictionary *dict in array) {    // 注意 dict的类是NSDictionary
        
        // 2.1.创建模型
        /*Shop *s = [[Shop alloc] init];
        s.name = dict[@"name"];
        s.icon = dict[@"icon"];
        s.desc = dict[@"desc"];*/
        
        //Shop *s = [[Shop alloc] initWithDict:dict];
        Shop *s = [Shop shopWithDict:dict];
        
        
        // 2.2.将模型对象放进数组中
        [_shops addObject:s];
        
    // 3. 初始化_deleteShops
        _deleteShops = [NSMutableArray array];
        
    }
    }

#pragma mark - 数据源方法
#pragma mark 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // 显示“选中数”
    if (_deleteShops.count) {
        _trashItem.enabled = YES;
        _selectedLabel.text = [NSString stringWithFormat:@"选中(%lu)",(unsigned long)_deleteShops.count];
    }else{  // 未选中任一cell
        _trashItem.enabled = NO;
        _selectedLabel.text = [NSString stringWithFormat:@"选中(0)"];
    }
    
    return _shops.count;
}

#pragma mark 每一行显示怎样的cell（内容）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 定义一个标识
    NSString *ID = [NSString stringWithFormat:@"cell-TB"];
    
    // 2.去缓存池里取出可循环利用的cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];   // 注意：dequeueReusableCellWithIdentifier:是tableView的类方法
    
    // 3. 若缓存中没有可循环利用的cell
    if ( cell == nil) {
         cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier:ID];
    }
    
    // 4.显示商品数据
    // 4.0.取出indexPath这行对应的商品shop模型对象
    Shop *s = _shops[indexPath.row];
    
    // 4.1.商品图片
    cell.imageView.image = [UIImage imageNamed:s.icon];
    
    // 检测打钩状态
    // 加深对- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath方法调用过程的理解
    if ([_deleteShops containsObject:s]) {  // 注:虽然可视范围中利用的是循环利用的cell,但其数据各不相同,可借此作为判断(比较)的依据(利用数据源方法，数据模型思想)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else { // 不需要打钩
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    // 4.2.商品名称
    cell.textLabel.text = s.name; // NOT "[NSString stringWithFormat:s.name]"
    
    // 4.3.商品描述
    cell.detailTextLabel.text = s.desc;
    
    

    return cell;
}


#pragma mark - 代理方法
#pragma mark 每一行的高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

#pragma mark 监听cell的点击
#pragma mark 选中了某一行就会调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 每个cell都有选中状态（selected）
    // 家居 --> 未选中 selected = NO
    // 美食 --> 选中 selected = YES
    
    // 0.取消选中这一行（去掉cell默认的蓝色背景）
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
//    取出indexPath这行对应的cell
//    直接将所选行“打钩”  缺陷: 因为cell是循环利用的，即将出现的相应cell亦被"打钩"
//    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
//    selectedCell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    // 1.控制当前行的数据是否需要选中
    Shop *s = _shops[(int)indexPath.row];   // 注：虽然可视范围中利用的是循环利用的cell，但其数据各不相同，可借此作为判断(比较)的依据
    if ([_deleteShops containsObject:s]) {  // 二次选中,清除"打钩状态"
        [_deleteShops removeObject:s];
    }else{  // 首(奇数)次选中,添加"打钩"状态
        [_deleteShops addObject:s];
    }
    
    // 2.刷新表格
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:(UITableViewRowAnimationFade)];     // 刷新所选cell -- 添加"打钩"效果
    

}
 

#pragma mark 取消选中了某一行就会调用
//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//}

#pragma mark 删除数据
- (IBAction)remove:(id)sender {
    // 0.获得所要删除数据的行号
    NSMutableArray *deletePaths = [NSMutableArray array];
    for (Shop *s in _deleteShops) {
        NSInteger row = [_shops indexOfObject:s];
        NSIndexPath *path = [NSIndexPath indexPathForRow:row inSection:0];
        [deletePaths addObject:path];
    }
    
    // 1.删除模型数据(将_deleteShops中的所有对象元素从_shops中删除)
    [_shops removeObjectsInArray:_deleteShops];
    
    // 2.清空_deleteShops(清空已经删除的数据)
    [_deleteShops removeAllObjects];
    
    // 3.刷新表格
    //[_tableView reloadData];
    [_tableView deleteRowsAtIndexPaths:deletePaths withRowAnimation:(UITableViewRowAnimationTop)];
    
    // 4.更改标题
    //_selectedLabel.text = [NSString stringWithFormat:@"选中(0)"];
    
    // 5.让_trashItem不能被点击
    //_trashItem.enabled = NO;
}

- (IBAction)selectAll:(id)sender
{
    if (_deleteShops.count == _shops.count) {
        // 全不选
        [_deleteShops removeAllObjects];
        
        _trashItem.enabled = NO;
        
        
    }else{
        // 全选
        _trashItem.enabled = YES;
        
        for (Shop *s  in _shops) {
            if (![_deleteShops containsObject:s]) {
             [_deleteShops addObject:s];
            }
        }
        
        
    }
  
    // 刷新表格
    [_tableView reloadData];
    
    
    //NSLog(@"%@ - %lu",_deleteShops,(unsigned long)_deleteShops.count);
   
}

- (IBAction)selectOthers:(UIBarButtonItem *)sender
{
    if (_deleteShops.count == _shops.count || _deleteShops.count == 0) {    // 全选 or 全不选
        [self selectAll:nil];
       
    }else{  // 正常反选情况

        NSMutableArray *others = [NSMutableArray array];
        for (Shop *s in _shops) {
            if (![_deleteShops containsObject:s]) {
                [others addObject:s];
            }
            
        }
        
        // 取消现选项
        [_deleteShops removeAllObjects];
        
        // 反选
        [_deleteShops addObjectsFromArray:others];
    }
    
    // 刷新表格
    [_tableView reloadData];
}
@end

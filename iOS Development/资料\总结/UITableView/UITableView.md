### 一、UITableView 

##### 1. 数据展示的条件

1. UITableView的所有数据都是由数据源(`dataSource`)提供的，所以要想在UITableView展示数据，必须设置UITableView的dataSource数据源对象
2. 要想当UITableView的dataSource对象，必须遵守`UITableViewDataSource`协议，实现相应的数据源方法
3. 当UITableView想要展示数据的时候，就会给数据源发送消息(调用数据源方法)，UITableView会根据方法返回值决定展示怎样的数据

##### 2. 数据展示的过程

1. 先调用数据源的`(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView`得知组数
2. 然后调用数据源的`(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section`得知第section组一共有多少行
3. 然后调用数据源的`(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath`得知返回第`indexPath.section`组第`indexPath.row`行显示的内容



##### 3. 常见的数据源方法

1. 一共有多少组

`-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView`

2. 第section组一共有多少行

`-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section`

3. 第indexPath.section组第indexPath.row行显示的内容

`(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath`

4. 第section组显示的头部标题

`-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section`

5. 第section组显示的尾部标题

`-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section`

##### 4. 刷新表格

```
    /*
     重新向数据源索取数据  
     重新向数据源发送消息
     重新调用数据源的方法，根据返回值决定显示什么数据
     */

	//[_tableView reloadData]; /* 整体刷新（每一行都会刷新）*/
        
    //局部刷新
    NSArray *paths = @[indexPath];
    [_tableView reloadRowsAtIndexPaths:paths withRowAnimation:(UITableViewRowAnimationLeft)];

```

##### 5. 性能优化

```
#pragma mark 每当有一个cell进入视野范围内就会调用
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"c1";
    
    // 1.从缓存池中取出可循环利用的cell
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.如果缓存池中没有可循环利用的cell
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行数据",indexPath.row];
    
    return cell;
}
```

##### 6. 代理方法

```
#pragma mark 每一行的高度
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

#pragma mark 监听cell的点击
#pragma mark 选中了某一行就会调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 每个cell都有选中状态（selected）
    // 家居 --> 未选中 selected = NO
    // 美食 --> 选中 selected = YES
    
    ......
    
}

#pragma mark 取消选中了某一行就会调用
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
```



### 二、UIAlertController

##### 1. 创建UIAlertController

```
UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"产品展示" message:nil preferredStyle:UIAlertControllerStyleAlert];

//UIAlertControllerStyleActionSheet \ UIAlertControllerStyleAlert
```

##### 2. 添加文本框

```
[alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {

        // 设置文本框的默认文字
        textField.text = shop.name;

}];
```



##### 3. UIAlertAction

```
	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
	<#code#>
    }];
    
    //添加子控件
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
```



##### 4. 显示alertController

```
[self presentViewController:alertController animated:YES completion:nil];
```




###  一、UITableView 

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

	注：不管是局部刷新or整体刷新，原理都是：
	UITableView重新向数据源(dataSource)和代理(delegate)发送相应的消息，最终将得到的数据展示出来
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

##### 7. 修改Cell的状态

1. 最好***通过"修改模型数据"来修改Cell的状态***
2. 修改步骤
   1. 修改模型数据
   2. 刷新表格
      1. 整体刷新：`reloadData`
      2. 局部刷新：`reloadRowsAtIndexPaths:`



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



### 三、通过nib自定义cell

##### 1. 加载xib文件的两种方法

1> 方法一(NewsCell是xib文件的名称)

```
NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil];
```

2> 方法二

```
UINib *nib = [UINib nibWithNibName:@"NewsCell" bundle:nil];
NSArray *objects = [nib instantiateWithOwner:nil options:nil];  
```



##### 2.设置cell高度

1> 如果每一行cell高度都是一样的，直接使用`tableView`的`rowHeight`属性设置cell的高度即可

```
self.tableView.rowHeight = 80;
```

2>  如果每一行cell高度不一定一样，应该用代理方法设置cell的高度

```
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	// 返回indexPath这行对应cell的高度
    return 80;
}
```



##### 3.UITableViewController

1> UITableViewController内部默认会创建一个`UITableView *tableView`

2> UITableViewController内部tableView的delegate(代理)和dataSource(数据源)就是这个UITableViewController

3> UITableViewController内部tableView就是控制器的view



##### 4. 自定义cell

1. 通过xib
   1. 一定要注意在xib的cell中设置重用标识(reuse identifier)

   2. 封装的步骤

      1. 新建xib描述cell的样子—DealCell.xib
      2. 新建UITableViewCell的子类—DealCell(封装xib内部的所有东西)
      3. 修改xib中的cell的类名(class)为DealCell 
      4. 在DealCell中拥有xib中的所有子控件(声明属性、进行连线)
      5. 新建模型Deal，封装数据
      6. 给DealCell增加模型属性`@property(nonatomic,strong) Deal *deal;`
      7. 重写setDeal:方法，在这个方法中根据模型数据设置cell内部子控件的属性
      8. 提供一个类方法，返回从xib中创建好的cell对象
      9. 给xib中的cell添加一个重用标识(比如deal),提供一个类方法，返回重用标识
      10. 提供一个类方法，返回cell的高度`(CGFloat)cellHeight;`

   3. 使用cell

      1. 设置每一行的高度`self.tableView.rowHeight = [DealCell cellHeight];`

      2. 利用重用标识去缓存池取得cell`DealCell *cell = [tableView dequeueReusableCellWithIdentifier:[DealCell ID]];`

      3. 如果缓存池没有cell，创建cell

         ```
         if (cell == nil) {
                 cell = [DealCell dealCell];
             }
         ```

      4. 传递模型给cell    `cell.deal = _deals[indexPath.row];`

2. 通过代码

   1. 新建一个UITableViewCell的子类——WeiboCell
   2. 在创建cell的时候(`-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier`方法中)添加cell内部需要使用的子控件(注意：只管创建添加子控件，先不要去管子控件的位置和尺寸)
   3. 新建一个模型类——Weibo，增加对应的数据属性
   4. 给WeiboCell增加一个Weibo模型属性，在拿到Weibo模型数据的同时设置子控件的属性
   5. 重写`setWeibo:`方法，在这里面取出Weibo模型的数据显示到子控件上


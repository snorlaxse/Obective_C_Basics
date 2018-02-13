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

##### 
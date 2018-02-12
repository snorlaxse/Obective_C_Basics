一、UITableView的代理方法
#pragma mark 每一行的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath

#pragma mark 选中了某一行就会调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

#pragma mark 取消选中了某一行就会调用
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath

#pragma mark 当用户提交了一个编辑操作就会调用（比如点击了“删除”按钮）
// 只要实现了这个方法，就会默认添加滑动删除功能
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath

#pragma mark 当移动了某一行cell就会调用
// 只要实现了这个方法，就会默认添加排序功能
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath

二、修改Cell的状态
1.最好通过“修改模型数据”来修改Cell的状态

2.修改步骤
1> 修改模型数据
2> 刷新表格
* 整体刷新：reloadData（最重要）
* 局部刷新：reloadRowsAtIndexPaths:withRowAnimation:

三、UITableView常见方法
1.取消选中某一行（去掉cell选中时默认的蓝色背景）
- (void)deselectRowAtIndexPath:(NSIndexPath *)indexPath animated:(BOOL)animated;

2.局部刷新（仅仅刷新indexPaths数组中装着的行）
- (void)reloadRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation

3.整体刷新（屏幕中的每一行都刷新）
- (void)reloadData;

4.直接删除界面上的行数(要求模型数据也要删掉对应的数量)
- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation

5.设置编辑模式
@property(nonatomic,getter=isEditing) BOOL editing; 
- (void)setEditing:(BOOL)editing animated:(BOOL)animated;

// 注意：
不管是局部刷新，还是整体刷新，原理都是：
UITableView重新向数据源（dataSource）和代理（delegate）发送相应的消息，最终将得到的数据展示出来

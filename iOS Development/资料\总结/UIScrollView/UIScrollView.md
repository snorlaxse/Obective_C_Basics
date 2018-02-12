### 一、UIScrollView : UIVIew

#### 1. 常见属性

```
- @property(nonatomic) CGPoint       contentOffset;     // default CGPointZero
	记录UIScrollView滚动的位置
- @property(nonatomic) CGSize        contentSize;      // default CGSizeZero
	内容尺寸(能滚动的范围)
- @property(nonatomic) UIEdgeInsets  contentInset;	
	// default UIEdgeInsetsZero. add additional scroll area around content
	额外增加的滚动区域(在上下左右4个边缘)
- @property(nullable,nonatomic,weak) id<UIScrollViewDelegate>  delegate;	
	// default nil. weak reference
	代理对象
- @property(nonatomic) BOOL  bounces;  
	// default YES. if YES, bounces past edge of content and back again
	是否有弹簧效果
- @property(nonatomic) BOOL 	showsHorizontalScrollIndicator; 
	// default YES. show indicator while we are tracking. fades out after tracking
	是否显示水平滚动条
- @property(nonatomic)  BOOL   showsVerticalScrollIndicator;   
	// default YES. show indicator while we are tracking. fades out after tracking
	是否显示垂直滚动条
	
注：重点掌握contentSize、contentOffset、delegate
```



#### 2. 捏合手势缩放

1. 缩放原理

   1> 当用户尝试缩放UIScrollView的时候，scrollView会尝试向它的delegate(代理对象)发送一条信息，询问要缩放哪一个子控件

   2> 换种说法，也就是说，scrollView会尝试调用delegate的某个方法，询问要缩放哪一个子控件，并且该方法的返回值就是需要缩放的子控件

   ​

2. 缩放原理总结

   1> UIScrollView先设置delegate对象

   2> UIScrollView必须知道delegate是通过`哪个方法`返回需要缩放的子控件，delegate必须实现那个`返回需要缩放子控件`的方法

   3> UIScrollView要跟delegate对象协商好：用哪一个方法返回需要缩放的子控件

   4> 那个返回需要缩放子控件的方法就是：`-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView`

   ​

3. 缩放的一般实现步骤：(比如缩放UIScrollView内部的UIImageView)

   1. 设置scrollView的delegate为控制器(self)
   2. 控制器遵守UIScrollViewDelegate协议<UIScrollViewDelegate>
   3. 控制器实现 `-(UIView *)viewForZoomingInScrollView:`方法，返回需要缩放的子控件
   4. 设置最大和最小缩放比例(默认缩放比为1)



### 二、代理模式设计

1. 使用场合

   1. A想让B帮忙做一些事情，就让B成为A的代理
   2. A想通知一下B发生了某些事情，或者想传递一些数据给B，就让B成为A的代理
   3. B想监听A所做的一些事情，就让B成为A的代理

   ​

2. 使用步骤

   1. 定义一份协议
   2. B要遵守协议，实现相应方法
   3. A中要定义一个代理属性`id<协议> delegate`
   4. 创建B对象，设置A的delegate属性为B对象



### 三、键盘的简单处理

1. 退出键盘

```
    // 响应者: 能处理事件的对象
    // 第一响应者: 此时,调出键盘的文本框
    
    // 退出键盘
    //[_nameField resignFirstResponder];
    //[_phoneField resignFirstResponder];
    //[_addressField resignFirstResponder];
    
    // self.view 内部所有子控件(文本框)都会退出键盘
    [self.view endEditing:YES];
```

2. 自定义键盘

```
    // 设置键盘顶部显示的工具条
    _nameField.inputAccessoryView = keyboardTool;
    _phoneField.inputAccessoryView = keyboardTool;
    _addressField.inputAccessoryView = keyboardTool;
    
    // 自定义键盘内容样式
    //_nameField.inputView
```


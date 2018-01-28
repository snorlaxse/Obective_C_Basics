#### Storyboard文件

- 在iOS5之前，苹果使用xib文件来描述UI界面
- 在iOS5之后，苹果采取了更加强大和先进的storyboard文件来描述界面（Xcode5是基于iOS7的）
- 左边的箭头表明：程序一启动就会显示箭头所指的界面



#### 常见的UI控件

##### UILabel – 文本标签

- 文本标签的作用是显示一串固定的文字

##### UIButton – 按钮

- 按钮的作用是：监听用户的点击事件，在用户点击后做出响应

##### UITextField – 文本输入框

- 文本输入框可以弹出键盘，让用户输入文本内容

- 这个设置表明：UITextField弹出的是数字键盘

  ![](http://upload-images.jianshu.io/upload_images/5267500-a034b5f8b01082f4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)



#### View和ViewController

##### UIView

- ***屏幕上能看得见摸得着的东西就是UIView***，比如屏幕上的按钮、文字、图片
- 一般翻译叫做：视图\控件\组件
- UIButton、UILabel、UITextField都继承自UIView
- ***每一个UIView都是一个容器，能容纳其他UIView***（比如右图中的整个键盘是一个UIView，里面容纳很多小格子的数字UIView）

##### 父控件和子控件

- 在“加法计算器”中，最后面那块白色的全屏的东西也是一个UIView


- 白色的大UIView中容纳了很多小的UIView

  - 在白色的大UIView中，容纳了6个小UIView（1个UIButton、2个UITextField、3个UILabel）
  - 这种情况下，我们可以称白色的大UIView为6个小UIView的父控件（父视图），6个小UIView都是白色大UIView的子控件（子视图）

  ![](http://upload-images.jianshu.io/upload_images/5267500-1a8d1a3b7a60fe55.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

  ​

##### UIViewController

- 手机上自带的“设置”中有很多的界面，点击对应的选项可以跳到下一个界面

  ![](http://upload-images.jianshu.io/upload_images/5267500-406f1feef34522f4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 每一个新的界面都是一个新的UIView，在切换过程中，涉及到了：

  (1)UIView的创建和销毁

  (2)UIView跟用户的交互（处理UIView内部每一行的点击）

- 其实，每当显示一个新界面时，首先会创建一个新的UIViewController对象，然后创建一个对应的全屏UIView，UIViewController负责管理这个UIView

- UIViewController就是UIView的大管家，***负责创建、显示、销毁UIView***，***负责监听UIView内部的事件***，负责处理UIView与用户的交互

- UIViewController内部有个UIView属性，就是它负责管理的UIView对象 :

  `@property(nonatomic,retain) UIView*view;`

- 严格来讲，下图箭头所指的应该是一个UIViewController对象，里面白色的界面仅仅是UIViewController内部的UIView属性

  ![](http://upload-images.jianshu.io/upload_images/5267500-cd3054060e2238d6.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- 箭头所指UIViewController的真实类型是MJViewController

  ![](http://upload-images.jianshu.io/upload_images/5267500-c0fd946896130268.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

  ​

#### 程序的运行流程

- 综合分析，可以得出程序的简单运行流程：

  1.读取Main.storyboard文件

  2.创建箭头所指的***MJViewController对象***

  3.根据storyboard文件中描述创建MJViewController的***UIView对象***

  4.将UIView对象***显示***到用户眼前





#### 监听按钮点击

- 现在已经知道：应该由ViewController来监听“计算”按钮的点击
- 换句话说，ViewController应该提供一个方法出来，当用户点击“计算”按钮时，就调用这个方法来通知ViewController按钮被人点了
- ViewController就在这个方法中实现想做的任何事情，比如计算2个文本输入框内值的和





#### IBAction和IBOutlet

- IBAction
  - 从返回值角度上看，作用相当于void
  - 只有返回值声明为IBAction的***方法***，才能跟storyboard中的控件进行连线



- IBOutlet
  - 只有声明为IBOutlet的***属性***，才能跟storyboard中的控件进行连线





#### 设置程序启动时加载的storyboard

- 这个设置表明：程序启动时会加载Main.storyboard

  ![](http://upload-images.jianshu.io/upload_images/5267500-3e91005e87affd82.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

  ​

#### 退出键盘的两种方式

- resignFirstResponder
  - 当叫出键盘的那个控件(第一响应者)调用这个方法时，就能退出键盘



- endEditing
  - 只要调用这个方法的控件内部存在第一响应者，就能退出键盘




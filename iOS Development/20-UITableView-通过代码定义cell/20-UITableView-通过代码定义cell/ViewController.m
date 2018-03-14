//
//  ViewController.m
//  20-UITableView-通过代码定义cell
//
//  Created by Captain on 05/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"
#import "WeiboCell.h"
#import "Weibo.h"
#import "WeiboFrame.h"

@interface ViewController ()
{
    NSMutableArray *_weibosFrame;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"weibo.plist" ofType:nil]];
    
    _weibosFrame = [NSMutableArray array];
    
//    for (NSDictionary *dict in array) {
//        [_weibos addObject:[Weibo weiboWithDict:dict]];
//    }
    for (NSDictionary *dict in array) {
        WeiboFrame *weiboF = [[WeiboFrame alloc] init];
        weiboF.weibo = [Weibo weiboWithDict:dict];
        [_weibosFrame addObject:weiboF];
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _weibosFrame.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0. 定义一个标识
    static NSString *ID = @"weibo";
    
    // 1.去缓存池中取出可循环利用的cell
    WeiboCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 2.缓存池没有可循环利用的cell，重新创建cell
    if (cell == nil) {
        cell = [[WeiboCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:ID];
    }
    
    // 3. 传递模型数据
    cell.weiboframe = _weibosFrame[indexPath.row];
    
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    // 1. 根据模型数据获得cell的高度
//    WeiboFrame *f  = [[WeiboFrame alloc] init];
//    f.weibo = _weibosFrame[indexPath.row];
    
    return [_weibosFrame[indexPath.row] cellHeight];
}

@end

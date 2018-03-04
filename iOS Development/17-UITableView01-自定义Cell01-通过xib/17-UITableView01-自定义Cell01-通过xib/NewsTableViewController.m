//
//  NewsTableViewController.m
//  17-UITableView01-自定义Cell01-通过xib
//
//  Created by Captain on 21/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "NewsTableViewController.h"
#import "News.h"
#import "NewsCell.h"

#define kheightForRow 60    // 此处高度与nib中所设高度保持一致

@interface NewsTableViewController ()
{
    NSMutableArray *_news;
    
}

@end

@implementation NewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 如果每一行cell的高度一样，如果每一行cell的高度不一定一样,使用代理方法返回高度
    //self.tableView.rowHeight = 80;
    
    // 加载plist数据
    NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"news.plist" ofType:nil]];
    
    _news = [NSMutableArray array];
    
    // 字典转模型
    for (NSDictionary *dict in array) {
        [_news addObject: [News newsWithDict:dict]];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _news.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 0. 定义循环标记
    //NSString *cellIdentifier = @"news";     // 此处注意nib中的identify也应填作"news"
    
    // 1. 从缓存池中取出cell
    //NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[NewsCell ID]];
    
    // 2. 缓存池中没有cell
    if (cell == nil) {
        //NSArray *objects = [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil]; //"loadNibNamed:" 该方法返回(NSArray)对象
    
        //UINib *nib = [UINib nibWithNibName:@"NewsCell" bundle:nil];     // bundle:nil == bundle:[NSBundle mainBundle]
        //NSArray *objects = [nib instantiateWithOwner:nil options:nil];  // 特别注意此处调用的是nib的方法，非NSArray方法
        
        //cell = objects[0];
        
        cell = [NewsCell newsCell];
    }
    
    // 3.取出新闻模型
    News *news = _news[indexPath.row];
    
    // 4.传递模型数据
    cell.news = news;
    
    //NSLog(@"%p",cell);    // 设置.xib的”reuse identify“
    
    return cell;
}


#pragma mark - 代理方法
#pragma mark 通过代理方法返回cell的高度
// 如果每一行cell的高度不一定一样,使用代理方法返回高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kheightForRow;
}


@end

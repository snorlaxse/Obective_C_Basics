//
//  ViewController.m
//  18-演示cell-xib的重用
//
//  Created by Captain on 04/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"
#import "News.h"
#import "NewsCell.h"

@interface ViewController ()
{
    NSMutableArray *_data;
}

@end

@implementation ViewController

- (void)viewDidLoad {
   
    [super viewDidLoad];
   
    _data = [NSMutableArray array];
    
    News *new1 = [[News alloc] init];
    new1.icon = @"小埋01.jpg";
    new1.title = @"haha";
    new1.author = @"Mike";
    new1.comments = 100;
    
    [_data addObject:new1];
    
    self.tableView.rowHeight = 60;
    
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[NewsCell ID]];
    
    if (cell == nil) {
        cell = [NewsCell newsCell];
    }
    
    cell.news = _data[indexPath.row];
    
    return  cell;
}
@end

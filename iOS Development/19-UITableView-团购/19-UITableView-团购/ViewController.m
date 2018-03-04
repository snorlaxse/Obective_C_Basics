//
//  ViewController.m
//  19-UITableView-团购
//
//  Created by Captain on 04/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "ViewController.h"
#import "Deal.h"
#import "DealCell.h"

@interface ViewController ()
{
    NSMutableArray *_deals;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    _deals = [NSMutableArray array];
    
    Deal *deal1= [[Deal alloc] init];
    deal1.icon = @"6";
    deal1.title = @"老四川小炒";
    deal1.buy = 200;
    deal1.price = 12;
    
    [_deals addObject:deal1];
    
    Deal *deal2= [[Deal alloc] init];
    deal2.icon = @"11";
    deal2.title = @"小四川老炒";
    deal2.buy = 500;
    deal2.price = 15;
    
    [_deals addObject:deal2];
    
    self.tableView.rowHeight = [DealCell cellHeight];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _deals.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1. 利用重用标识去缓存池取得cell
    DealCell *cell = [tableView dequeueReusableCellWithIdentifier:[DealCell ID]];
    
    
    // 2. 如果缓存池没有cell，创建cell
    if (cell == nil) {
        cell = [DealCell dealCell];
    }
    
    // 3. 传递模型给cell
    cell.deal = _deals[indexPath.row];
    
    return cell;
}
@end

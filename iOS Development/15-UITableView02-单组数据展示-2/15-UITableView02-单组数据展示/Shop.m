//
//  Shop.m
//  15-UITableView02-单组数据展示
//
//  Created by Captain on 13/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Shop.h"

@implementation Shop


+ (id)shopWithName:(NSString *)name icon:(NSString *)icon desc:(NSString *)desc
{
    Shop *shop = [[Shop alloc] init];
    shop.icon = icon;
    shop.name = name;
    shop.desc = desc;
    
    return shop;
}

@end

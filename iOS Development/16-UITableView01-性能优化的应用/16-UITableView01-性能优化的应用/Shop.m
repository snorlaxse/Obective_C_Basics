//
//  shop.m
//  16-UITableView01-性能优化的应用
//
//  Created by Captain on 18/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Shop.h"

@implementation Shop

- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        // 将字典中的键值对转成模型属性
        self.name = dict[@"name"];
        self.icon = dict[@"icon"];
        self.desc = dict[@"desc"];
    }
    return self;
}

+ (id)shopWithDict:(NSDictionary *)dict
{
    //    Shop *s = [[Shop alloc] init];
    //    s.name = dict[@"name"];
    //    s.icon = dict[@"icon"];
    //    s.desc = dict[@"desc"];
    return [[self alloc] initWithDict:dict];    // 同样返回 Shop对象  // [self alloc]  , NOT [Shop alloc]  , self可代表子类
}

@end

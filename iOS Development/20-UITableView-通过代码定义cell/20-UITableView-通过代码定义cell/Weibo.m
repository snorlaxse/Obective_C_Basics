//
//  Weibo.m
//  20-UITableView-通过代码定义cell
//
//  Created by Captain on 05/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Weibo.h"

@implementation Weibo

- (id)initWithDict:(NSDictionary *)dict
{
    if ( self = [super init]) {
        
        self.name = dict[@"name"];
        self.time = dict[@"time"];
        self.source = dict[@"source"];
        self.content = dict[@"content"];
        self.icon = dict[@"icon"];
        self.image = dict[@"image"];
        self.vip = [dict[@"vip"] boolValue];
    }
    
    return self;
    
}

+ (id)weiboWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end



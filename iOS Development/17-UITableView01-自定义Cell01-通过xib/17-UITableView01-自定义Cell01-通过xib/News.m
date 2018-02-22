//
//  News.m
//  17-UITableView01-自定义Cell01-通过xib
//
//  Created by Captain on 22/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "News.h"

@implementation News
- (id)initWithDict:(NSDictionary *)dict
{
    if (self = [super init]) {
        
        self.title = dict[@"title"];
        self.author = dict[@"author"];
        self.icon = dict[@"icon"];
        self.comments = [dict[@"comments"] intValue];
    }
    
    return self;
}

+ (id)newsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end

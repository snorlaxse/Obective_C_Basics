//
//  Weibo.h
//  20-UITableView-通过代码定义cell
//
//  Created by Captain on 05/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weibo : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *source;
@property (nonatomic,copy) NSString *time;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *image;

@property (nonatomic,assign) BOOL vip;

- (id)initWithDict:(NSDictionary *)dict;
+ (id)weiboWithDict:(NSDictionary *)dict;

@end

//
//  shop.h
//  16-UITableView01-性能优化的应用
//
//  Created by Captain on 18/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject
@property (nonatomic,copy) NSString *name;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *desc;


- (id)initWithDict:(NSDictionary *)dict;    // 对象方法
+ (id)shopWithDict:(NSDictionary *)dict;    // 类方法

@end

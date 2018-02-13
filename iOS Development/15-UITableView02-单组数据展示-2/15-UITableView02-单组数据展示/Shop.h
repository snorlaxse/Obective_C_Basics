//
//  Shop.h
//  15-UITableView02-单组数据展示
//
//  Created by Captain on 13/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject


// 图片
@property (nonatomic,copy) NSString *icon;
// 名称
@property (nonatomic,copy) NSString *name;
// 描述
@property (nonatomic,copy) NSString *desc;

// <#       # >

+ (id)shopWithName:(NSString *)name icon:(NSString *)icon desc:(NSString *)desc;
@end

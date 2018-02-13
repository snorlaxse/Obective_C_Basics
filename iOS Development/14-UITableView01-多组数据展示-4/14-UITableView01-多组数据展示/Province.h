//
//  Province.h
//  14-UITableView01-多组数据展示
//
//  Created by Captain on 12/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

// UI控件 -- weak ， NSString -- copy , 其他对象一般用strong
@property (nonatomic,copy) NSString *header;
@property (nonatomic,copy) NSString *footer;
@property (nonatomic,strong) NSArray *cities;

+ (id)provinceWithHeader:(NSString *)header footer:(NSString *)footer andCities:(NSArray *)cities;
@end

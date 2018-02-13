//
//  Province.m
//  14-UITableView01-多组数据展示
//
//  Created by Captain on 12/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Province.h"

@implementation Province

+ (id)provinceWithHeader:(NSString *)header footer:(NSString *)footer andCities:(NSArray *)cities
{
    Province *province = [[Province alloc] init];
    province.header = header;
    province.footer = footer;
    province.cities = cities;
    
    return province;
}
@end

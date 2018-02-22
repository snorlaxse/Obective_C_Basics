//
//  News.h
//  17-UITableView01-自定义Cell01-通过xib
//
//  Created by Captain on 22/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,assign) int comments;

- (id)initWithDict:(NSDictionary *)dict;
+ (id)newsWithDict:(NSDictionary *)dict;

@end

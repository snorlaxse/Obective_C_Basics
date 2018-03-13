//
//  WeiboFrame.h
//  20-UITableView-通过代码定义cell
//
//  Created by Captain on 13/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//
// 存放某一个cell内部所有子控件的frame

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>     // 不导入，无法识别CGRect


#define kDefaultFont [UIFont systemFontOfSize:15]
#define kSmallFont [UIFont systemFontOfSize:12]

@class Weibo;
@interface WeiboFrame : NSObject

@property (nonatomic,assign,readonly) CGRect iconF;
@property (nonatomic,assign,readonly) CGRect nameF;
@property (nonatomic,assign,readonly) CGRect vipF;
@property (nonatomic,assign,readonly) CGRect timeF;
@property (nonatomic,assign,readonly) CGRect sourceF;
@property (nonatomic,assign,readonly) CGRect contentF;
@property (nonatomic,assign,readonly) CGRect imageF;

@property (nonatomic,assign,readonly) float cellHeight;


@property (nonatomic,strong) Weibo *weibo;
@end




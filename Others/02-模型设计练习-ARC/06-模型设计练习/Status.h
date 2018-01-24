//
//  Status.h
//  06-模型设计练习
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

// 微博内容、微博配图、发送时间、微博发送人、转发的微博、被评论数、被转发数

#import <Foundation/Foundation.h>
#import "User.h"

@interface Status : NSObject

@property (nonatomic,strong) NSString *text;

@property (nonatomic,strong) NSString *icon;


// 从1970-01-01 00:00:00 开始，一共度过了多少毫秒
@property (nonatomic) long time;
//@property (nonatomic) time_t time;


@property (nonatomic,strong) User *user;

@property (nonatomic,strong) Status *retweetStatus;

@property (nonatomic,assign) int commentsCount;
@property (nonatomic,assign) int retweetsCount;



@end

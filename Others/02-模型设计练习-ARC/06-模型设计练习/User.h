//
//  User.h
//  06-模型设计练习
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

// 姓名、微博号码、密码、头像、性别、手机、生日

#import <Foundation/Foundation.h>

typedef enum
{
    SexMan,
    SexWoman
}Sex;

typedef struct
{
    int year;
    int month;
    int day;
}Date;

@interface User : NSObject

@property (nonatomic,strong)NSString *name;

@property (nonatomic,strong) NSString *account;

@property (nonatomic,strong) NSString *password;

//URL (Uniform Resource Locator) 统一资源定位符
@property (nonatomic,strong) NSString *icon;

@property (nonatomic,assign) Sex *sex;

@property (nonatomic,strong) NSString *phone;

@property (nonatomic,assign) Date birthday;

@end

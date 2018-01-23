//
//  Person.h
//  04-@property参数
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Person : NSObject


// 自动生成默认的set和get方法很笨，and简单
@property int age;

// retain : 生成的set方法里面，release旧值，retain新值
@property (retain) Book *book;
@property (retain) NSString *name;

@end

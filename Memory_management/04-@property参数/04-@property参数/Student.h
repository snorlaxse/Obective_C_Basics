//
//  Student.h
//  04-@property参数
//
//  Created by Captain on 22/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Student : NSObject

@property (retain)Book *book;
@property (retain)NSString *name;

@end

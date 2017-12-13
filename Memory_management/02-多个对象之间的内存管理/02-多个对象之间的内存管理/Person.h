//
//  Person.h
//  02-多个对象之间的内存管理
//
//  Created by Captain on 13/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"

@interface Person : NSObject
{
    Book *_book;
    
    
}

- (void)setBook:(Book *)book;
- (Book *)book; 
@end

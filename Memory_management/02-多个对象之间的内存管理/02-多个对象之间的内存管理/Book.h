//
//  Book.h
//  02-多个对象之间的内存管理
//
//  Created by Captain on 13/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject
{
    int _price;
}
//@property int price;

- (void)setPrice:(int)price;
- (int)price;
@end

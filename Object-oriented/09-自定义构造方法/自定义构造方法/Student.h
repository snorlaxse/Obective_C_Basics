//
//  Student.h
//  自定义构造方法
//
//  Created by Captain on 05/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "Person.h"

@interface Student : Person
@property int no;
- (id)initWithNo:(int)no;
- (id)initWithName:(NSString *)name andAge:(int)age andNo:(int)no;

@end

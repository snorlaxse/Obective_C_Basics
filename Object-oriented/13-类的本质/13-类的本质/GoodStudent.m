//
//  GoodStudent.m
//  13-类的本质
//
//  Created by Captain on 07/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import "GoodStudent.h"

@implementation GoodStudent

// 在类被加载的时候调用
+(void)load
{
    NSLog(@"GoodStudent ---- load");
}

+ (void)initialize
{
    NSLog(@"GoodStudent----initialize");
}
@end

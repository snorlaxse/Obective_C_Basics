//
//  Babe.h
//  11-代理设计模式
//
//  Created by Captain on 10/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BabyNanny.h"


@interface Baby : NSObject

@property (nonatomic,assign) int age;

@property (nonatomic,strong) id<BabyNanny> nanny;  // 保姆


- (void)hungry;
- (void)cry;
- (void)sleep;

@end

//
//  Hashiqi.h
//  05-protocol
//
//  Created by Captain on 24/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "Dog.h"

@protocol MyDogProtocol <NSObject>

- (void)dogTest;

@end

@interface Hashiqi : Dog <MyDogProtocol>

- (void)addTest;

@end

// 尽量把分类写在单独文件中
//@interface Hashiqi(Add)
//
//- (void)addTest;
//
//@end


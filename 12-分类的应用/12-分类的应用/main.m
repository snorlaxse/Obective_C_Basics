//
//  main.m
//  12-分类的应用
//
//  Created by Captain on 05/12/2017.
//  Copyright © 2017 captain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Number.h"

int main(int argc, const char * argv[]) {
    
    //类库：许多类的集合  
    @autoreleasepool {
        // insert code here...
        int count = [NSString numberCountOfString:@"abc1234zc5"];
        
        int c = [@"abc1234zc5" numberCount];
        
        NSLog(@"%d %d",count,c);
    }
    return 0;
}

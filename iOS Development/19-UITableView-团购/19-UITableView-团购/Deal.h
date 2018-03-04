//
//  Deal.h
//  19-UITableView-团购
//
//  Created by Captain on 05/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Deal : NSObject
@property (nonatomic,copy) NSString *icon;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,assign) int buy;
@property (nonatomic,assign) double price;
//@property (nonatomic,assign) BOOL isNew;



@end

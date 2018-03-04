//
//  DealCell.h
//  19-UITableView-团购
//
//  Created by Captain on 05/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Deal;
@interface DealCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (nonatomic,strong) Deal *deal;

+ (id)dealCell;
+ (NSString *)ID;
+ (CGFloat)cellHeight;

@end

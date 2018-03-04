//
//  DealCell.m
//  19-UITableView-团购
//
//  Created by Captain on 05/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "DealCell.h"
#import "Deal.h"

@implementation DealCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (id)dealCell
{
    return [[NSBundle mainBundle] loadNibNamed:@"DealCell" owner:nil options:nil][0];
    
}

+ (NSString *)ID
{
    return @"deal";
}

+(CGFloat)cellHeight
{
    return 60;   
}

- (void)setDeal:(Deal *)deal
{
    _deal = deal;
    
    // title
    _titleLabel.text = deal.title;
    
    // 购买数
    _buyLabel.text = [NSString stringWithFormat:@"月销:%d", deal.buy];
    
    // price
    _priceLabel.text = [NSString stringWithFormat:@"售价:%f", deal.price];
    
    // icon
    _iconView.image = [UIImage imageNamed:deal.icon];
    
}

@end

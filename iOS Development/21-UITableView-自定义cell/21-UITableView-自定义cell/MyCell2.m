//
//  MyCell2.m
//  21-UITableView-自定义cell
//
//  Created by Captain on 13/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "MyCell2.h"

@implementation MyCell2

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (id) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"haha~";
        label.frame = CGRectMake(10, 10, 60, 30);
        [self.contentView addSubview:label];
        
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeContactAdd)];
        btn.center = CGPointMake(320, 25);
        [self.contentView addSubview:btn];
        
    }
    
    return self;
}

@end

//
//  NewsCell.m
//  17-UITableView01-自定义Cell01-通过xib
//
//  Created by Captain on 22/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "NewsCell.h"
#import "News.h"

@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (id)newsCell
{
   
    return [[NSBundle mainBundle] loadNibNamed:@"NewsCell" owner:nil options:nil][0];
}

- (void)setNews:(News *)news
{
    _news = news;
    
    // title
    _titleLabel.text = news.title;
    
    // author
    _authorLabel.text = news.author;
    
    // comments
    _commentsLabel.text = [NSString stringWithFormat:@"评论:%d",news.comments];
    
    // icon
    _iconView.image = [UIImage imageNamed:news.icon];
    
}
@end

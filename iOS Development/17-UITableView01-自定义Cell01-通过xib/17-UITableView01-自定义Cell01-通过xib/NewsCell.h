 //
//  NewsCell.h
//  17-UITableView01-自定义Cell01-通过xib
//
//  Created by Captain on 22/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <UIKit/UIKit.h>
@class News;

@interface NewsCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
@property (nonatomic,strong) News *news;

+ (id)newsCell;

@end

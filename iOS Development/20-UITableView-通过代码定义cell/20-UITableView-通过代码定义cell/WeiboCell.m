//
//  WeiboCell.m
//  20-UITableView-通过代码定义cell
//
//  Created by Captain on 05/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "WeiboCell.h"
#import "Weibo.h"
#import "WeiboFrame.h"


@interface WeiboCell()
{
    // 1.头像
    UIImageView *_icon;
    // 2.昵称
    UILabel *_name;
    // 3.会员
    UIImageView *_vip;
    // 4.来源
    UILabel *_source;
    // 5.时间
    UILabel *_time;
    // 6.正文
    UILabel *_content;
    // 7.配图
    UIImageView *_image;
}
@end

@implementation WeiboCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        // 添加内部的子控件
        
        // 1. 头像
        UIImageView *icon = [[UIImageView alloc] init];
        [self.contentView addSubview:icon];
        _icon = icon;
        
        // 2. 昵称
        _name = [[UILabel alloc] init];
        _name.font = kDefaultFont;
        [self.contentView addSubview: _name];
        
        
        // 3. 会员图标
        _vip = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"vip.png"]];
        [self.contentView addSubview: _vip];
        
        
        // 4. 时间
        _time = [[UILabel alloc] init];
        _time.font = kSmallFont;
        [self.contentView addSubview: _time];
        
        // 5. 来源
        _source = [[UILabel alloc] init];
        _source.font = _time.font;
        [self.contentView addSubview: _source];
        
        // 6. 微博正文
        _content = [[UILabel alloc] init];
        [self.contentView addSubview: _content];
        
        // 7. 配图
        _image = [[UIImageView alloc] init];
        [self.contentView addSubview:_image];
        
    }
    
    return self;
}


- (void)setWeiboframe:(WeiboFrame *)weiboframe
{
    _weiboframe = weiboframe;
    
    // 1. 设置微博数据
    [self settingData];
    
    // 2. 设置子控件的frame(x,y,width,height)
    [self settingSubviewFrame];
   
    
    
}
#pragma mark 设置子控件的frame
- (void)settingSubviewFrame
{
    // 1.头像
    _icon.frame = _weiboframe.iconF;
    
    // 2. 昵称
    _name.frame = _weiboframe.nameF;
    
    // 3. vip
    _vip.frame = _weiboframe.vipF;
    
    
    // 4. 时间
    _time.frame = _weiboframe.timeF;
    
    // 5. 来源
    _source.frame = _weiboframe.sourceF;
    
    // 6. 正文
    _content.frame = _weiboframe.contentF;
    
    //自动折行设置
//    _content.lineBreakMode = UILineBreakModeWordWrap;
    _content.numberOfLines = 0;
    
    // 7.配图
    if (_weiboframe.weibo.image) {
        _image.frame = _weiboframe.imageF;
    }
   
    
}

#pragma mark 设置微博数据
- (void) settingData
{
    Weibo *weibo = _weiboframe.weibo;
    
    // 1.头像
    _icon.image = [UIImage imageNamed:weibo.icon];
    
    // 2.昵称
    _name.text = weibo.name;
    if (weibo.vip) {
        _name.textColor = [UIColor purpleColor];
    }else{
        _name.textColor = [UIColor blackColor];
    }
    
    // 3.会员图标
    _vip.hidden = !weibo.vip;
    
    // 4.时间
    _time.text = weibo.time;
    
    // 5.来源
    _source.text = [NSString stringWithFormat:@"来自:%@",weibo.source];
    
    // 6.正文
    _content.text = weibo.content;
    
    // 7.配图
    if (weibo.image) {
        _image.hidden = NO;
        _image.image = [UIImage imageNamed:weibo.image];
    }else{
        _image.hidden = YES;
    }
    
}

@end

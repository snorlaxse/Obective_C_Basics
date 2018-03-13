//
//  WeiboFrame.m
//  20-UITableView-通过代码定义cell
//
//  Created by Captain on 13/03/2018.
//  Copyright © 2018 captain. All rights reserved.
//


#import "WeiboFrame.h"
#import "Weibo.h"

// cell的边框宽度
#define kCellBorder 10
// 头像的宽高
#define kIconWH 40
// vip的宽高
#define kVipWH 35
// 配图的宽高
#define kImageW 85
#define kImageH 60


@implementation WeiboFrame
- (void)setWeibo:(Weibo *)weibo
{
    _weibo = weibo;
    
    
    // 1.头像
    CGFloat iconX = kCellBorder;
    CGFloat iconY = kCellBorder;
    _iconF = CGRectMake(iconX, iconY, kIconWH, kIconWH);
    
    // 2. 昵称
    CGFloat nameX = CGRectGetMaxX(_iconF) + kCellBorder;
    CGFloat nameY = kCellBorder;
    // 计算用户名称的尺寸
    CGSize nameSize = [_weibo.name sizeWithAttributes:@{NSFontAttributeName : kDefaultFont}];     // sizeWithFont:(UIFont *) iOS 7.0以后不建议使用
    _nameF = CGRectMake(nameX, nameY, nameSize.width, nameSize.height);
    
    // 3. vip
    CGFloat vipX = CGRectGetMaxX(_nameF);
    CGFloat vipY = nameY / 2;
    _vipF = CGRectMake(vipX, vipY , kVipWH, kVipWH);
    
    
    // 4. 时间
    CGFloat timeX = nameX;
    CGFloat timeY = CGRectGetMaxY(_nameF) + kCellBorder;
    CGSize timeSize = [_weibo.time sizeWithAttributes:@{NSFontAttributeName : kSmallFont}];
    _timeF = CGRectMake(timeX, timeY, timeSize.width, timeSize.height);
    
    // 5. 来源
    CGFloat sourceX = CGRectGetMaxX(_timeF) + kCellBorder;
    CGFloat sourceY = timeY;
    NSString *sourceText = [NSString stringWithFormat:@"来自:%@",_weibo.source];
    CGSize sourceSize = [sourceText sizeWithAttributes:@{NSFontAttributeName : kDefaultFont}];
    _sourceF = CGRectMake(sourceX, sourceY, sourceSize.width, sourceSize.height);
    
    // 6. 正文
    CGFloat contentX = iconX;
    CGFloat contentY = MAX(CGRectGetMaxY(_iconF), CGRectGetMaxY(_timeF)) + kCellBorder;
    CGFloat contentW = 375 - 2 * kCellBorder;
    CGSize contentSize = [_weibo.content  boundingRectWithSize:CGSizeMake(contentW, 1000) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName : kDefaultFont} context:nil].size;
    
    _contentF = CGRectMake(contentX, contentY, contentW, contentSize.height);
    
    
    // 7.配图
    if (_weibo.image) {
        CGFloat imageX = contentX;
        CGFloat imageY = CGRectGetMaxY(_contentF) + kCellBorder;
        _imageF = CGRectMake(imageX, imageY, kImageW, kImageH);
        
        _cellHeight = CGRectGetMaxY(_imageF) + kCellBorder;
    
    }else{
        _cellHeight = CGRectGetMaxY(_contentF) + kCellBorder;
    }
        
    
    
}

@end

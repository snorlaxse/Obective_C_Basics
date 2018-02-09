//
//  RowView.m
//  07-联系人管理
//
//  Created by Captain on 09/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import "RowView.h"

@implementation RowView

+(id)rowViewWithIcon:(NSString *)icon name:(NSString *)name
{
    RowView *view = [[NSBundle mainBundle] loadNibNamed:@"RowView" owner:nil options:nil][0];
    
    // 1. 设置图标
//    UIButton *iconBtn = (UIButton *)[view viewWithTag:1];
    [view.iconBtn setBackgroundImage:[UIImage imageNamed:icon] forState:(UIControlStateNormal)];
    
    // 2. 设置姓名
//    UILabel *nameLabel = (UILabel *)[view viewWithTag:2];
    view.nameLabel.text = name;
    
    return view;
}

@end

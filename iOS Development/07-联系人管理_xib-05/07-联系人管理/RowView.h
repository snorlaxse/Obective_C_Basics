//
//  RowView.h
//  07-联系人管理
//
//  Created by Captain on 09/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RowView : UIView

@property (weak, nonatomic) IBOutlet UIButton *iconBtn;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

+ (id)rowViewWithIcon:(NSString *)icon name:(NSString *)name;


@end

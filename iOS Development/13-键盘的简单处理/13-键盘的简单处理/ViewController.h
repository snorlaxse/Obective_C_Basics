//
//  ViewController.h
//  13-键盘的简单处理
//
//  Created by Captain on 10/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)exitKeyBoard:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *addressField;

@end


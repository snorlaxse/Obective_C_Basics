//
//  ViewController.h
//  01- 按钮操作
//
//  Created by Captain on 29/01/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIButton *btn;

- (IBAction)move:(id)sender;
- (IBAction)rotate:(id)sender;
- (IBAction)zoom:(id)sender;

- (IBAction)btnReset:(id)sender;


@end


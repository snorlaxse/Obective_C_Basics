//
//  ViewController.h
//  03-图片浏览器
//
//  Created by Captain on 03/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)sliderValueChange:(UISlider *)sender;

-(IBAction)setting;

- (IBAction)imageSizeChange:(UISlider *)sender;

- (IBAction)nightMode:(UISwitch *)sender;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *imageNo;

@property (weak, nonatomic) IBOutlet UILabel *imageDesc;

@property (weak, nonatomic) IBOutlet UIView *settingView;


@end


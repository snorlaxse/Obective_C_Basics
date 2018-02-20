//
//  ViewController.h
//  16-UITableView01-性能优化的应用
//
//  Created by Captain on 17/02/2018.
//  Copyright © 2018 captain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *selectedLabel;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *trashItem;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)remove:(id)sender;
- (IBAction)selectAll:(id)sender;
- (IBAction)selectOthers:(UIBarButtonItem *)sender;

@end


//
//  TTViewController.h
//  UIPopoverController
//
//  Created by Sergey Reshetnyak on 5/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *dateTextField;
@property (weak, nonatomic) IBOutlet UITextField *educationField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderControl;

- (IBAction)genderControlAction:(id)sender;

- (IBAction)infoPopover:(id)sender;

@end

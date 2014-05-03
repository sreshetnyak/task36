//
//  TTDateViewController.m
//  UIPopoverController
//
//  Created by Sergey Reshetnyak on 5/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTDateViewController.h"

@interface TTDateViewController ()

@property (weak,nonatomic) UIDatePicker *datePicker;

@end

@implementation TTDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed:)];
    self.navigationItem.leftBarButtonItem = item;
    
    CGRect rect = self.view.bounds;
    rect.origin.y = 44;
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]initWithFrame:rect];
    [datePicker setDate:self.date];
    datePicker.datePickerMode = UIDatePickerModeDate;
    self.datePicker = datePicker;
    
    [self.view addSubview:datePicker];
    
}

- (void)cancelPressed:(id)sender {
    [self.delegate datePickDidEndEditing:self.datePicker.date];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end

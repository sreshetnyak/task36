//
//  TTDateViewController.h
//  UIPopoverController
//
//  Created by Sergey Reshetnyak on 5/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTDatePickDelegete;

@interface TTDateViewController : UIViewController

@property (weak,nonatomic) id <TTDatePickDelegete> delegate;
@property (strong,nonatomic) NSDate *date;

@end

@protocol TTDatePickDelegete <NSObject>

- (void)datePickDidEndEditing:(NSDate *)date;

@end
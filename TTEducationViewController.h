//
//  TTEducationViewController.h
//  UIPopoverController
//
//  Created by Sergey Reshetnyak on 5/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTEducationDelegete;

@interface TTEducationViewController : UIViewController

@property (weak,nonatomic) id <TTEducationDelegete> delegete;
@property (strong,nonatomic) NSString *education;

@end

@protocol TTEducationDelegete <NSObject>

- (void)educationPickDidEndEditing:(NSString *)education;

@end
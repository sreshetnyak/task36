//
//  TTInfoPopoverViewController.h
//  UIPopoverController
//
//  Created by Sergey Reshetnyak on 5/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TTPopOverDelegate;

@interface TTInfoPopoverViewController : UIViewController

@property (weak,nonatomic) id <TTPopOverDelegate> delegate;

@end

@protocol TTPopOverDelegate <NSObject>

- (void)hidePopOver:(TTInfoPopoverViewController *)vc;

@end
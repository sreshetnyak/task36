//
//  TTViewController.m
//  UIPopoverController
//
//  Created by Sergey Reshetnyak on 5/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTViewController.h"
#import "TTInfoPopoverViewController.h"
#import "TTEducationViewController.h"
#import "TTDateViewController.h"

static NSString* kSettingsName = @"kSettingsName";
static NSString* kSettingsSecondName = @"kSettingsSecondName";
static NSString* kSettingsGender = @"kSettingsGender";
static NSString* kSettingsEducation = @"kSettingsEducation";
static NSString* kSettingsAge = @"kSettingsAge";

@interface TTViewController () <TTPopOverDelegate,UITextFieldDelegate,TTDatePickDelegete,TTEducationDelegete>

@end

@implementation TTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.nameTextField.delegate = self;
    self.lastNameTextField.delegate = self;
    self.dateTextField.delegate = self;
    self.educationField.delegate = self;
    
    [self loadSettings];
}

- (void) saveSettings {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:self.nameTextField.text forKey:kSettingsName];
    [userDefaults setObject:self.lastNameTextField.text forKey:kSettingsSecondName];
    [userDefaults setInteger:self.genderControl.selectedSegmentIndex forKey:kSettingsGender];
    [userDefaults setObject:self.educationField.text forKey:kSettingsEducation];
    [userDefaults synchronize];
}

- (void) saveSettingsAgeWithDate:(NSDate *)date {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:date forKey:kSettingsAge];
    [userDefaults synchronize];
}


- (void) loadSettings {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    self.nameTextField.text = [userDefaults objectForKey:kSettingsName];
    self.lastNameTextField.text = [userDefaults objectForKey:kSettingsSecondName];
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"dd MMM yyyy"];
    NSDate *dateBirth = [userDefaults objectForKey:kSettingsAge];
    NSString *date = [dateFormater stringFromDate:dateBirth];
    self.dateTextField.text = date;
    
    self.educationField.text = [userDefaults objectForKey:kSettingsEducation];
    self.genderControl.selectedSegmentIndex = [userDefaults integerForKey:kSettingsGender];
}


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}

- (IBAction)genderControlAction:(id)sender {
    
    [self saveSettings];
}

- (IBAction)infoPopover:(id)sender {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        
        TTInfoPopoverViewController *vc = [[TTInfoPopoverViewController alloc]init];
        vc.delegate = self;
        UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:vc];
        
        [self presentViewController:nv animated:YES completion:nil];
    }
    
}

#pragma mark - TTPopOverDelegate

- (void)hidePopOver:(TTInfoPopoverViewController *)vc {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)datePickDidEndEditing:(NSDate *)date {
    
    NSDateFormatter *dateFormater = [[NSDateFormatter alloc]init];
    [dateFormater setDateFormat:@"dd MMM yyyy"];
    self.dateTextField.text = [dateFormater stringFromDate:date];
    
    [self saveSettingsAgeWithDate:date];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)educationPickDidEndEditing:(NSString *)education {
    
    self.educationField.text = education;
    
    [self saveSettings];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [self saveSettings];
    
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    
    if (textField.tag == 1 | textField.tag == 2) {
        return YES;
    } else if (textField.tag == 3) {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            
            TTDateViewController *vc = [[TTDateViewController alloc]init];
            vc.delegate = self;
            
            NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
            NSDate *dateBirth = [userDefaults objectForKey:kSettingsAge];
            vc.date = dateBirth;
            
            UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:vc];
            
            [self presentViewController:nv animated:YES completion:nil];
        }
        
    } else if (textField.tag == 4) {
        
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
            
            TTEducationViewController *vc = [[TTEducationViewController alloc]init];
            vc.delegete = self;
            vc.education = self.educationField.text;
            UINavigationController *nv = [[UINavigationController alloc]initWithRootViewController:vc];
            
            [self presentViewController:nv animated:YES completion:nil];
        }
        
    }
    
    return NO;
}

@end

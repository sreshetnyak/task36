//
//  TTEducationViewController.m
//  UIPopoverController
//
//  Created by Sergey Reshetnyak on 5/3/14.
//  Copyright (c) 2014 sergey. All rights reserved.
//

#import "TTEducationViewController.h"

@interface TTEducationViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak,nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSArray *educationArray;

@property (nonatomic, retain) NSIndexPath* checkedIndexPath;

@end

@implementation TTEducationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelPressed:)];
    self.navigationItem.leftBarButtonItem = item;
    
    CGRect rect = self.view.bounds;
    rect.origin = CGPointZero;
    
    UITableView *tabelView = [[UITableView alloc]initWithFrame:rect style:UITableViewStyleGrouped];
    tabelView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    tabelView.dataSource = self;
    tabelView.delegate = self;
    tabelView.separatorInset = UIEdgeInsetsZero;
    tabelView.scrollEnabled = NO;
    
    
    [self.view addSubview:tabelView];
    self.tableView = tabelView;
    
    self.educationArray = @[@"НТУУ КПИ",@"ЧДУ ім. Петра Могили",@"ХАИ им. Н.Е. Жуковского"];
    
    
    self.checkedIndexPath = [NSIndexPath indexPathForRow:[self.educationArray indexOfObject:self.education] inSection:0];
}

- (void)cancelPressed:(id)sender {
    [self.delegete educationPickDidEndEditing:self.education];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.educationArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString* identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if([self.checkedIndexPath isEqual:indexPath]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.textLabel.text = [self.educationArray objectAtIndex:indexPath.row];
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (self.checkedIndexPath) {
        UITableViewCell* uncheckCell = [tableView cellForRowAtIndexPath:self.checkedIndexPath];
        uncheckCell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    if ([self.checkedIndexPath isEqual:indexPath]) {
        self.checkedIndexPath = nil;
        self.education = nil;
        
    } else {
        UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.checkedIndexPath = indexPath;
        
        self.education = [self.educationArray objectAtIndex:indexPath.row];
        
    }
}

@end

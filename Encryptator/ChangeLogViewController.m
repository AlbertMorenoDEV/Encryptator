//
//  ChangeLogViewController.m
//  Encryptator
//
//  Created by albert moreno vendrell on 24/11/13.
//  Copyright (c) 2013 Albert Moreno Vendrell. All rights reserved.
//

#import "ChangeLogViewController.h"

@interface ChangeLogViewController ()

@end

@implementation ChangeLogViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)homePushButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

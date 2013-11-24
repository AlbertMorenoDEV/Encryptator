//
//  ViewController.h
//  Encryptator
//
//  Created by albert moreno vendrell on 17/11/13.
//  Copyright (c) 2013 Albert Moreno Vendrell. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *appVersionLabel;
@property (weak, nonatomic) IBOutlet UITextView *resultTextView;
@property (weak, nonatomic) IBOutlet UIPickerView *encryptTypePickerView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *statusActivityIndicatorView;
@property (weak, nonatomic) IBOutlet UITextField *stringToEncryptTextField;

- (IBAction)encryptPushButton:(id)sender;
- (IBAction)versionPushButton:(id)sender;

@end

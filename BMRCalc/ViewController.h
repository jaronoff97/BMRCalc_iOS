//
//  ViewController.h
//  BMRCalc
//
//  Created by Jacob Aronoff on 7/1/15.
//  Copyright (c) 2015 Jacob Aronoff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UILabel *bmrLabel;
@property (weak, nonatomic) IBOutlet UILabel *bmiLabel;

- (IBAction)goButtonPressed:(id)sender;
- (IBAction)genderControlAction:(id)sender;
- (IBAction)unitsAction:(id)sender;
- (IBAction)longHoldGesture:(id)sender;


@end


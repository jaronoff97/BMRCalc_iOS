//
//  ViewController.m
//  BMRCalc
//
//  Created by Jacob Aronoff on 7/1/15.
//  Copyright (c) 2015 Jacob Aronoff. All rights reserved.
//

#import "ViewController.h"
#import "Subject.h"


static BOOL isImperial=YES;

NSNumber* centimetersToInches(NSNumber* centimeters){
    float cm = centimeters.floatValue;
    return [NSNumber numberWithFloat: (cm / 2.54)];
}

NSNumber* inchesToCentimeters(NSNumber* inches){
    float _inches = inches.floatValue;
    return [NSNumber numberWithFloat: (_inches * 2.54)];
}

NSNumber* poundsToKilograms(NSNumber* pounds){
    float lbs = pounds.floatValue;
    return [NSNumber numberWithFloat: (lbs/2.2)];
}

NSNumber* kilogramsToPounds(NSNumber* kilograms){
    float kg = kilograms.floatValue;
    return [NSNumber numberWithFloat: (kg * 2.2)];
}

@interface ViewController ()
//nothing in the interface.
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Subject* subject = [Subject sharedSubject];
    subject.isMale=YES;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.heightField resignFirstResponder];
    [self.weightField resignFirstResponder];
    [self.ageField resignFirstResponder];
}

- (IBAction)goButtonPressed:(id)sender {
    NSNumber* heightNumber;
    NSNumber* weightNumber;
    if(isImperial==YES){
       heightNumber = inchesToCentimeters([NSNumber numberWithFloat: self.heightField.text.floatValue]);//if it's imperial then convert it to centimeters and kilograms
        weightNumber = poundsToKilograms([NSNumber numberWithFloat: self.weightField.text.floatValue]);
    }
    else{
       heightNumber = ([NSNumber numberWithFloat: (self.heightField.text.floatValue*100)]);//convert meters to centimeters
       weightNumber = ([NSNumber numberWithFloat: self.weightField.text.floatValue]);
    }
    
    NSNumber* ageNumber = [NSNumber numberWithFloat: self.ageField.text.floatValue];//get the age
    
    Subject* subject = [Subject sharedSubject];// make a new subject
    subject.heightInCentimeters = heightNumber;
    subject.weightInKilograms = weightNumber;
    subject.age = ageNumber;// construct the subject
    self.bmrLabel.text = [NSString stringWithFormat:@"%@ %@",@"BMR: ",subject.bmr.stringValue];
    self.bmrLabel.enabled = YES;//add BMR
    self.bmiLabel.text = [NSString stringWithFormat:@"%@ %@",@"BMI: ",subject.bmi.stringValue];
    self.bmiLabel.enabled = YES;//add BMI
    
}

- (IBAction)genderControlAction:(id)sender {
    Subject* subject = [Subject sharedSubject];
    if(subject.isMale==YES)
    {
        subject.isMale=NO;//get the gender
    }
    else if(subject.isMale==NO){
        subject.isMale=YES;
    }
}

- (IBAction)unitsAction:(id)sender {
    //get the unit system
    if(isImperial==NO){
        isImperial=YES;
        self.weightField.placeholder=@"Weight (lbs)";
        self.heightField.placeholder=@"Height (in)";
    }
    else if(isImperial==YES){
        isImperial=NO;
        self.weightField.placeholder=@"Weight (kg)";
        self.heightField.placeholder=@"Height (m)";
    }
}

- (IBAction)longHoldGesture:(id)sender {
    self.weightField.text=@"";
    self.heightField.text=@"";
    self.ageField.text=@"";
    self.bmiLabel.text=@"BMI";
    self.bmrLabel.text=@"BMR";
    self.bmiLabel.enabled = NO;
    self.bmrLabel.enabled = NO;
}
@end

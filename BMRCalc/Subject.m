//
//  Subject.m
//  BMRTest
//
//  Created by Michael Shafae on 6/30/15.
//  Copyright (c) 2015 Michael Shafae. All rights reserved.
//

#import "Subject.h"

static Subject* _mySecretSubject; // make a static subject that all classes will access

@implementation Subject // Synthesize properties.
@synthesize heightInCentimeters;
@synthesize weightInKilograms;
@synthesize age;
@synthesize isMale;

+(Subject*) sharedSubject
{
  if (_mySecretSubject == nil){
    _mySecretSubject = [[Subject alloc] init];
  }
  return _mySecretSubject;
}

-(NSNumber*) bmr
{
    float heightInCMeters = self.heightInCentimeters.floatValue;
    float weight = self.weightInKilograms.floatValue;
    float floatAge = self.age.floatValue;
    float _bmr; // construct a bmr float
    
    if(self.isMale==YES)
    {
        float part1 = ((13.397*weight));//break up the parts in to three to make
        float part2 = ((4.799*heightInCMeters));// the calculation easier to read
        float part3 = ((5.677*floatAge));
        _bmr=part1+part2-part3+88.362; // <<<THIS IS THE MALE CONDITION
    }
    else if(self.isMale==NO)
    {
        float part1 = ((9.247*weight));
        float part2 = ((3.098*heightInCMeters));
        float part3 = ((4.33*floatAge));
        _bmr=part1+part2-part3+447.593; // <<<THIS IS THE FEMALE CONDITION
    }
  return [NSNumber numberWithFloat: _bmr]; // return the BMR
}
-(NSNumber*) bmi{
    float heightInMeters = ((self.heightInCentimeters.floatValue)/100);// Convert to meters
    float weight = ((self.weightInKilograms.floatValue));// get weight as a float
    float bodyMassIndex = weight / (heightInMeters*heightInMeters);
    return [NSNumber numberWithFloat: bodyMassIndex];// return the BMI
}
@end

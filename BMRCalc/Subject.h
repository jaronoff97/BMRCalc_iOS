//
//  Subject.h
//  BMRTest
//
//  Created by Michael Shafae on 6/30/15.
//  Copyright (c) 2015 Michael Shafae. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subject : NSObject
@property (strong, nonatomic) NSNumber* heightInCentimeters;
@property (strong, nonatomic) NSNumber* weightInKilograms;
@property (strong, nonatomic) NSNumber* age;
@property BOOL isMale;
@property (readonly) NSNumber* bmr;
@property (readonly) NSNumber* bmi;
@property (readonly) NSNumber* suggestedWeight;
+(Subject*) sharedSubject;

@end

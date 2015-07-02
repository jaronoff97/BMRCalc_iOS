//
//  CustomControllerViewController.m
//  BMRCalc
//
//  Created by Jacob Aronoff on 7/2/15.
//  Copyright (c) 2015 Jacob Aronoff. All rights reserved.
//

#import "CustomControllerViewController.h"
#import "Subject.h"

NSMutableArray *array;
@interface CustomControllerViewController ()

@end

@implementation CustomControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    array= [[NSMutableArray alloc] initWithCapacity:0];
    Subject* subject = [Subject sharedSubject];
    if(subject.weightInKilograms>subject.suggestedWeight){
        for (float x=subject.weightInKilograms.floatValue; x>subject.suggestedWeight.floatValue; x-=0.14285714285714) {
            [array addObject:[NSNumber numberWithFloat:subject.bmr.floatValue]];
            subject.weightInKilograms = [NSNumber numberWithFloat:x];
        }
    }
    else if(subject.weightInKilograms<subject.suggestedWeight){
        for (float x=subject.weightInKilograms.floatValue; x<subject.suggestedWeight.floatValue; x+=0.14285714285714) {
            [array addObject:[NSNumber numberWithFloat:x]];
        }
    }
    NSMutableString *teststring = [[NSMutableString alloc]init];
    for(NSNumber *xNum in array){
        [teststring appendString: [NSString stringWithFormat:@"\n %@",xNum]];
        NSLog(@"%@",xNum);
    }
    //self.graphTemp.text=teststring;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

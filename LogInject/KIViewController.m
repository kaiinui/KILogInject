//
//  KIViewController.m
//  LogInject
//
//  Created by kaiinui on 2014/08/21.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIViewController.h"
#import "KILogInject.h"
#import <Aspects.h>
#import "KITestClass.h"

@interface KIViewController ()

+ (void)doNothingInClassMethod:(NSString *)string;

@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *result = [self doNothing:@"somearg" withString:@"someString"];
    NSLog(@"%@", result);
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)doNothing:(NSString *)string withString:(NSString *)someStr {
    NSLog(@"THIS METHOD DOES NOT DO ANYTHING");
    return [NSString stringWithFormat:@"%@%@", string, someStr];
}

+ (void)doNothingInClassMethod:(NSString *)string {
    NSLog(@"DONITHINGINCLASS");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

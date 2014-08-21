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
    
    [self doNothing:@"somearg" withString:@"someString"];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)doNothing:(NSString *)string withString:(NSString *)someStr {
    NSLog(@"THIS METHOD DOES NOT DO ANYTHING");
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

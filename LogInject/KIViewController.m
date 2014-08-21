//
//  KIViewController.m
//  LogInject
//
//  Created by kaiinui on 2014/08/21.
//  Copyright (c) 2014年 kaiinui. All rights reserved.
//

#import "KIViewController.h"
#import "KILogInject.h"

@interface KIViewController ()

@end

@implementation KIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [KILogInject inspect:@selector(doNothing:withString:) of:self];
    
    [self doNothing:@"somearg" withString:@"someString"];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)doNothing:(NSString *)string withString:(NSString *)someStr {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

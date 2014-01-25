//
//  FLLDetailViewController.m
//  Ground
//
//  Created by idoideas on 1/24/14.
//  Copyright (c) 2014 idoideas. All rights reserved.
//

#import "FLLDetailViewController.h"

@interface FLLDetailViewController ()
@end

@implementation FLLDetailViewController

#pragma mark - Managing the detail item

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSURL *myURL = [NSURL URLWithString:[self.url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSURLRequest *request = [NSURLRequest requestWithURL:myURL];
    [self.webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

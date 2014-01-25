//
//  FLLDetailViewController.h
//  Ground
//
//  Created by idoideas on 1/24/14.
//  Copyright (c) 2014 idoideas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLLDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (copy, nonatomic) NSString *url;

@end

//
//  FLLDetailViewController.h
//  Ground
//
//  Created by idoideas on 1/24/14.
//  Copyright (c) 2014 idoideas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FLLDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

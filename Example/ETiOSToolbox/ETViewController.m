//
//  ETViewController.m
//  ETiOSToolbox
//
//  Created by EricTan on 04/22/2016.
//  Copyright (c) 2016 EricTan. All rights reserved.
//

#import "ETViewController.h"
#import "ETFileUtil.h"
#import "ETHudUtil.h"
#import "MBProgressHUD.h"

@interface ETViewController ()

@end

@implementation ETViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSLog(@"document path is %@",[ETFileUtil getDocumentPath]);
    [ETHudUtil showTips:@"test hud util" toView:self.view duration:5];
    //同时也引入了MBProgressHUD
    [[MBProgressHUD showHUDAddedTo:self.view animated:YES] hide:YES afterDelay:10];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

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
#import "ETSizableTextView.h"
#import "Masonry.h"

@interface ETViewController ()

@end

@implementation ETViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSLog(@"document path is %@",[ETFileUtil getDocumentPath]);
    
    //引入ETHudUtil的同时也引入了MBProgressHUD
    [[MBProgressHUD showHUDAddedTo:self.view animated:YES] hide:YES afterDelay:10];
    [ETHudUtil showTips:@"test hud util" toView:self.view duration:5];
    
    ETSizableTextView *tv = [[ETSizableTextView alloc] init];
    tv.minHeight = 25;
    tv.maxHeight = 150;
    [self.view addSubview:tv];
    
    [tv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).with.offset(10);
        make.right.equalTo(self.view).with.offset(-10);
        make.top.equalTo(self.view).with.offset(10);
        make.bottom.equalTo(self.view).with.offset(-10);
    }];
    [tv setup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

//
//  HudUtil.m
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 15/3/4.
//  Copyright (c) 2015年 ENSInfo. All rights reserved.
//

#import "HudUtil.h"
#import "MBProgressHUD.h"

@implementation HudUtil

+ (void)showTips:(NSString*)tips toView:(UIView*)view duration:(int)duration {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.detailsLabelText = tips;
    //TODO:字体的传递问题
    hud.detailsLabelFont = [UIFont fontWithName:@"TitilliumWeb-Regular" size:15.0f];
    hud.mode = MBProgressHUDModeText;
    [hud hide:YES afterDelay:duration];
}

@end

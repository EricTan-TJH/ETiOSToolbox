//
//  ETHitTestUIView.m
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 15/7/8.
//  Copyright (c) 2015年 ENSInfo. All rights reserved.
//

#import "ETHitTestUIView.h"

@implementation ETHitTestUIView{
    NSMutableArray *arrayExclusiveViews;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *hittedView = [super hitTest:point withEvent:event];
    if (![hittedView isKindOfClass:[UITextField class]] && ![hittedView isKindOfClass:[UITextView class]] && ![arrayExclusiveViews containsObject:hittedView]) {
        [self endEditing:YES];
    }
    return hittedView;
}

- (void) addExclusiveComponent:(UIView*)view{
    if (arrayExclusiveViews==nil) {
        arrayExclusiveViews = [[NSMutableArray alloc]init];
    }
    [arrayExclusiveViews addObject:view];
}
@end

//
//  ETPlaceHolderTextView.h
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 14-8-16.
//  Copyright (c) 2014年 ENSInfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ETPlaceHolderTextView : UITextView

@property(nonatomic, retain) NSString *placeholder;
@property(nonatomic, retain) UIColor *placeholderColor;

-(void)textChanged:(NSNotification*)notification;

@end

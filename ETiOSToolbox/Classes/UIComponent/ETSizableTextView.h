//
//  ETSizableTextView.h
//  ETiOSToolbox
//
//  Created by EricTan on 16/4/25.
//  Copyright © 2016年 ENSInfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ETSizableTextViewDelegate
- (void)textviewSizeChanged;
- (void)inputChangeToMeaningless;
- (void)inputChangeToMeaningful;
@end

@interface ETSizableTextView : UIView<UITextViewDelegate>

@property (assign, nonatomic) id<ETSizableTextViewDelegate> delegate;
@property (assign, nonatomic) float minHeight;
@property (assign, nonatomic) float maxHeight;
@property (strong, nonatomic) UIColor *bgColor;
@property (strong, nonatomic) UIImage *bgImage;
@property (strong, nonatomic) UIFont *font;
@property (strong, nonatomic) UIColor *textColer;
@property (strong, nonatomic) NSString *placeHolder;
@property (strong, nonatomic) UIColor *placeHolderColor;

- (void)setup;

@end

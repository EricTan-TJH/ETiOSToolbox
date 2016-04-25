//
//  ETSizableTextView.m
//  ETiOSToolbox
//
//  Created by EricTan on 16/4/25.
//  Copyright © 2016年 ENSInfo. All rights reserved.
//

#import "ETSizableTextView.h"
#import "Masonry.h"

@implementation ETSizableTextView{
    UITextView *tvInput;
    BOOL isAddingANewLine;
    BOOL isDeletingALine;
    BOOL isEmptyBefore;
}

- (void)setup{
    isEmptyBefore = YES;
    
    tvInput = [[UITextView alloc]init];
    tvInput.backgroundColor = [UIColor lightGrayColor];
    [tvInput setFont:self.font];
    tvInput.delegate = self;
    [self addSubview:tvInput];
    
    [tvInput mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(10);
        make.right.equalTo(self).with.offset(-10);
        make.centerY.equalTo(self);
        make.height.mas_equalTo(self.minHeight);
    }];
}

-(void)textViewDidChange:(UITextView *)textView{
    if (isAddingANewLine || isDeletingALine) {
        [self changeFrameSize];
    }
    
    //Trim and delete line
    NSString *string = [textView.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    BOOL isEmptyNow = [string isEqual:@""];
    if (isEmptyNow) {
        //从有输入变成没有输入
        if (!isEmptyBefore) {
            [self.delegate inputChangeToMeaningless];
        }
    }else{
        //从没有输入变成有输入
        if (isEmptyBefore) {
            [self.delegate inputChangeToMeaningful];
        }
    }
    isEmptyBefore = isEmptyNow;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    isDeletingALine = NO;
    //退格或者退行
    if ([text isEqualToString:@""]&& range.length==1) {
        if([[textView.text substringWithRange:range] isEqualToString:@"\n"] ){
            //退行
            isDeletingALine = YES;
        }
    }
    
    isAddingANewLine = NO;
    if ([text isEqualToString:@"\n"]) {
        isAddingANewLine = YES;
    }
    
    if (range.location>=200){
        //控制输入文本的长度
        return  NO;
    }else{
        return YES;
    }
}

- (void)changeFrameSize{
    float toHeight = tvInput.contentSize.height;
    if (toHeight > self.maxHeight) {
        toHeight = self.maxHeight;
    }
    if (toHeight < self.minHeight) {
        toHeight = self.minHeight;
    }
    [tvInput mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(toHeight);
    }];
    [self layoutIfNeeded];
    [self.delegate textviewSizeChanged];
}
@end

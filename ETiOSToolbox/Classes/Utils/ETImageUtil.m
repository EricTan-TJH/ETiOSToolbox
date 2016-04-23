//
//  ETImageUtil.m
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 14/10/20.
//  Copyright (c) 2014年 ENSInfo. All rights reserved.
//

#import "ETImageUtil.h"

@implementation ETImageUtil

+ (UIImage *)compressImage:(UIImage *)imgSrc toSize:(CGSize)size
{
    if (imgSrc.size.width<size.width&&imgSrc.size.height<size.height) {
        return imgSrc;
    }
    
    float originalWidth = imgSrc.size.width;
    float originalHeigh = imgSrc.size.height;
    float targetWidth = size.width;
    float targetHeight = size.height;
    
    BOOL isOriginalWidthLargerThanHeight = originalWidth>originalHeigh;
    BOOL isTargetWidthLargerThanHeight = targetWidth>targetHeight;
    BOOL isOriginalTargetOpposite = isOriginalWidthLargerThanHeight^isTargetWidthLargerThanHeight;
    
    if (isOriginalTargetOpposite){
        targetWidth = size.height;
        targetHeight = size.width;
    }
    
    int widthCompressRate = targetWidth/originalWidth*100;
    int heightCompressRate = targetHeight/originalHeigh*100;
    if (widthCompressRate>heightCompressRate) {
        targetWidth = originalWidth*heightCompressRate/100;
    }else if(widthCompressRate<heightCompressRate){
        targetHeight = originalHeigh*widthCompressRate/100;
    }
    
    UIGraphicsBeginImageContext(CGSizeMake(targetWidth,targetHeight));
    CGRect rect = {0,0, targetWidth,targetHeight};
    [imgSrc drawInRect:rect];
    UIImage *compressedImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return compressedImg;
}

@end

//
//  ETImageUtil.h
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 14/10/20.
//  Copyright (c) 2014年 ENSInfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETImageUtil : NSObject

+ (UIImage *)compressImage:(UIImage *)imgSrc toSize:(CGSize)size;

@end

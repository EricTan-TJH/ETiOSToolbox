//
//  UIImageView+RoundedCorner.m
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 14-9-15.
//  Copyright (c) 2014年 Rockmoon. All rights reserved.
//

#import "UIImageView+RoundedCorner.h"

@implementation UIImageView (RoundedCorner)

-(void) cornerRoundWithRadius: (int) radius
{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}

@end

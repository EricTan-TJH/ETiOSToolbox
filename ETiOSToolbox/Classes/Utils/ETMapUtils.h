//
//  ETMapUtils.h
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 14/11/4.
//  Copyright (c) 2014年 ENSInfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface ETMapUtils : NSObject

+ (float)getDegreeHeadingForDirectionFromCoordinate:(CLLocationCoordinate2D)fromLoc toCoordinate:(CLLocationCoordinate2D)toLoc;

@end

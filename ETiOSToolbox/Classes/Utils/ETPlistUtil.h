//
//  ETPlistUtil.h
//  ETiOSToolbox
//
//  Created by EricTan on 16/4/17.
//  Copyright © 2016年 ENSInfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETPlistUtil : NSObject

+ (NSString*)fullPathOfPlistInMainBundle:(NSString *)plistName;
+ (NSMutableDictionary*)contentInPlistPath:(NSString*)plistPath;
+ (void)writeContent:(NSDictionary*)plistContent toPlist:(NSString*)plistPath;
+ (void)writeToPlist:(NSString*)plistPath WithKey:(NSString*)key value:(NSString *)value;

@end

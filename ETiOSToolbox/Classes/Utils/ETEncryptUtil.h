//
//  ETEncryptUtil.h
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 15/6/4.
//  Copyright (c) 2015年 ENSInfo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ETEncryptUtil : NSObject

+(NSString*)encryptString:(NSString*)strToEncrypt withKey:(NSString*)key;
+(NSString*)decryptString:(NSString*)strToDecrypt withKey:(NSString*)key;

@end
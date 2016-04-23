//
//  NSData+Encryption.h
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 15/6/4.
//  Copyright (c) 2015年 Rockmoon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (Encryption)

- (NSData *)AES256ParmEncryptWithKey:(NSString *)key;
- (NSData *)AES256ParmDecryptWithKey:(NSString *)key;

@end

//
//  ETEncryptUtil.m
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 15/6/4.
//  Copyright (c) 2015年 ENSInfo. All rights reserved.
//

#import "ETEncryptUtil.h"
#import "NSData+Encryption.h"

@implementation ETEncryptUtil

+(NSString*)encryptString:(NSString*)strToEncrypt withKey:(NSString*)key{
    if (strToEncrypt==nil){
        return nil;
    }
    NSData* strData = [strToEncrypt dataUsingEncoding:NSUTF8StringEncoding];
    NSData* encryptedData = [strData AES256ParmEncryptWithKey:key];
    NSString *strEncrypted = [encryptedData base64EncodedStringWithOptions:0];
    return strEncrypted;
}

+(NSString*)decryptString:(NSString*)strToDecrypt withKey:(NSString*)key{
    if (strToDecrypt ==nil) {
        return nil;
    }
    NSData *strData = [[NSData alloc]
                       initWithBase64EncodedString:strToDecrypt options:0];
    NSData* decryptedData = [strData AES256ParmDecryptWithKey:key];
    NSString *strDecrypted = [[NSString alloc]initWithData:decryptedData encoding:NSUTF8StringEncoding];
    return strDecrypted;
}

@end

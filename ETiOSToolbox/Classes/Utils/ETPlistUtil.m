//
//  ETPlistUtil.m
//  ETiOSToolbox
//
//  Created by EricTan on 16/4/17.
//  Copyright © 2016年 ENSInfo. All rights reserved.
//

#import "ETPlistUtil.h"

@implementation ETPlistUtil

+(void)writeToPlist:(NSString*)plistPath WithKey:(NSString*)key value:(NSString *)value
{
    if (plistPath==nil) {
        return;
    }
    NSFileManager *fileManager = [[NSFileManager  alloc]init];
    
    if(![fileManager fileExistsAtPath:plistPath])
    {
        if(![fileManager createFileAtPath:plistPath contents:nil attributes:nil])
        {
            NSLog(@"create file error");
        } else {
            NSDictionary* plistDic = [NSDictionary   dictionaryWithObjectsAndKeys:value,key ,nil];
            [plistDic writeToFile:plistPath atomically:YES];
            
        }
    } else {
        NSMutableDictionary   *plistDic  = [[NSMutableDictionary  alloc]initWithContentsOfFile: plistPath];
        [plistDic   setObject:  value forKey:key ];
        [plistDic   writeToFile:plistPath atomically:YES];
    }
}

+(NSString*)objectForKey:(NSString*)key inPlistPath:(NSString*)plistPath
{
    NSFileManager *fileManager = [[NSFileManager  alloc]init];
    
    if(![fileManager fileExistsAtPath:plistPath])
    {
        return nil;
    } else {
        NSMutableDictionary   *plistDic  = [[NSMutableDictionary  alloc]initWithContentsOfFile: plistPath];
        return [plistDic objectForKey:key];
    }
}

+(NSMutableDictionary*)contentInPlistPath:(NSString*)plistPath
{
    NSFileManager *fileManager = [[NSFileManager  alloc]init];
    NSMutableDictionary  *plistDic = nil;
    if([fileManager fileExistsAtPath:plistPath])
    {
        plistDic  = [[NSMutableDictionary  alloc]initWithContentsOfFile: plistPath];
    }
    NSLog(@"content in plist [%@] is:\n%@",plistPath,plistDic);
    return plistDic;
}

+(void)writeContent:(NSDictionary*)plistContent toPlist:(NSString*)plistPath{
    BOOL result = [plistContent writeToFile:plistPath atomically:YES];
    NSLog(@"content %@ write to plist [%@] is:\n%@",result?@"successfully":@"fail to",plistPath,plistContent);
}

+(NSString*)fullPathOfPlistInMainBundle:(NSString *)plistName
{
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.plist",plistName]];
    return finalPath;
}

@end

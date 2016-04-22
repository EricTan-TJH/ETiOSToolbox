//
//  FileUtil.m
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 15/6/4.
//  Copyright (c) 2015年 ENSInfo. All rights reserved.
//

#import "FileUtil.h"

@implementation FileUtil

+ (void)deleteFile:(NSString*)fileFullPath{
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    BOOL fileExist = [fileMgr fileExistsAtPath:fileFullPath];
    if (fileExist) {
        NSError *err;
        [fileMgr removeItemAtPath:fileFullPath error:&err];
        if (err==nil) {
            NSLog(@"delete file successfully");
        }else{
            NSLog(@"delete file fail");
        }
    }
}

+ (NSString*)getDocumentPath
{
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    return docsDir;
}

+ (NSString*)getTempDir {
    return NSTemporaryDirectory();
}

+(BOOL)isFileExist:(NSString*)filePath
{
    NSFileManager *fileManager = [[NSFileManager  alloc]init];
    return [fileManager fileExistsAtPath:filePath];
}

+(NSString*)rootPathByType:(RootPathType)type{
    NSString *path;
    switch (type) {
        case RootPathTypeDocument:
            path = [self getDocumentPath];
            break;
        case RootPathTypeTemp:
            path = [self getTempDir];
            break;
        default:
            break;
    }
    return path;
}

+(BOOL)saveFileData:(NSData*)fileData withName:(NSString*)name toRelatePath:(NSString*)path underRoot:(RootPathType)rootType{
    NSString *fullPathOfFile = [[[self rootPathByType:rootType] stringByAppendingPathComponent:path] stringByAppendingPathComponent:name];
    return [fileData writeToFile:fullPathOfFile atomically:YES];
}

+(NSData*)contentsForName:(NSString*)name atRelatePath:(NSString*)path underRoot:(RootPathType)rootType{
    NSString *fullPathOfFile = [[[self rootPathByType:rootType] stringByAppendingPathComponent:path] stringByAppendingPathComponent:name];
    NSFileManager* fm=[NSFileManager defaultManager];
    return [fm contentsAtPath:fullPathOfFile];
}

+(NSArray*)filesListUnderRelatedPath:(NSString*)path underRoot:(RootPathType)rootType{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString* fullPath = [[self rootPathByType:rootType] stringByAppendingPathComponent:path];
    NSError* error;
    NSArray* filesList = [fileManager contentsOfDirectoryAtPath:fullPath error:&error];
    if (error != nil) {
        NSLog(@"FileUtil - Get file list under path [%@] error [%@]",path,error);
    }
    return filesList;
}

+ (BOOL)createDirWithRelatedPath:(NSString*)path underRoot:(RootPathType)rootType {
    NSString* fullPath = [[self rootPathByType:rootType] stringByAppendingPathComponent:path];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    return [fileMgr createDirectoryAtPath:fullPath withIntermediateDirectories:YES attributes:nil error:nil];
}
@end

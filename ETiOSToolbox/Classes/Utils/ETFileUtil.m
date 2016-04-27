//
//  ETFileUtil.m
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 15/6/4.
//  Copyright (c) 2015年 ENSInfo. All rights reserved.
//

#import "ETFileUtil.h"

@implementation ETFileUtil

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

+(BOOL)isFileExist:(NSString*)filePath
{
    NSFileManager *fileManager = [[NSFileManager  alloc]init];
    return [fileManager fileExistsAtPath:filePath];
}

+(BOOL)createDirWithRelatedPath:(NSString*)path underRoot:(RootPathType)rootType {
    NSString* fullPath = [[self rootPathByType:rootType] stringByAppendingPathComponent:path];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    return [fileMgr createDirectoryAtPath:fullPath withIntermediateDirectories:YES attributes:nil error:nil];
}

+(BOOL)saveFileData:(NSData*)fileData withName:(NSString*)name toRelatePath:(NSString*)path underRoot:(RootPathType)rootType{
    NSString *fullPathOfFile = [self fullPathForName:name atRelatedPath:path underRoot:rootType];
    return [fileData writeToFile:fullPathOfFile atomically:YES];
}

+(NSData*)contentsForName:(NSString*)name atRelatePath:(NSString*)path underRoot:(RootPathType)rootType{
    NSString *fullPathOfFile = [self fullPathForName:name atRelatedPath:path underRoot:rootType];
    NSFileManager* fm=[NSFileManager defaultManager];
    return [fm contentsAtPath:fullPathOfFile];
}

+ (NSData*)contentsForFullPath:(NSString*)filePath{
    NSFileManager* fm=[NSFileManager defaultManager];
    NSData *fileData = [fm contentsAtPath:filePath];
    return fileData;
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

+ (void)copyFileFromPath:(NSString*)srcPath toPath:(NSString*)desPath{
    //所谓文件拷贝 就是从原文件里读往目的文件里写
    //首先创建文件
    NSFileManager * fm =[NSFileManager defaultManager];
    NSError * error = nil;
    
    //获取源文件的属性
    NSDictionary *attributes = [fm attributesOfItemAtPath:srcPath error:&error];
    if(error){
        NSLog(@"%@",error);
        return;
    }
    
    //创建新文件
    BOOL ret = [fm createFileAtPath:desPath contents:nil attributes:attributes];
    if (!ret) {
        return;
    }
    
    //打开文件句柄
    NSFileHandle * srcFh = [NSFileHandle fileHandleForReadingAtPath:srcPath];
    NSFileHandle * dstFh = [NSFileHandle fileHandleForWritingAtPath:desPath];
    
    //不要一口气就将源文件读入内存
    //首先要获取源文件大小
    unsigned long long size = [attributes fileSize];
    
    //这是一个方法，只有当字典中装文件属性才有效 实际上是一个类别
    int buff = 100;
    while (size) {
        NSData * data =  nil;
        if (size <= buff) {
            data = [srcFh readDataToEndOfFile];
            size  = 0;
        }else{
            //先读100个字节
            data = [srcFh readDataOfLength:buff];
            size -= buff;
        }
        [dstFh writeData:data];
    }
}

+ (NSString*)fullPathForName:(NSString*)name atRelatedPath:(NSString*)path underRoot:(RootPathType)rootType{
    return [[[self rootPathByType:rootType] stringByAppendingPathComponent:path] stringByAppendingPathComponent:name];
}
@end

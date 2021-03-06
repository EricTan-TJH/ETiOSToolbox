//
//  ETFileUtil.h
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 15/6/4.
//  Copyright (c) 2015年 ENSInfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ETFileUtil : NSObject

typedef NS_ENUM(NSInteger, RootPathType) {
    RootPathTypeDocument = 1,
    RootPathTypeTemp = 2
};

+ (NSString*)getDocumentPath;
+ (NSString*)getTempDir;
+ (void)deleteFile:(NSString*)fileFullPath;
+ (BOOL)isFileExist:(NSString*)filePath;

+ (BOOL)saveFileData:(NSData*)fileData withName:(NSString*)name toRelatePath:(NSString*)path underRoot:(RootPathType)rootType;
+ (NSArray*)filesListUnderRelatedPath:(NSString*)path underRoot:(RootPathType)rootType;
+ (BOOL)createDirWithRelatedPath:(NSString*)path underRoot:(RootPathType)rootType;
+ (NSData*)contentsForName:(NSString*)name atRelatePath:(NSString*)path underRoot:(RootPathType)rootType;
+ (NSData*)contentsForFullPath:(NSString*)filePath;
+ (void)copyFileFromPath:(NSString*)srcPath toPath:(NSString*)desPath;
+ (NSString*)fullPathForName:(NSString*)name atRelatedPath:(NSString*)path underRoot:(RootPathType)rootType;
@end

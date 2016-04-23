//
//  FileUtil.h
//  ETiOSToolbox
//
//  Created by 谭剑晖 on 15/6/4.
//  Copyright (c) 2015年 ENSInfo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FileUtil : NSObject

typedef NS_ENUM(NSInteger, RootPathType) {
    RootPathTypeDocument = 1,
    RootPathTypeTemp = 2
};

+ (NSString*)getDocumentPath;
+ (NSString*)getTempDir;
+ (void)deleteFile:(NSString*)fileFullPath;

+ (BOOL)saveFileData:(NSData*)fileData withName:(NSString*)name toRelatePath:(NSString*)path underRoot:(RootPathType)rootType;
+ (NSArray*)filesListUnderRelatedPath:(NSString*)path underRoot:(RootPathType)rootType;
+ (BOOL)createDirWithRelatedPath:(NSString*)path underRoot:(RootPathType)rootType;
+ (NSData*)contentsForName:(NSString*)name atRelatePath:(NSString*)path underRoot:(RootPathType)rootType;
@end

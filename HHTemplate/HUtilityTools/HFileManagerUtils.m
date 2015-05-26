//
//  HFileManagerUtils.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/19/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "HFileManagerUtils.h"

#define HHeaderImageCache  @"HHeaderImageCaches"
#define HShareImageCache   @"HShareImagesCaches"
#define HCommentImageCache @"HCommentImageChaches"

@implementation HFileManagerUtils

+(void)createAllCahcheFolders{
    NSString * caches = [self getCachesDirectoryPath];
    [self createFolderAtPath:caches folderName:HHeaderImageCache];
    [self createFolderAtPath:caches folderName:HShareImageCache];
    [self createFolderAtPath:caches folderName:HCommentImageCache];
}

+(NSString *)getCachesDirectoryForKey:(HCachePathKey)keyType{
    NSString * caches = [self getCachesDirectoryPath];
    switch (keyType) {
        case HCachePathHeaderImageKey:
            return [caches stringByAppendingPathComponent:HHeaderImageCache];
            break;
        case HCachePathShareImageKey:
            return [caches stringByAppendingPathComponent:HShareImageCache];
            break;
        case HCachePathCommentImageKey:
            return [caches stringByAppendingPathComponent:HCommentImageCache];
            break;
        default:
            break;
    }
    return caches;
}

+(NSString *)getHomeDirectoryPath{
    return NSHomeDirectory();
}

+(NSString *)getDocumentDirectoryPath{
    NSArray * arrPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSAssert(arrPath.count > 0, @"Get Document Directory Failed!");
    return [arrPath firstObject];
}

+(NSString *)getLibraryDirectoryPath{
    NSArray * arrPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    NSAssert(arrPath.count > 0, @"Get Library Directory Failed!");
    return [arrPath firstObject];
}

+(NSString *)getCachesDirectoryPath{
    NSArray * arrPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
    NSAssert(arrPath.count > 0, @"Get Caches Directory Failed!");
    return [arrPath firstObject];
}

+(BOOL)createFolderAtPath:(NSString *)path folderName:(NSString *)folderName{
    BOOL isDir = NO;
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * dirPath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",folderName]];
    BOOL existed = [fileManager fileExistsAtPath:dirPath isDirectory:&isDir];
    if (!(existed && isDir)) {
        NSError * error = nil;
        [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            return NO;
        }
        return YES;
    }
    //Folder is exist
    return YES;
}

+(BOOL)deleteFileAtPath:(NSString *)fPath{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSError * error = nil;
    [fileManager removeItemAtPath:fPath error:&error];
    if (error) {
        return NO;
    }
    return YES;
}

+(BOOL)createFileAtPath:(NSString *)path fileName:(NSString *)fileName deleteIfExist:(BOOL)bRemove{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * filePath = [path stringByAppendingPathComponent:[NSString stringWithFormat:@"/%@",fileName]];
    BOOL existed = [fileManager fileExistsAtPath:filePath];
    if (existed) {
        if (bRemove) {
            [self deleteFileAtPath:filePath];
            
            NSError * error = nil;
            [fileManager createFileAtPath:filePath contents:nil attributes:nil];
            if (error) {
                return NO;
            }
            return YES;
        }else{
            return YES;
        }
    }else{
        NSError * error = nil;
        [fileManager createFileAtPath:filePath contents:nil attributes:nil];
        if (error) {
            return NO;
        }
        return YES;
    }
    //Folder is exist
    return YES;
}


+(NSArray *)getAllFilenamesAtFolder:(NSString *)folder withSuffix:(NSString *)suffix containSubFolder:(BOOL)bContain{
    NSFileManager  * fileManager  = [NSFileManager defaultManager];
    NSMutableArray * filenamelist = [NSMutableArray arrayWithCapacity:10];
    NSArray * tmplist = [fileManager contentsOfDirectoryAtPath:folder error:nil];
    if (suffix == nil) {
        return tmplist;
    }else{
        for (NSString *filename in tmplist) {
            NSString *fullpath = [folder stringByAppendingPathComponent:filename];
            BOOL isDir = NO;
            BOOL isExist = [fileManager fileExistsAtPath:fullpath isDirectory:&isDir];
            if (isDir) {
                if (bContain && isExist) {
                    [filenamelist  addObject:filename];
                }
            }else{
                if (isExist && [[filename pathExtension] isEqualToString:suffix]) {
                    [filenamelist  addObject:filename];
                }
            }
        }
    }
    return filenamelist;
}


@end

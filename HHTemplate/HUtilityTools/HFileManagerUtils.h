//
//  HFileManagerUtils.h
//  HHTemplate
//
//  Created by 梁军 胡 on 5/19/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    HCachePathHeaderImageKey,
    HCachePathShareImageKey,
    HCachePathCommentImageKey,
} HCachePathKey;

@interface HFileManagerUtils : NSObject

/**
 *  创建需要的缓存目录
 */
+(void)createAllCahcheFolders;

/**
 *  获取图片缓存目录
 *
 *  @param keyType 目录类型
 *
 *  @return return value description
 */
+(NSString *)getCachesDirectoryForKey:(HCachePathKey)keyType;

/**
 *  HomeDirectoryPath string
 *
 *  @return return value description
 */
+(NSString *)getHomeDirectoryPath;

/**
 *  DocumentDirectoryPath string
 *
 *  @return return value description
 */
+(NSString *)getDocumentDirectoryPath;

/**
 *  LibraryDirectoryPath string
 *
 *  @return return value description
 */
+(NSString *)getLibraryDirectoryPath;

/**
 *  CachesDirectoryPath string
 *
 *  @return return value description
 */
+(NSString *)getCachesDirectoryPath;

/**
 *  创建文件目录
 *
 *  @param path       path description
 *  @param folderName folderName description
 *
 *  @return return value description
 */
+(BOOL)createFolderAtPath:(NSString *)path
               folderName:(NSString *)folderName;

/**
 *  删除文件
 *
 *  @param folderPath folderPath description
 *
 *  @return return value description
 */
+(BOOL)deleteFileAtPath:(NSString *)fPath;

/**
 *  穿件文件
 *
 *  @param path     path description
 *  @param fileName fileName description
 *
 *  @return return value description
 */
+(BOOL)createFileAtPath:(NSString *)path
               fileName:(NSString *)fileName
          deleteIfExist:(BOOL)bRemove;

/**
 *  获取某个目录下文件,不包含子文件夹
 *
 *  @param folder 路径
 *  @param suffix 文件后缀  if nil return all and contain sub foldername
 *  @param containSubFolder  是否返回子文件夹名称
 *  @return return value description
 */
+(NSArray *)getAllFilenamesAtFolder:(NSString *)folder
                         withSuffix:(NSString *)suffix
                      containSubFolder:(BOOL)bContain;

@end

//
//  HRequestUtils.h
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    HAPIRequestTypeGet,
    HAPIRequestTypePost,
    HAPIRequestTypeDelete,
    HAPIRequestTypePut
} HAPIRequestType;

typedef void(^HReqeustFinished)(id content,NSInteger status,BOOL success);


extern NSString * ActionMethodBuild(NSString * module,NSString * actionMethod);

@interface HRequestUtils : NSObject

/**
 *  异步接口请求
 *
 *  @param apiURL   接口地址
 *  @param params   接口参数
 *  @param mType    请求方式 GET POST Delete Put
 *  @param finished 接口请求完成回调
 */
+ (void)asyncPostRequestByAPIURL:(NSString *)apiURL
                      withParams:(NSDictionary *)params
                     requestType:(HAPIRequestType)mType
                        finished:(HReqeustFinished)finished;

/**
 *  图片文件质量
 *
 *  @param resourceURL 资源文件路径
 *  @param images      图片数组
 *  @param qulity      压缩图片质量 0~1 0 最大压缩 1 不压缩
 *  @param dicP        接口请求参数
 *  @param finished    请求完成回调
 */
+(void)uploadImageToResourceURL:(NSString *)resourceURL
                         images:(NSArray *)images
                 compressQulity:(float)qulity
                         params:(NSDictionary *)dicP
                       finished:(HReqeustFinished)finished;

/**
 *  上传纯文本给服务器
 *
 *  @param uploadUrl uploadUrl description
 *  @param data      data description
 *  @param mType     mType description
 *  @param finished  finished description
 */
+(void)uploadJustBodyDataToServer:(NSString *)uploadUrl
                         bodyData:(NSData *)data
                      requestType:(HAPIRequestType)mType
                         finished:(HReqeustFinished)finished;

/**
 *  返回接口访问错误描述/系统级别的，非接口本身的返回
 *
 *  @param code code description
 *
 *  @return return value description
 */
+(NSString *)getCFStreamErrorMessageByErrorInfo:(NSError *)error;

@end

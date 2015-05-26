//
//  HRequestUtils.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "HRequestUtils.h"
#import "HDefine.h"

#import <AFNetworking/AFHTTPRequestOperationManager.h>


//Online Test
#define API_REQUEST_URL     @"http://223.255.7.194:9000/imove-api-test/api"
#define WEB_SHOW_URL        @"http://223.255.7.194:9000/imove-api-test/web/share"

//Develop
//#define API_REQUEST_URL   @"http://192.168.1.222:8081/imove-api/api"
//#define WEB_SHOW_URL      @"http://192.168.1.222:8081/imove-api/web/share"

//Resource url/Users/iFallen/Downloads/9b4b8a54249c4f329a27016327393df6_big.png
#define IMAGE_SHOW_URL     @"http://223.255.7.194:9000/sport-upload"
#define IMAGE_UPLOAD_URL   @"http://223.255.7.194:9000/sport-upload/common/appUpload.do"

@implementation HRequestUtils

NSString * ActionMethodBuild(NSString * module,NSString * actionMethod){
    NSMutableString * strAPIURL = [NSMutableString stringWithString:API_REQUEST_URL];
    
    if (module && [module respondsToSelector:@selector(length)] && module.length) {
        [strAPIURL appendString:[NSString stringWithFormat:@"/%@",module]];
    }
    
    if (actionMethod && [actionMethod respondsToSelector:@selector(length)] && actionMethod.length) {
        [strAPIURL appendString:[NSString stringWithFormat:@"/%@",actionMethod]];
    }
    return strAPIURL;
}


+(void)asyncPostRequestByAPIURL:(NSString *)apiURL withParams:(NSDictionary *)params requestType:(HAPIRequestType)mType finished:(HReqeustFinished)completion{
    AFHTTPRequestOperationManager * manager=[AFHTTPRequestOperationManager manager];
    //    manager.requestSerializer.timeoutInterval = 30;
    
    //Mark:
    //NSMutableDictionary * dicExtral = [NSMutableDictionary dictionaryWithDictionary:params];
    //[dicExtral setObject:@"ExtralParam" forKey:@"key"];
    switch (mType) {
        case HAPIRequestTypeGet:
        {
            [manager GET:apiURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"InHRequestUtilssuccess====obj:%@",responseObject);
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    if (completion) {
                        NSInteger code = [[responseObject objectForKey:@"status"] integerValue];
                        completion(responseObject,code,YES);
                    }
                }else{
                    if (completion) {
                        completion([responseObject objectForKey:@"data"],[[responseObject objectForKey:@"status"] integerValue],YES);
                    }
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"InHRequestUtilserror======%@",error);
                if (completion) {
                    completion([HRequestUtils getCFStreamErrorMessageByErrorInfo:error],0,NO);
                }
            }];
        }
            break;
        case HAPIRequestTypePost:
        {
            [manager POST:apiURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"InHRequestUtilssuccess====obj:%@",responseObject);
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    if (completion) {
                        NSInteger code = [[responseObject objectForKey:@"status"] integerValue];
                        completion(responseObject,code,YES);
                    }
                }else{
                    if (completion) {
                        completion([responseObject objectForKey:@"data"],[[responseObject objectForKey:@"status"] integerValue],YES);
                    }
                }
            } failure:^(AFHTTPRequestOperation * operation, NSError *error) {
                NSLog(@"InHRequestUtilserror======%@",error);
                if (completion) {
                    completion([HRequestUtils getCFStreamErrorMessageByErrorInfo:error],0,NO);
                }
            }];
        }
            break;
        case HAPIRequestTypeDelete:
        {
            [manager DELETE:apiURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"InHRequestUtilssuccess====obj:%@",responseObject);
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    if (completion) {
                        NSInteger code = [[responseObject objectForKey:@"status"] integerValue];
                        completion(responseObject,code,YES);
                    }
                }else{
                    if (completion) {
                        completion([responseObject objectForKey:@"data"],[[responseObject objectForKey:@"status"] integerValue],YES);
                    }
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"InHRequestUtilserror======%@",error);
                if (completion) {
                    completion([HRequestUtils getCFStreamErrorMessageByErrorInfo:error],0,NO);
                }
            }];
        }
            break;
        case HAPIRequestTypePut:
        {
            [manager PUT:apiURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
                NSLog(@"InHRequestUtilssuccess====obj:%@",responseObject);
                if ([responseObject isKindOfClass:[NSDictionary class]]) {
                    if (completion) {
                        NSInteger code = [[responseObject objectForKey:@"status"] integerValue];
                        completion(responseObject,code,YES);
                    }
                }else{
                    if (completion) {
                        completion([responseObject objectForKey:@"data"],[[responseObject objectForKey:@"status"] integerValue],YES);
                    }
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                NSLog(@"InHRequestUtilserror======%@",error);
                if (completion) {
                    completion([HRequestUtils getCFStreamErrorMessageByErrorInfo:error],0,NO);
                }
            }];
        }
            break;
        default:
            break;
    }
}

+(void)uploadImageToResourceURL:(NSString *)resourceURL images:(NSArray *)images compressQulity:(float)qulity params:(NSDictionary *)dicP finished:(HReqeustFinished)completion{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //Mark:
    //NSMutableDictionary * dicExtral = [NSMutableDictionary dictionaryWithDictionary:params];
    //[dicExtral setObject:@"ExtralParam" forKey:@"key"];
    [manager POST:resourceURL parameters:dicP constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        int i = 1;
        for (id img in images) {
            //0 最大压缩 1 最小压缩
            [formData appendPartWithFileData:UIImageJPEGRepresentation(img, qulity)
                                        name:@"imgFile"
                                    fileName:[NSString stringWithFormat:@"imgFile%d.jpg",i++]
                                    mimeType:@"image/jpg"];
        }
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"InHRequestUtilssuccess====obj:%@",responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            if (completion) {
                NSInteger code = [[responseObject objectForKey:@"status"] integerValue];
                completion(responseObject,code,YES);
            }
        }else{
            if (completion) {
                completion([responseObject objectForKey:@"data"],[[responseObject objectForKey:@"status"] integerValue],YES);
            }
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        if (completion) {
            completion([HRequestUtils getCFStreamErrorMessageByErrorInfo:error],0,NO);
        }
    }];
}

+(void)uploadJustBodyDataToServer:(NSString *)uploadUrl bodyData:(NSData *)data requestType:(HAPIRequestType)mType finished:(HReqeustFinished)finished{
    NSMutableURLRequest *request =
    [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:uploadUrl]];
    switch (mType) {
            
        case HAPIRequestTypeGet:
            [request setHTTPMethod:@"GET"];
            break;
            
        case HAPIRequestTypePost:
            [request setHTTPMethod:@"POST"];
            break;
            
        default:
            break;
    }
    
    [request setTimeoutInterval:30.0f];
    [request setHTTPBody:data];
    /*
     //MARK: NSURLConnection 方式提交
     NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if ([data length] >0 &&
            connectionError == nil){
            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            NSLog(@"HTML = %@", [html objectFromJSONString]);
        }
        else if ([data length] == 0 &&
                 connectionError == nil){
            NSLog(@"Nothing was get.");
        }
        else if (connectionError != nil){
            NSLog(@"Error happened = %@", connectionError);
        }
    }];
     */
    //MARK:AFHTTPRequestOperationManager方式提交
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSOperation *operation =
    [manager HTTPRequestOperationWithRequest:request
                                     success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                         NSLog(@"%@",responseObject);
                                         NSLog(@"InHRequestUtilssuccess====obj:%@",responseObject);
                                         if ([responseObject isKindOfClass:[NSDictionary class]]) {
                                             if (finished) {
                                                 NSInteger code = [[responseObject objectForKey:@"status"] integerValue];
                                                 finished(responseObject,code,YES);
                                             }
                                         }else{
                                             if (finished) {
                                                 finished([responseObject objectForKey:@"data"],[[responseObject objectForKey:@"status"] integerValue],YES);
                                             }
                                         }
                                     }
                                     failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                         NSLog(@"Error: %@", error);
                                         if (finished) {
                                             finished([HRequestUtils getCFStreamErrorMessageByErrorInfo:error],0,NO);
                                         }
                                     }];
    [manager.operationQueue addOperation:operation];
}

+(NSString *)getCFStreamErrorMessageByErrorInfo:(NSError *)error{
    if (error) {
        //        NSDictionary * dicInfo = [error userInfo];
        //        dicInfo[@"NSLocalizedDescription"] //错误不同，key值不同，不能作为判断
        long code = error.code;
        //MARK:
        NSLog(@"code:%ld\n###DebugInfo:%@\n",code,error.debugDescription);
        switch (code) {
            case -1004:
            {
                return @"H51:无法连接服务器,请检查网络@_@";
            }
                break;
            case 3840:
            {
                return @"H52:访问的接口地址不存在@_@";
            }
                break;
            default:
            {
                return @"H00:未知错误";
            }
                break;
        }
    }else{
        return error.description;
    }
    return @"!!!未知错误";
}

@end

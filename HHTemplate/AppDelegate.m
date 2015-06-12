//
//  AppDelegate.m
//  HHTemplate
//
//  Created by 梁军 胡 on 5/11/15.
//  Copyright (c) 2015 iMoveStudio-iFallen. All rights reserved.
//

#import "AppDelegate.h"
#import "HDefine.h"
#import "HStringUtils.h"
#import "HDateUtils.h"
#import "HTextFiled.h"
#import "HButton.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import <JSONKit-NoWarning/JSONKit.h>
#import "HFileManagerUtils.h"
#import "HConfigUtils.h"

#define FileCreateURL @"http://192.168.0.222:8082/sport-upload/createFile.do"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    NSLog(@"%@",[HStringUtils checkText:[NSNumber numberWithInt:111]]);
    NSLog(@"%@",[HStringUtils checkText:[NSNumber numberWithInt:0]]);
    NSLog(@"==%@==",[HStringUtils checkText:@""]);
    NSLog(@"==%@==",[HStringUtils checkText:nil]);
    NSLog(@"==%@==",[HStringUtils checkText:[NSNull null]]);
    NSLog(@"==%@==",[HStringUtils checkText:@"123"]);
    return YES;
    
//    [[NSBundle mainBundle] pathForResource:<#(NSString *)#> ofType:<#(NSString *)#>];
//    [[NSBundle mainBundle] pathForAuxiliaryExecutable:@""];
    
    //config test
    NSLog(@"%@",[HConfigUtils getAPIRequetURL]);
    NSLog(@"%@",[HConfigUtils getFileUploadPath]);
    NSLog(@"%@",[HConfigUtils getRemoteResourcePath]);
    
    return YES;
    
    //FileManager Test
    [HFileManagerUtils createAllCahcheFolders];
    NSLog(@"%@",[HFileManagerUtils getCachesDirectoryForKey:HCachePathCommentImageKey]);
    
    
//    NSLog(@"%@",[HFileManagerUtils getHomeDirectoryPath]);
//    NSLog(@"%@",[HFileManagerUtils getCachesDirectoryPath]);
//    NSLog(@"%@",[HFileManagerUtils getLibraryDirectoryPath]);
//    NSLog(@"%@",[HFileManagerUtils getDocumentDirectoryPath]);
    
//    [HFileManagerUtils createFolderAtPath:[HFileManagerUtils getCachesDirectoryPath] folderName:@"HHeaderImages/AA/BB"];
//    [HFileManagerUtils createFileAtPath:[[HFileManagerUtils getCachesDirectoryPath] stringByAppendingPathComponent:@"HHeaderImages"] fileName:@"hhtext2.jpg" deleteIfExist:YES];
//    [HFileManagerUtils deleteFileAtPath:[[HFileManagerUtils getCachesDirectoryPath] stringByAppendingPathComponent:@"HHeaderImages"]];
    NSArray * arr = [HFileManagerUtils getAllFilenamesAtFolder:[[HFileManagerUtils getCachesDirectoryPath] stringByAppendingPathComponent:@"HHeaderImages"] withSuffix:@"jpg" containSubFolder:NO];
    NSLog(@"%@",arr);
    
    return YES;
    
    //StringUtils DateUtils SubControls Test
    NSLog(@"%@,%@",NSStringFromCGRect(self.window.frame),ActionMethodBuild(@"module",@"test"));
    
    [self.window makeKeyAndVisible];
    NSLog(@"%d",[HStringUtils isMobileValid:@"111112345678"]);
    NSLog(@"%d",[HStringUtils isPasswordValid:@"123456"]);
    NSLog(@"%d",[HStringUtils isPasswordValid:@"12345A"]);
    NSLog(@"%d",[HStringUtils isPasswordValid:@"random"]);
    
    NSLog(@"%d",[HStringUtils isEmailValid:@"hulj1204@yahoo.com"]);
    NSLog(@"%d",[HStringUtils isEmailValid:@"373380675com"]);
    
    NSLog(@"%@",[HDateUtils getCurrentDate_TimeWithSecond:YES isChinese:YES]);
    NSLog(@"%@",[HDateUtils getCurrentDate_TimeWithSecond:YES isChinese:NO]);
    NSLog(@"%@",[HDateUtils getCurrentDate_TimeWithSecond:NO isChinese:YES]);
    NSLog(@"%@",[HDateUtils getCurrentDate_TimeWithSecond:NO isChinese:NO]);
    
    NSLog(@"%@",[HDateUtils getCurrentDateisChinese:YES]);
    NSLog(@"%@",[HDateUtils getCurrentDateisChinese:NO]);
    
    NSLog(@"%@",[HDateUtils getCurrentTimeNeedSecond:YES]);
    NSLog(@"%@",[HDateUtils getCurrentTimeNeedSecond:NO]);
    
    
    NSString * cDate = [HDateUtils getCurrentDate_TimeWithSecond:YES isChinese:NO];
    NSString * mill  = [HDateUtils millSecondFromDate:cDate hasSecond:YES splitChar:@"-"];
    NSNumber * llValue = [NSNumber numberWithLongLong:[mill longLongValue]];
    NSLog(@"A:%@",mill);
    NSLog(@"%@",[[NSDate date] description]);
    NSLog(@"B:%f",[[NSDate date] timeIntervalSince1970]);
    NSLog(@"%@",[HDateUtils dateFromMilliSecond:llValue isCHN:NO needTime:YES splitChar:@"-"]);
    NSLog(@"%@",[HDateUtils timeFromMillSecond:llValue]);
    
    NSLog(@"utc to local : %@",[HDateUtils UTCDateTOLocalDate:[[NSDate date] description] toCHN:NO needSecond:YES]);
    
    
//    [HRequestUtils asyncPostRequestByAPIURL:ActionMethodBuild(@"show/getShow") withParams:nil requestType:HAPIRequestTypeGet finished:^(id content, NSInteger status, BOOL success) {
//        NSLog(@"%@",content);
//
    for (int i = 0; i < 5; i++) {
        HTextFiled * text = [[HTextFiled alloc] initWithFrame:CGRectMake(50, 50 + 50 * i, 200, 30)];
        [text setBackgroundColor:[UIColor lightGrayColor]];
        text.maxLength = 10;
        text.minLength = 5;
        [self.window addSubview:text];
        switch (i) {
            case 0:
                [text setTextFType:HTextFiledTypeNumbers];
                break;
            case 1:
                [text setTextFType:HTextFiledTypeLetters];
                break;
            case 2:
                [text setTextFType:HTextFiledTypePassword];
                break;
            case 3:
                [text setTextFType:HTextFiledTypeEmail];
                break;
            case 4:
                [text setTextFType:HTextFiledTypeText];
                break;
            default:
                break;
        }
    }
    
    
    for (int i = 0; i < 2; i++) {
        HButton * btn = [[HButton alloc] initWithFrame:CGRectMake(50, 300 + 50 * i, 200, 30) title:@"点击获取验证码" buttonAction:^{
            NSLog(@"button action");
        }];
        [btn setType:HButtonTypeCountDown];
        if (i == 1) {
            [btn setTCount:10];
        }
        [self.window addSubview:btn];
    }
    
    HButton * btn = [[HButton alloc] initWithFrame:CGRectMake(50, 400, 200, 30)];
    [btn setTitleText:@"确定" forState:UIControlStateNormal];
    [self.window addSubview:btn];
    [btn setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];

    NSLog(@"%@",[HFileManagerUtils getDocumentDirectoryPath]);
    
//    NSLog(@"%@",NSHomeDirectory());
//    
//    NSArray *directoryPaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES);
//    
//    NSString *documentDirectory = [directoryPaths objectAtIndex:0];
//    
//    NSLog(@"%@",documentDirectory);
    
    
//    [HRequestUtils asyncPostRequestByAPIURL:@"http://192.168.1.222:8082/sport-upload/getFileSize/c46298076234429dbb260036e81ea608" withParams:nil requestType:HAPIRequestTypeGet finished:^(id content, NSInteger status, BOOL success) {
//        NSLog(@"%@",content);
//    }];
//    
//    return YES;
    
//    getFileSizeUrl = "http://192.168.1.222:8082/sport-upload/getFileSize/c46298076234429dbb260036e81ea608";
//    isSuc = 1;
//    NSString *  uploadUrl = @"http://192.168.1.222:8082/sport-upload/upload/c46298076234429dbb260036e81ea608";
//    UIImage * image = [UIImage imageNamed:@"IMG_3522.jpg"];
//    
////    NSData * imgData = UIImageJPEGRepresentation(image, 0.);
//    NSData * imgData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"IMG_3522" ofType:@"jpg"]];
//    imgData = [imgData subdataWithRange:NSMakeRange(0, imgData.length / 2)];
//    imgData = [imgData subdataWithRange:NSMakeRange(2940136, imgData.length - 2940136)];
//    imgData = [imgData subdataWithRange:NSMakeRange(1055529, imgData.length - 1055529)];
    
//    [HRequestUtils uploadJustBodyDataToServer:uploadUrl bodyData:imgData requestType:HAPIRequestTypePost finished:^(id content, NSInteger status, BOOL success) {
//        if (success) {
//            if (status == 200) {
//                NSLog(@"uploaded...");
//            }
//        }
//    }];
    
    /*
    NSMutableURLRequest *request =
    [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:uploadUrl]];
    [request setHTTPMethod:@"POST"];
    [request setTimeoutInterval:30.0f];
    [request setHTTPBody:imgData];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
//    [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
//        if ([data length] >0 &&
//            connectionError == nil){
//            NSString *html = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"HTML = %@", [html objectFromJSONString]);
//        }
//        else if ([data length] == 0 &&
//                 connectionError == nil){
//            NSLog(@"Nothing was get.");
//        }
//        else if (connectionError != nil){
//            NSLog(@"Error happened = %@", connectionError);
//        }
//    }];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSOperation *operation =
    [manager HTTPRequestOperationWithRequest:request
                                          success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                              // 成功后的处理
                                              NSLog(@"%@",responseObject);
                                          }
                                          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                              // 失败后的处理
                                              NSLog(@"%@",error);
                                          }];
    [manager.operationQueue addOperation:operation];*/

    
    
//    [HRequestUtils uploadImageToResourceURL:uploadUrl images:@[image] compressQulity:1 params:nil finished:^(id content, NSInteger status, BOOL success) {
//        if (success) {
//            if (status == 200) {
//                
//            }
//        }
//    }];
    
    
    //testImageupload
//    [HRequestUtils asyncPostRequestByAPIURL:FileCreateURL withParams:@{@"fileName":@"juanfelix.jpg",@"targetDir":@"000911119"} requestType:HAPIRequestTypePost finished:^(id content, NSInteger status, BOOL success) {
//        if (success) {
//            if (status == 200) {
//                NSLog(@"%@",content);
//                id object = content[@"data"];
//                if (object && [object isKindOfClass:[NSDictionary class]]) {
//                    NSString * uploadURL = object[@"uploadUrl"];
//                    NSString * uploadedSizeURL = object[@"getFileSizeUrl"];
//                    
//                    /*
//                    UIImage * image = [UIImage imageNamed:@"IMG_3522.jpg"];
//                    [HRequestUtils uploadImageToResourceURL:uploadURL images:@[image] compressQulity:1 params:nil finished:^(id content, NSInteger status, BOOL success) {
//                        if (success) {
//                            if (status == 200) {
//                                NSLog(@"uploaded...");
//                            }
//                        }
//                    }];
//                     */
//                    
////                    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:uploadURL]];
////                    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
////                    operation.inputStream = [NSInputStream inputStreamWithFileAtPath:[[NSBundle mainBundle] pathForResource:@"IMG_3522" ofType:@"jpg"]];
////                    operation.outputStream = [NSOutputStream outputStreamToMemory];
////                    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
////                        NSLog(@"responseObject:%@",responseObject);
////                    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
////                        NSLog(@"Error: %@", error);
////                    }];
////                    [operation start];
//                    
//                }else{
//                    NSLog(@"未知错误！");
//                }
//            }else{
//                NSLog(@"%@",content[@"errorMsg"]);
//            }
//        }else{
//            NSLog(@"%@",content);
//        }
//    }];
    
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

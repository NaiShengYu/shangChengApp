//
//  AFNetRequest.m
//  ShangChengApp
//
//  Created by 俞乃胜 on 16/11/30.
//  Copyright © 2016年 俞乃胜. All rights reserved.
//

#import "AFNetRequest.h"

@implementation AFNetRequest
// post 请求
+ (void)HttpPostCallBack:(NSString*)Url  Parameters:(NSDictionary*)dict success:(httpSuccess)success failure:(httpFailure)failure
{
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status ==AFNetworkReachabilityStatusNotReachable) {
            [SVProgressHUD showErrorWithStatus:@"网络无连接!"];
            DLog(@"网络连接不上");
        }else{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.responseSerializer = [AFJSONResponseSerializer new];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
            
            [manager POST:Url parameters:dict progress:^(NSProgress * _Nonnull uploadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success (responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                failure (error);
                
            }];

        }
       }];

    
    
}

// get  请求
+ (void)HttpGetCallBack:(NSString*)Url  Parameters:(NSDictionary*)dict success:(httpSuccess)success failure:(httpFailure)failure
{
    
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status ==AFNetworkReachabilityStatusNotReachable) {
            [SVProgressHUD showErrorWithStatus:@"网络buneng连接!"];
            NSLog(@"网络不能连接");
        }else{
            AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
            manager.responseSerializer = [AFJSONResponseSerializer new];
            manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
            [manager GET:Url parameters:dict progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                success(responseObject);
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                
                failure(error);
            }];
         }
    }];
}

@end

//
//  AFNetRequest.h
//  ShangChengApp
//
//  Created by 俞乃胜 on 16/11/30.
//  Copyright © 2016年 俞乃胜. All rights reserved.
//

#import <Foundation/Foundation.h>
//成功的回调
typedef void (^httpSuccess)(id responseObject);
//失败的回调
typedef void (^httpFailure)(NSError *error);

@interface AFNetRequest : NSObject
// post 请求
+ (void)HttpPostCallBack:(NSString*)Url  Parameters:(NSDictionary*)dict success:(httpSuccess)success failure:(httpFailure)failure;

// get  请求
+ (void)HttpGetCallBack:(NSString*)Url  Parameters:(NSDictionary*)dict success:(httpSuccess)success failure:(httpFailure)failure;
@end

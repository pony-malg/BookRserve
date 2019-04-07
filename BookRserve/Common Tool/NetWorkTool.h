//
//  NetWorkTool.h
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkTool : NSObject
//登录
+ (void)getLoginWithUsername:(NSString *)username userPwd:(NSString *)pwd completionBlock:(void(^)(NSDictionary *dic))block;
//注册
+ (void)getRegisterWithUsername:(NSString *)username userPwd:(NSString *)pwd completionBlock:(void(^)(NSDictionary *dic))block;
//post请求（暂无）
+ (void)postRequestWithUsername:(NSString *)username userPwd:(NSString *)pwd completionBlock:(void(^)(NSDictionary *dic))block;
//读书会
+ (void)getPartyWithToken:(NSString *)token completionBlock:(void(^)(NSDictionary *dic))block;
//所有书单
+ (void)getBookListWithToken:(NSString *)token completionBlock:(void(^)(NSDictionary *dic))block;
//发布二手书
+ (void)releaseBookWithArray:(NSMutableArray *)arr completionBlock:(void(^)(NSDictionary *dic))block;
//参与读书会
+ (void)takePartInWithToken:(NSString *)token UUID:(NSString *)Uid completionBlock:(void(^)(NSDictionary *dic))block;
//拍书
+ (void)buyBookWithToken:(NSString *)token UUID:(NSString *)Uid completionBlock:(void(^)(NSDictionary *dic))block;
@end

NS_ASSUME_NONNULL_END

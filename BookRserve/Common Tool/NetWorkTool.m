//
//  NetWorkTool.m
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import "NetWorkTool.h"
#import <AFNetworking.h>

@implementation NetWorkTool

+ (void)getLoginWithUsername:(NSString *)username userPwd:(NSString *)pwd completionBlock:(void(^)(NSDictionary *dic))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *URL = [NSString stringWithFormat:@"http://39.96.58.35:8000/login.php?name=%@&password=%@",username,pwd];
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block((NSDictionary *)responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fail");
    }];
}
+ (void)getRegisterWithUsername:(NSString *)username userPwd:(NSString *)pwd completionBlock:(void(^)(NSDictionary *dic))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSString *URL = [NSString stringWithFormat:@"http://39.96.58.35:8000/register.php?name=%@&password=%@",username,pwd];
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block((NSDictionary *)responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"fail");
    }];
}
+ (void)postRequestWithUsername:(NSString *)username userPwd:(NSString *)pwd completionBlock:(void(^)(NSDictionary *dic))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    NSDictionary *paremeters = @{@"username":username,
                                 @"password":pwd
                                 };
    NSString *urlString = @"www.baidu.com";
    [manager POST:urlString parameters:paremeters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failed");
    }];
}
//读书会
+ (void)getPartyWithToken:(NSString *)token completionBlock:(void(^)(NSDictionary *dic))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    NSString *URL = [NSString stringWithFormat:@"http://39.96.58.35:8000/getParty.php?token=%@",token];
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block((NSDictionary *)responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
//所有书单
+ (void)getBookListWithToken:(NSString *)token completionBlock:(void(^)(NSDictionary *dic))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    NSString *URL = [NSString stringWithFormat:@"http://39.96.58.35:8000/getBooks.php?token=%@",token];
    [manager GET:URL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block((NSDictionary *)responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
//发布二手书
+ (void)releaseBookWithArray:(NSMutableArray *)arr completionBlock:(void(^)(NSDictionary *dic))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    NSDictionary *parameter = @{@"title":[arr objectAtIndex:0],
                                @"author":[arr objectAtIndex:1],
                                @"publishingHouse":[arr objectAtIndex:2],
                                @"address":[arr objectAtIndex:6],
                                @"depreciationRate":[arr objectAtIndex:3],
                                @"name":[arr objectAtIndex:4],
                                @"phone":[arr objectAtIndex:5],
                                @"time":[arr objectAtIndex:7]};
    NSString *URL = @"http://39.96.58.35:8000/updateBook.php?token=169b250e9dcb3781";
    [manager GET:URL parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block((NSDictionary *)responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
//参与读书会
+ (void)takePartInWithToken:(NSString *)token UUID:(NSString *)Uid completionBlock:(void(^)(NSDictionary *dic))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    NSDictionary *parameter = @{@"token":token,
                                @"UUID":Uid};
    NSString *URL = @"http://39.96.58.35:8000/joinParty.php";
    [manager GET:URL parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block((NSDictionary *)responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
//拍书
+ (void)buyBookWithToken:(NSString *)token UUID:(NSString *)Uid completionBlock:(void(^)(NSDictionary *dic))block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", nil];
    NSDictionary *parameter = @{@"token":token,
                                @"UUID":Uid};
    NSString *URL = @"http://39.96.58.35:8000/buyBook.php";
    [manager GET:URL parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (block) {
            block((NSDictionary *)responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}
@end

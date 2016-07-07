//
//  NextManger.m
//  ITCradle
//
//  Created by admin on 16/7/7.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import "NetManger.h"
#import "AFNetworking.h"
static NetManger *manger = nil;
@implementation NetManger
// 单例
+ (instancetype)shareInstance{
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        if (!manger) {
            manger = [[[self class] alloc] init];
            
        }
    });
    return manger;
}
- (instancetype)initWith:(RequestState)requet
{
    self = [super init];
    if (self) {
        [self loadData:requet];
    }
    return self;
}
- (void)loadData:(RequestState)requet
{
    switch (requet) {
        case RequestOfLogin:
        {
            [self login];
        }
            break;
            
        default:
            break;
    }
}
- (void)login
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSDictionary *parameters = @{
                                 @"_appid" : @"101",
                                 @"UserName": @"admin",
                                 @"Password": @"123456"
                                 };
    NSString *url = [NSString stringWithFormat:@"%@systemset/user/login",ServerAddressURL];
    [manager POST:url parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
     {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error)
    {
        NSLog(@"error %@",error);  
    }];
}
@end

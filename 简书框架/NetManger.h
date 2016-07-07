//
//  NextManger.h
//  ITCradle
//
//  Created by admin on 16/7/7.
//  Copyright © 2016年 JCK. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef enum
{
    RequestOfGetarticlelist = 0,    // 获取内容列表
    RequestOfLogin
}RequestState;
@interface NetManger : NSObject
#pragma mark - 注册
@property (nonatomic, copy)NSString *userName;
@property (nonatomic, copy)NSString *userPWD;
+ (instancetype)shareInstance;
- (void)loadData:(RequestState)requet;
@end

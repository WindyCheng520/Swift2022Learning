//  
//  MSLocationManager.h
//  MSBusiness
//   
//  Created by 李 燕强 on 2020/7/13
//  Copyright © 2020 Midea. All rights reserved.
//   
   

#import <Foundation/Foundation.h>


@interface MSLocationManager : NSObject

@property (nonatomic, copy) dispatch_block_t inputsBlock;  //输入


+ (instancetype)shareManager;

- (BOOL)locationOpen;

- (void)showLocationAuthorAlertWithMessage:(NSString *)message;

//为获取手机当前连接wifi而进行的定位检查
- (BOOL)checkLocationForCurrentWiFi;

@end

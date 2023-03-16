//  
//  MSBLEManager.h
//  MSDevice
//   
//  Created by 李 燕强 on 2020/7/11
//  Copyright © 2020 Midea. All rights reserved.
//   
   

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, MSBLEManagerType) {
    MSBLEManagerTypeAuthorizedAndTurnOn,    //蓝牙已授权已打开
    MSBLEManagerTypeAuthorized,             //蓝牙已授权但开关未打开
    MSBLEManagerTypeUnauthorized,            //蓝牙未授权
    MSBLEManagerTypeUnauthorized130,         //蓝牙13.0未授权
    MSBLEManagerTypeUnauthorized131,         //蓝牙13.1 以上未授权
};


@interface MSBLEManager : NSObject

+ (instancetype)shareManager;

//检查蓝牙权限状态
- (MSBLEManagerType)checkBluetoothAuthState;
//检查蓝牙权限、并弹出相应提示框
- (void)showBluetoothAuthorAlert;
//打开蓝牙的提示弹框，全屏、新
- (void)showTurnOnBluetoothAlertControllerNew;
//关闭蓝牙的提示弹框，全屏、新
- (void)hiddenTurnOnBluetoothAlertControllerNew;

@end

//  
//  MSLocationManager.m
//  MSBusiness
//   
//  Created by 李 燕强 on 2020/7/13
//  Copyright © 2020 Midea. All rights reserved.
//   
   

#import "MSLocationManager.h"
#import <CoreLocation/CoreLocation.h>
#import <OEMFoundation/HGUIKit.h>
#import "MSBusinessBundle.h"
#import <MSBusiness/MSSystemPermissionManager.h>
#import <MSBusiness/MSNotificationConst.h>
#import <OEMTheme/OEMHGAlertController.h>
#import "OEMLocationAlertViewController.h"
#import <OEMFoundation/OEMCustomize.h>
#import "MSAppInfo.h"

@interface MSLocationManager ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *locationM;

@end

@implementation MSLocationManager

+ (instancetype)shareManager {
    static MSLocationManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MSLocationManager alloc] init];
        [manager locationM];
    });
    return manager;
}

//为获取手机当前连接wifi而进行的定位检查
- (BOOL)checkLocationForCurrentWiFi {
    //iOS13以下不需要定位即可获取当前wifi
    NSString * tip = [NSString stringWithFormat:MSResourceString(@"authorization_location_precise_request_tip"),
                      [MSAppInfo appName]];
    NSString * tip2 = [NSString stringWithFormat:MSResourceString(@"authorization_location_precise_request_tip2"),
                       [MSAppInfo appName]];
    NSString * tip3 = [NSString stringWithFormat:MSResourceString(@"authorization_location_precise_request_tip3"),
                       [MSAppInfo appName]];
    if (@available(iOS 13.0, *)) {
        if (@available(iOS 14.0, *)) {
            if ([self locationOpen]) {
                //判断是否打开精确位置
                if (self.locationM.accuracyAuthorization == CLAccuracyAuthorizationFullAccuracy) {
                    return YES;
                } else {
                    //提示打开精确位置 14.0
                    [self showLocationAuthorAlertWithMessage:tip2];
                    return NO;
                }
                
            } else {
            
                if (self.locationM.authorizationStatus == kCLAuthorizationStatusNotDetermined) {
                    [self.locationM requestWhenInUseAuthorization];
                } else {
                    //判断隐私--定位服务是否打开
                    if ([CLLocationManager locationServicesEnabled]) {
                        //提示打开位置权限 14.0
                        [self showLocationAuthorAlertWithMessage:tip];
                    } else {
                        //提示打开位置权限 14.0  (可优化为提示用户打开隐私--定位服务)
                        [self showLocationAuthorAlertWithMessage:tip];
                    }
                }
                return NO;
            }
                        
        } else {
            
            if ([self locationOpen]) {
                return YES;
            } else {
                if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
                    [self.locationM requestWhenInUseAuthorization];
                } else {
                    //判断隐私--定位服务是否打开
                    if ([CLLocationManager locationServicesEnabled]) {
                        //提示打开位置权限 13.0
                        [self showLocationAuthorAlertWithMessage:tip3];
                    } else {
                        //提示打开位置权限 13.0  (可优化为提示用户打开隐私--定位服务)
                        [self showLocationAuthorAlertWithMessage:tip3];
                    }
                }
                
                return NO;
            }
        }
        
    } else {
        return YES;
    }
    
}

//判断定位权限是否打开
- (BOOL)locationOpen {
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedAlways || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorizedWhenInUse) {
        return YES;
    } else {
        return NO;
    }
}

- (void)showLocationAuthorAlertWithMessage:(NSString *)message {
    OEMLocationAlertViewController *alertViewController =  [OEMLocationAlertViewController alertControllerWithMessage:message];
    UIViewController *vc = [OEMRouterHandler getCurrentViewController];
    alertViewController.setBlock = ^{
        //跳转到app的系统设置页面
        [[MSSystemPermissionManager shareManager] jumpToSystemAppSettingPage];
    };
    WEAKSELF
    alertViewController.inputBlock = ^{
        if (weakSelf.inputsBlock) {
            weakSelf.inputsBlock();
        }
    };
    [vc presentViewController:alertViewController animated:NO completion:nil];
    

//    HGAlertAction* cancelAction = [HGAlertAction actionWithTitle:MSResourceString(@"authorization_alert_cancel") style:HGAlertActionStyleCancel action:nil];
//    HGAlertAction* settingAction = [HGAlertAction actionWithTitle:MSResourceString(@"authorization_to_setting") action:^{
//        //跳转到app的系统设置页面
//        [[MSSystemPermissionManager shareManager] jumpToSystemAppSettingPage];
//    }];
//    HGAlertController* alertController = [OEMHGAlertController alertControllerWithTitle:MSResourceString(@"authorization_location_unavaible_title") message:message actions:@[cancelAction, settingAction]];
//    [alertController show];
    
}

#pragma mark - CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    [[NSNotificationCenter defaultCenter] postNotificationName:kMideaLocationAuthorizationStatusDidChangeNotification object:nil userInfo:@{@"status" : @(status)}];
    
    switch (status) {
        case kCLAuthorizationStatusNotDetermined: {
            DDLogBusinessInfo(@"用户还未决定授权");
        }
            break;

        case kCLAuthorizationStatusRestricted: {
            DDLogBusinessInfo(@"访问受限，根据api说明一般不会返回该值");
        }
            break;
            
        case kCLAuthorizationStatusDenied: {
            // 如果隐私-定位服务没打开，权限状态也是这个
            if ([CLLocationManager locationServicesEnabled]) {
                DDLogBusinessInfo(@"定位服务开启，被拒绝");
            } else {
                DDLogBusinessInfo(@"定位服务关闭，不可用");
            }
        }
            break;

        case kCLAuthorizationStatusAuthorizedAlways: {
            DDLogBusinessInfo(@"获得前后台授权");
        }
            break;
            
        case kCLAuthorizationStatusAuthorizedWhenInUse: {
            DDLogBusinessInfo(@"获得前台授权");
        }
            break;

        default:
            break;
    }
    
}

#pragma mark - 懒加载
- (CLLocationManager *)locationM {
    if (!_locationM) {
        // 创建位置管理器
        _locationM = [[CLLocationManager alloc] init];
        [_locationM requestWhenInUseAuthorization];
        // 设置代理
        _locationM.delegate = self;
    }
    return _locationM;
}


@end

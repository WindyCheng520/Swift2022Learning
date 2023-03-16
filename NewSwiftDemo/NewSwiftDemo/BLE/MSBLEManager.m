//  
//  MSBLEManager.m
//  MSDevice
//   
//  Created by 李 燕强 on 2020/7/11
//  Copyright © 2020 Midea. All rights reserved.
//   
   

#import "MSBLEManager.h"
#import <CoreBluetooth/CoreBluetooth.h>
#import "MSBusinessBundle.h"
#import "MSAppInfo.h"
#import <MSBusiness/MSSystemPermissionManager.h>
#import <MSBusiness/MSNotificationConst.h>
#import <MSBLEOpenAlertView.h>
#import <OEMTheme/OEMHGAlertController.h>
#import "OEMCommomAlertViewController.h"
#import <OEMFoundation/OEMCustomize.h>
#import "MSAppInfo.h"

@interface MSBLEManager () <CBCentralManagerDelegate>

@property (strong, nonatomic) CBCentralManager *centerManager;
@property (nonatomic, strong) MSBLEOpenAlertView *openAlertView;

@end

@implementation MSBLEManager

+ (instancetype)shareManager {
    static MSBLEManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[MSBLEManager alloc] init];
        [manager centerManager];
    });
    return manager;
}



//根据不同状态，弹对应的弹框
- (void)showBluetoothAuthorAlert {
    if (@available(iOS 13.1, *)) {
        CBManagerAuthorization auth = CBManager.authorization;
        if(auth != CBManagerAuthorizationAllowedAlways) {
            if (auth != CBManagerAuthorizationNotDetermined) {
                [self showAuthorizeBluetoothAlertController];
                return;
            }
        }
    }
    
    if (@available(iOS 13.0, *)) {
        CBManagerAuthorization auth = self.centerManager.authorization;
        if(auth != CBManagerAuthorizationAllowedAlways) {
            if (auth != CBManagerAuthorizationNotDetermined) {
                [self showAuthorizeBluetoothAlertController];
                return;
            }
        }
    }

    if (self.centerManager.state == CBCentralManagerStateUnauthorized) {
        [self showAuthorizeBluetoothAlertController];
    } else if (self.centerManager.state == CBCentralManagerStatePoweredOff) {
        [self showTurnOnBluetoothAlertControllerNew];
    }
}

//查询当前蓝牙状态
- (MSBLEManagerType)checkBluetoothAuthState {
    //todo:蓝牙开启状态和授权状态耦合了，此处授权状态优先级高于蓝牙开启状态，后续需要优化！
    if (@available(iOS 13.1, *)) {
        CBManagerAuthorization auth = CBManager.authorization;
        if(auth == CBManagerAuthorizationRestricted || auth == CBManagerAuthorizationDenied) {
            return  MSBLEManagerTypeUnauthorized131;   //   MSBLEManagerTypeUnauthorized;
        }
    }
    
    if (@available(iOS 13.0, *)) {
        CBManagerAuthorization auth = self.centerManager.authorization;
        if(auth == CBManagerAuthorizationRestricted || auth == CBManagerAuthorizationDenied) {
            return  MSBLEManagerTypeUnauthorized130;     //  return MSBLEManagerTypeUnauthorized;
        }
    }

    if (self.centerManager.state == CBCentralManagerStateUnauthorized) {
        return MSBLEManagerTypeUnauthorized;
    } else if (self.centerManager.state == CBCentralManagerStatePoweredOn) {
        return MSBLEManagerTypeAuthorizedAndTurnOn;
    } else if (self.centerManager.state == CBCentralManagerStatePoweredOff) {
        return MSBLEManagerTypeAuthorized;
    } else {
        return MSBLEManagerTypeUnauthorized;
    }
    
}

//未授权蓝牙权限提示弹框
- (void)showAuthorizeBluetoothAlertController {
//    HGAlertAction* cancelAction = [HGAlertAction actionWithTitle:MSResourceString(@"authorization_alert_cancel") style:HGAlertActionStyleCancel action:nil];
//    HGAlertAction* settingAction = [HGAlertAction actionWithTitle:MSResourceString(@"authorization_to_setting") action:^{
//        //跳转到app的系统设置页面
//        [[MSSystemPermissionManager shareManager] jumpToSystemAppSettingPage];
//    }];
//    HGAlertController* alertController = [OEMHGAlertController alertControllerWithTitle:MSResourceString(@"authorization_ble_request_title") message:MSResourceString(@"authorization_ble_request_message") actions:@[cancelAction, settingAction]];
//    [alertController show];
    
    NSString * contentDes = [NSString stringWithFormat:MSResourceString(@"authorization_ble_request_message"), [MSAppInfo appName]];
    NSArray *buttons = @[MSResourceString(@"authorization_alert_cancel"), MSResourceString(@"authorization_to_setting")];
    OEMCommomAlertViewController *alertViewController = [OEMCommomAlertViewController alertControllerWithTitle:MSResourceString(@"authorization_ble_request_title")
                                                                                                       content:contentDes
                                                                                                       buttons:buttons
                                                                                                 isMiddleTheme:NO];
    UIViewController *vc = [OEMRouterHandler getCurrentViewController];
    alertViewController.rightBlock = ^{
        //跳转到app的系统设置页面
        [[MSSystemPermissionManager shareManager] jumpToSystemAppSettingPage];
    };
    [vc presentViewController:alertViewController animated:NO completion:nil];
}

//打开蓝牙的提示弹框（废弃不用）
- (void)showTurnOnBluetoothAlertController {
    HGAlertAction* cancelAction = [HGAlertAction actionWithTitle:MSResourceString(@"authorization_alert_cancel") style:HGAlertActionStyleCancel action:nil];
    cancelAction.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
    HGAlertAction* settingAction = [HGAlertAction actionWithTitle:MSResourceString(@"permission_bluetooth_turnon") action:^{
        //跳转到app的系统设置页面
        [[MSSystemPermissionManager shareManager] jumpToSystemAppSettingPage];
    }];
    NSString * title = [NSString stringWithFormat:MSResourceString(@"authorization_ble_request_tip"), [MSAppInfo appName]];
    HGAlertController* alertController = [OEMHGAlertController alertControllerWithTitle:title message:@"" actions:@[cancelAction, settingAction]];
    [alertController show];
}

//打开蓝牙的提示弹框，全屏、新
- (void)showTurnOnBluetoothAlertControllerNew {
    [self.openAlertView showWithSuperview:[OEMRouterHandler getCurrentViewController].view.window];
}

//关闭蓝牙的提示弹框，全屏、新
- (void)hiddenTurnOnBluetoothAlertControllerNew {
    [self.openAlertView dismiss];
}

#pragma mark - CBCentralManagerDelegate
- (void)centralManagerDidUpdateState:(CBCentralManager *)central {
    [[NSNotificationCenter defaultCenter] postNotificationName:kMideaBluetoothAuthorizationStatusDidChangeNotification object:nil userInfo:nil];
    DDLogBusinessInfo(@"蓝牙状态发生改变: %ld", central.state);
}

#pragma mark - 懒加载
- (CBCentralManager *)centerManager {
    if (!_centerManager) {
        _centerManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil options:@{CBCentralManagerOptionShowPowerAlertKey:[NSNumber numberWithBool:NO]}];
    }
    return _centerManager;
}

- (MSBLEOpenAlertView *)openAlertView {
    if (!_openAlertView) {
        _openAlertView = [MSBLEOpenAlertView new];
    }
    return _openAlertView;
}

@end

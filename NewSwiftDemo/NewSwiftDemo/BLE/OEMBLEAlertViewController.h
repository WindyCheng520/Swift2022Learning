//
//  OEMBLEAlertViewController.h
//  MSBusiness
//
//  Created by WindyCheng on 2022/3/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OEMBLEAlertViewController : UIViewController

@property (nonatomic, copy) dispatch_block_t setBlock;    //去设置(授权）

@property (nonatomic, copy) dispatch_block_t openBlock;   //开启

@property (nonatomic, copy) dispatch_block_t switchBlock;  //切换

@property (nonatomic, assign)BOOL hasNoTryButton;      //是否没有尝试按钮

@property (nonatomic, assign)BOOL isAuthorized;  //已授权
@property (nonatomic, assign)BOOL isOpen;        //已开启
@property (nonatomic, assign)BOOL isSwitchBLE;      //是否切换蓝牙



-(void)refreshUI;


@end

NS_ASSUME_NONNULL_END

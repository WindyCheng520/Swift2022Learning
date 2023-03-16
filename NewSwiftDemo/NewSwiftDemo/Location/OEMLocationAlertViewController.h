//
//  OEMLocationAlertViewController.h
//  MSDevice
//
//  Created by WindyCheng on 2022/3/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OEMLocationAlertViewController : UIViewController

@property (nonatomic, copy) dispatch_block_t inputBlock;  //输入
@property (nonatomic, copy) dispatch_block_t setBlock;    //设置

+(instancetype )alertControllerWithMessage:(NSString *)message;


@end

NS_ASSUME_NONNULL_END

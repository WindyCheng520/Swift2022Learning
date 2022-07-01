//
//  ListItem.h
//  NewSwiftDemo
//
//  Created by Windy on 2022/6/13.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ListItem : NSObject

@property(strong) UIImage* icon;
@property(strong) NSString* title;
@property(strong) NSURL* url;

@end

NS_ASSUME_NONNULL_END

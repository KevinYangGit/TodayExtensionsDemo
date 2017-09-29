//
//  BFEThreeDTouchManager.h
//  boxfish-english
//
//  Created by YangQi on 2017/8/2.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BFEThreeDTouchManager : NSObject

// 手动创建应用图标上的3D touch快捷选项
+ (void)creatShortcutItem:(UIApplication *)application;

+ (void)performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem;

+ (void)setUpShortcutItem:(UIApplication *)application launchOptions:(NSDictionary *)launchOptions;

+ (void)performAtionForTodayExtension;

@end

//
//  BFEThreeDTouchManager.m
//  boxfish-english
//
//  Created by YangQi on 2017/8/2.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#import "BFEThreeDTouchManager.h"
#import "NotificationNames.h"

@implementation BFEThreeDTouchManager

+ (void)performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem {
    
    if (shortcutItem) {
        NSString *boundId = [[NSBundle mainBundle] bundleIdentifier];
        NSString *type_1 = [NSString stringWithFormat:@"%@_%@", boundId, ThreeDTouchIndependentStudy];
        NSString *type_2 = [NSString stringWithFormat:@"%@_%@", boundId, ThreeDTouchIndividualityClassRoom];
        NSString *type_3 = [NSString stringWithFormat:@"%@_%@", boundId, ThreeDTouchForeignAuditorium];
        NSString *type_4 = [NSString stringWithFormat:@"%@_%@", boundId, ThreeDTouchOralTest];
        
        NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.demo.yang"];

        if([shortcutItem.type isEqualToString:type_1]){
            [defaults setObject:@"自主学习" forKey:@"title"]; //自主学习
        } else if ([shortcutItem.type isEqualToString:type_2]) {
            [defaults setObject:@"个性课堂" forKey:@"title"]; //个性课堂
        } else if ([shortcutItem.type isEqualToString:type_3]) {
            [defaults setObject:@"外教大讲堂" forKey:@"title"]; //外教大讲堂
        } else if ([shortcutItem.type isEqualToString:type_4]) {
            [defaults setObject:@"口语考试" forKey:@"title"]; //口语考试
        }
        
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:AppExtensionWidgetOpenHostAppNotification object:nil];
    }
}

+ (void)setUpShortcutItem:(UIApplication *)application launchOptions:(NSDictionary *)launchOptions {
    UIApplicationShortcutItem *shortcutItem = [launchOptions valueForKey:UIApplicationLaunchOptionsShortcutItemKey];
    if (shortcutItem) {
        [BFEThreeDTouchManager performActionForShortcutItem:shortcutItem];
    } else {
        [BFEThreeDTouchManager creatShortcutItem:application];
    }
}

// 手动创建应用图标上的3D touch快捷选项
+ (void)creatShortcutItem:(UIApplication *)application {
    //创建系统风格的icon
    
    /**
     
     type 该item 唯一标识符
     
     localizedTitle ：标题
     
     localizedSubtitle：副标题
     
     icon：icon图标 可以使用系统类型 也可以使用自定义的图片
     
     userInfo：用户信息字典 自定义参数，完成具体功能需求
     
     */
    
    //这是使用自定义的图片，坑就在这里了，图片只能黑白的颜色，就算弄了彩色的上去，显示的也是黑白色
    //UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"图片名字.png"];
    
    
    //这是使用系统图片
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeBookmark];
    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeCaptureVideo];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeFavorite];
    UIApplicationShortcutIcon *icon4 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAudio];
    
    NSString *boundId = [[NSBundle mainBundle] bundleIdentifier];
    NSString *type_1 = [NSString stringWithFormat:@"%@_%@", boundId, ThreeDTouchIndependentStudy];
    NSString *type_2 = [NSString stringWithFormat:@"%@_%@", boundId, ThreeDTouchIndividualityClassRoom];
    NSString *type_3 = [NSString stringWithFormat:@"%@_%@", boundId, ThreeDTouchForeignAuditorium];
    NSString *type_4 = [NSString stringWithFormat:@"%@_%@", boundId, ThreeDTouchOralTest];
    
    
    UIApplicationShortcutItem *collectionItem = [[UIApplicationShortcutItem alloc] initWithType:type_1
                                                                                 localizedTitle:@"自主学习"
                                                                              localizedSubtitle:nil
                                                                                           icon:icon1
                                                                                       userInfo:nil];
    
    UIApplicationShortcutItem *withdrawalItem = [[UIApplicationShortcutItem alloc] initWithType:type_2
                                                                                 localizedTitle:@"个性课堂"
                                                                              localizedSubtitle:nil
                                                                                           icon:icon2
                                                                                       userInfo:nil];
    
    UIApplicationShortcutItem *scanningItem = [[UIApplicationShortcutItem alloc] initWithType:type_3
                                                                               localizedTitle:@"外教大讲堂"
                                                                            localizedSubtitle:nil
                                                                                         icon:icon3
                                                                                     userInfo:nil];
    
    UIApplicationShortcutItem *customerlItem = [[UIApplicationShortcutItem alloc] initWithType:type_4
                                                                                localizedTitle:@"口语考试"
                                                                             localizedSubtitle:nil
                                                                                          icon:icon4
                                                                                      userInfo:nil];
    /** 将items 添加到app图标 */
    application.shortcutItems = @[collectionItem,withdrawalItem,scanningItem,customerlItem];
    
}

+ (void)performAtionForTodayExtension {
    NSUserDefaults *defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.demo.yang"];
    NSString *title = [defaults objectForKey:@"title"];
    [[NSNotificationCenter defaultCenter] postNotificationName:AppExtensionWidgetOpenHostAppNotification object:title];
}

@end

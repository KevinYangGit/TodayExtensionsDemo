//
//  WidgetViewForiOSTEN.h
//  AppExtensionsDemo
//
//  Created by YangQi on 2017/8/9.
//  Copyright © 2017年 YangQI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WidgetViewForiOSTEN : UIView

- (instancetype)initWithFrame:(CGRect)frame
                 UserDefaults:(NSUserDefaults *)defaults
                      compact:(BOOL)compact
            completionHandler:(void (^)(void))completionHandler;

@property (nonatomic, copy) NSString *selfWidth;

@end

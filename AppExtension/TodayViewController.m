//
//  TodayViewController.m
//  AppExtension
//
//  Created by YangQi on 2017/8/5.
//  Copyright © 2017年 YangQI. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "BFEExtensionsCustomButton.h"
#import "WidgetViewForiOSTEN.h"
#import "NotificationNames.h"

@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic, strong) NSUserDefaults *defaults;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSubViews];
    [self layoutSubViews];
    [self setUpEvents];
}

- (void)setUpSubViews {
    
    CGFloat selfWidth = self.view.frame.size.width;
    
    self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 200);
    
    CGFloat width = 359 - 20;
    
    BOOL compact = NO;
    
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    if (systemVersion.doubleValue >= 10.0) {
        compact = self.extensionContext.widgetLargestAvailableDisplayMode == NCWidgetDisplayModeCompact;
        width = 359 - 20;
    } else {
        compact = NO;
        width = 460;
    }
    
    __weak typeof(self) weakSelf = self;
    WidgetViewForiOSTEN *widegetView =
    [[WidgetViewForiOSTEN alloc] initWithFrame:CGRectMake(0, 0, width, 250)
                                  UserDefaults:self.defaults
                                       compact:compact
                             completionHandler:^{
                                 [weakSelf clicked];
                             }];
    widegetView.selfWidth = [NSString stringWithFormat:@"%f", self.preferredContentSize.width];
    [self.view addSubview:widegetView];
}

- (void)layoutSubViews {
}

- (void)setUpEvents {
}

- (void)clicked {
    NSURL *url = [NSURL URLWithString:@"AppExtensionsDemo://"];
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
    }];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    completionHandler(NCUpdateResultNewData);
}

- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    } else {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 250);
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:AppExtensionWidgetActiveDisplayModeDidChangeNotification object:@(activeDisplayMode)];
}

#pragma mark ==================== lazy ====================
- (NSUserDefaults *)defaults {
    if (!_defaults) {
        _defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.demo.yang"];
    }
    return _defaults;
}

@end

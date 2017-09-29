//
//  ViewController.m
//  AppExtensionsDemo
//
//  Created by YangQi on 2017/8/5.
//  Copyright © 2017年 YangQI. All rights reserved.
//

#import "ViewController.h"
#import "NotificationNames.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *timesLabel;
@property (nonatomic, assign) NSInteger times;
@property (nonatomic, strong) NSUserDefaults *defaults;

@end

@implementation ViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(todayExtensionOpenHostApp:)
                                                 name:AppExtensionWidgetOpenHostAppNotification
                                               object:nil];
    
    self.timesLabel.text = [_defaults objectForKey:@"title"];
}

- (void)todayExtensionOpenHostApp:(NSNotification *)info {
    self.timesLabel.text = [self.defaults objectForKey:@"title"];
}

#pragma mark ==================== lazy ====================
- (NSUserDefaults *)defaults {
    if (!_defaults) {
        _defaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.com.demo.yang"];
    }
    return _defaults;
}


@end

//
//  WidgetViewForiOSTEN.m
//  AppExtensionsDemo
//
//  Created by YangQi on 2017/8/9.
//  Copyright © 2017年 YangQI. All rights reserved.
//

#import "WidgetViewForiOSTEN.h"
#import "BFEExtensionsCustomButton.h"
#import "UIView+Additions.h"
#import "TodayViewController.h"
#import "NotificationNames.h"

@interface WidgetViewForiOSTEN()

@property (nonatomic, strong) UILabel *guideLabel;

@property (nonatomic, weak) NSUserDefaults *defaults;
@property (nonatomic, assign, getter=isCompact) BOOL compact;

@property (nonatomic, strong) UIView *backView;
@property (nonatomic, strong) UIView *backVagueView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) BFEExtensionsCustomButton *independentStudyButton;
@property (nonatomic, strong) BFEExtensionsCustomButton *foreignPublicButton;
@property (nonatomic, strong) BFEExtensionsCustomButton *individualityButton;
@property (nonatomic, strong) BFEExtensionsCustomButton *oralTestButton;

@property (nonatomic, copy) void (^completionHandler)(void);

@end


@implementation WidgetViewForiOSTEN

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithFrame:(CGRect)frame
                 UserDefaults:(NSUserDefaults *)defaults
                      compact:(BOOL)compact
            completionHandler:(void (^)(void))completionHandler
{
    self = [super initWithFrame:frame];
    if (self) {
        _defaults = defaults;
        _compact = compact;
        self.completionHandler = completionHandler;
        
        [self setUpSubViews];
        [self layoutSubViews];
        [self setUpEvents];
    }
    return self;
}

- (void)setUpSubViews {
    
    _guideLabel = [[UILabel alloc] init];
    _guideLabel.adjustsFontSizeToFitWidth = YES;
    _guideLabel.font = [UIFont fontWithName:@"" size:18];
    _guideLabel.text = @"带你去往那个被憧憬的未来";
    [self addSubview:_guideLabel];
    
    _backView = [[UIView alloc] init];
    _backView.backgroundColor = [UIColor clearColor];
    [self addSubview:_backView];
    
    _backVagueView = [[UIView alloc] init];
    _backVagueView.alpha = 0.6;
    _backVagueView.backgroundColor = [UIColor whiteColor];
    [_backView addSubview:_backVagueView];
    
    _imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"dialog.jpg"]];
    [_imageView setContentMode:UIViewContentModeScaleAspectFill];
    _imageView.clipsToBounds = YES;
    _imageView.userInteractionEnabled = YES;
    [_backView addSubview:_imageView];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.adjustsFontSizeToFitWidth = YES;
    _titleLabel.font = [UIFont systemFontOfSize:16];
    _titleLabel.text = @"有生之年你会见到外星人吗？";
    _titleLabel.userInteractionEnabled = YES;
    [_backView addSubview:_titleLabel];
    
    _detailLabel = [[UILabel alloc] init];
    _detailLabel.adjustsFontSizeToFitWidth = YES;
    _detailLabel.textColor = [UIColor grayColor];
    _detailLabel.font = [UIFont systemFontOfSize:12];
    _detailLabel.text = @"FUNCTION";
    _detailLabel.userInteractionEnabled = YES;
    [_backView addSubview:_detailLabel];
    
    _lineView = [[UIView alloc] init];
    _lineView.backgroundColor = [UIColor lightGrayColor];
    _lineView.alpha = 0.4;
    [self addSubview:_lineView];
    
    _independentStudyButton = [[BFEExtensionsCustomButton alloc] initWithFrame:CGRectMake(0, 0, 40, 60)];
    [_independentStudyButton setTitle:@"自主学习" forState:0];
    [_independentStudyButton setTitleColor:[UIColor blackColor] forState:0];
    [_independentStudyButton setImage:[UIImage imageNamed:@"icon_assignment"] forState:0];
    
    _individualityButton = [[BFEExtensionsCustomButton alloc] initWithFrame:CGRectMake(0, 0, 40, 60)];
    [_individualityButton setTitle:@"个性课堂" forState:0];
    [_individualityButton setTitleColor:[UIColor blackColor] forState:0];
    [_individualityButton setImage:[UIImage imageNamed:@"icon_textbook"] forState:0];
    
    _foreignPublicButton = [[BFEExtensionsCustomButton alloc] initWithFrame:CGRectMake(0, 0, 40, 60)];
    [_foreignPublicButton setTitle:@"外教公开课" forState:0];
    [_foreignPublicButton setTitleColor:[UIColor blackColor] forState:0];
    [_foreignPublicButton setImage:[UIImage imageNamed:@"icon_topic"] forState:0];
    
    _oralTestButton = [[BFEExtensionsCustomButton alloc] initWithFrame:CGRectMake(0, 0, 40, 60)];
    [_oralTestButton setTitle:@"口语考试" forState:0];
    [_oralTestButton setTitleColor:[UIColor blackColor] forState:0];
    [_oralTestButton setImage:[UIImage imageNamed:@"icon_words"] forState:0];
    
    [self addSubview:_independentStudyButton];
    [self addSubview:_individualityButton];
    [self addSubview:_foreignPublicButton];
    [self addSubview:_oralTestButton];
}

- (void)layoutSubViews {
    
    CGFloat offsetX = 10;
    if ([WidgetViewForiOSTEN isPhone]) {
        offsetX = 10;
    } else {
        offsetX = 0;
    }
    
    if (self.isCompact) {
        _guideLabel.frame = CGRectMake(offsetX, 0, self.width, 0);
        _backView.frame = CGRectMake(offsetX, 10, self.width - 20, 90);
        _backVagueView.frame = CGRectMake(0, 0, self.width, 90);
        
        _imageView.frame = CGRectMake(0, 0, 90, 90);
        
        _titleLabel.frame = CGRectMake(100, 10, self.width - _titleLabel.left, 21);
        
        _detailLabel.frame = CGRectMake(100, 35, self.width - _detailLabel.left, 21);
        
        _lineView.frame = CGRectMake(offsetX, 115, self.width, 1);
        
        _independentStudyButton.frame = CGRectMake(20, 125, 60, 70);
        _individualityButton.frame = CGRectMake(105, 125, 60, 70);
        _foreignPublicButton.frame = CGRectMake(190, 125, 60, 70);
        _oralTestButton.frame = CGRectMake(275, 125, 60, 70);
    } else {
        _guideLabel.frame = CGRectMake(offsetX, 10, self.width, 21);
        _backView.frame = CGRectMake(offsetX, 35, self.width - 20, 90);
        
        _backVagueView.frame = CGRectMake(0, 0, self.width, 90);
        
        _imageView.frame = CGRectMake(0, 0, 90, 90);
        
        _titleLabel.frame = CGRectMake(100, 10, self.width - _titleLabel.left, 21);
        
        _detailLabel.frame = CGRectMake(100, 35, self.width - _detailLabel.left, 21);
        
        _lineView.frame = CGRectMake(offsetX, 135, self.width, 1);
        
        _independentStudyButton.frame = CGRectMake(20, 155, 60, 70);
        _individualityButton.frame = CGRectMake(105, 155, 60, 70);
        _foreignPublicButton.frame = CGRectMake(190, 155, 60, 70);
        _oralTestButton.frame = CGRectMake(275, 155, 60, 70);
    }
}

- (void)setUpEvents {
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    [_backVagueView addGestureRecognizer:tap];
    
    [_independentStudyButton addTarget:self action:@selector(independentStudyButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_individualityButton addTarget:self action:@selector(individualityButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_foreignPublicButton addTarget:self action:@selector(foreignPublicButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_oralTestButton addTarget:self action:@selector(oralTestButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(widgetActiveDisplayModeDidChange:) name:AppExtensionWidgetActiveDisplayModeDidChangeNotification object:nil];
}

- (void)tapAction {
    
    NSLog(@"%@", NSStringFromCGRect(self.frame));
    
    [self clicked];
}

- (void)independentStudyButtonClicked:(UIButton *)sender {
    [self.defaults setObject:@"自主学习" forKey:@"title"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self clicked];
}

- (void)individualityButtonClicked:(UIButton *)sender {
    [self.defaults setObject:@"个性课堂" forKey:@"title"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self clicked];
}

- (void)foreignPublicButtonClicked:(UIButton *)sender {
    [self.defaults setObject:@"外教公开课" forKey:@"title"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self clicked];
}

- (void)oralTestButtonClicked:(UIButton *)sender {
    [self.defaults setObject:@"口语考试" forKey:@"title"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self clicked];
}

- (void)clicked {
    if (self.completionHandler) {
        self.completionHandler();
    }
}

- (void)widgetActiveDisplayModeDidChange:(NSNotification *)info {
    NSNumber *activeDisplayMode = (NSNumber *)[info object];
    if ([activeDisplayMode integerValue] == 0) {
        if (_guideLabel.height == 21) {
            CGFloat width = 359 - 20;
            [UIView animateWithDuration:0.25 animations:^{
                _independentStudyButton.top = 125;
                _independentStudyButton.height = 0;
                _independentStudyButton.alpha = 0;
                
                _individualityButton.top = 125;
                _individualityButton.height = 0;
                _individualityButton.alpha = 0;
                
                _foreignPublicButton.top = 125;
                _foreignPublicButton.height = 0;
                _foreignPublicButton.alpha = 0;
                
                _oralTestButton.top = 125;
                _oralTestButton.height = 0;
                _oralTestButton.alpha = 0;
                
                _lineView.top = 115;
                _lineView.alpha = 0;
                
                _guideLabel.frame = CGRectMake(10, 0, width, 0);
                _guideLabel.alpha = 0;
                
                _backView.frame = CGRectMake(10, 10, width - 20, 90);
            }];
        }
    } else {
        if (_guideLabel.height == 0) {
            CGFloat width = 359 - 20;
            [UIView animateWithDuration:0.25 animations:^{
                _guideLabel.frame = CGRectMake(10, 10, width, 21);
                _guideLabel.alpha = 1;
                _backView.frame = CGRectMake(10, 35, width - 20, 90);
                
                _independentStudyButton.top = 155;
                _independentStudyButton.height = 70;
                _independentStudyButton.alpha = 1;
                
                _individualityButton.top = 155;
                _individualityButton.height = 70;
                _individualityButton.alpha = 1;
                
                _foreignPublicButton.top = 155;
                _foreignPublicButton.height = 70;
                _foreignPublicButton.alpha = 1;
                
                _lineView.top = 135;
                _lineView.alpha = 0.4;
                
                _oralTestButton.top = 155;
                _oralTestButton.height = 70;
                _oralTestButton.alpha = 1;
            }];
        }
    }
}

- (void)setSelfWidth:(NSString *)selfWidth {
    _guideLabel.text = selfWidth;
}

+ (BOOL)isPhone {
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone);
}

+ (BOOL)isPad {
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}


@end

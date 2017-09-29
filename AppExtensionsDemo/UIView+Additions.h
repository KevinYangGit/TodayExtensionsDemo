//
//  UIView+Additions.h
//  boxfish-english
//
//  Created by YangQi on 17/2/28.
//  Copyright © 2017年 boxfish. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Additions)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

/**
 添加模糊view （effectView.frame ＝ self.bounds）

 @param alpha 透明度
 */
- (void)addEffectViewWithAlpha:(CGFloat)alpha;

@end

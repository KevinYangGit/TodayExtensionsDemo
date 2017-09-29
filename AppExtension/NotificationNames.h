//
//  NotificationNames.h
//  AppExtensionsDemo
//
//  Created by YangQi on 2017/8/9.
//  Copyright © 2017年 YangQI. All rights reserved.
//

#pragma once

static NSString * const AppExtensionWidgetActiveDisplayModeDidChangeNotification = @"AppExtensionWidgetActiveDisplayModeDidChangeNotification";
static NSString * const AppExtensionWidgetOpenHostAppNotification = @"AppExtensionWidgetOpenHostAppNotification";

//================= 二合一 =================
static NSString * const BFEUIApplicationShortcutItemType_BOXFiSH = @"com.boxfishedu.student";      //正式版
static NSString * const BFEUIApplicationShortcutItemType_BOXFiSH_Company = @"com.boxfish.english"; //企业版

//================= 外教 =================
static NSString * const BFEUIApplicationShortcutItemType_BOXFiSHTutor = @"com.boxfish.foreign.teacher";              //正式版
static NSString * const BFEUIApplicationShortcutItemType_BOXFiSHTutor_Company = @"com.boxfishedu.foreigner.teacher"; //企业版

static NSString * const shortcutItemType_Share = @"com.BOXFiSH.share";
static NSString * const shortcutItemType_Search = @"com.BOXFiSH.search";
static NSString * const ThreeDTouchUserDefaultsKey = @"ThreeDTouchUserDefaultsKey";

//================= 3D touch快捷选项 =================
static NSString * const ThreeDTouchIndependentStudy = @"ThreeDTouchIndependentStudy";             //自主学习
static NSString * const ThreeDTouchIndividualityClassRoom = @"ThreeDTouchIndividualityClassRoom"; //个性课堂
static NSString * const ThreeDTouchForeignAuditorium = @"ThreeDTouchForeignAuditorium";           //外教大讲堂
static NSString * const ThreeDTouchOralTest = @"ThreeDTouchOralTest";                             //口语考试

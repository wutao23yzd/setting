//
//  constant.h
//  simpleSettingUI
//
//  Created by wutao on 2017/8/19.
//  Copyright © 2017年 wutao. All rights reserved.
//

#ifndef constant_h
#define constant_h

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
// 以iphone6s iphone7为基准 4.7寸屏 --
#define BaseSCREEN_WIDTH               375.0f

#define AUTOLAYOUT_WIDTH_SCALE         SCREEN_WIDTH / BaseSCREEN_WIDTH

#define AUTOLAYOUT_LENGTH(x)           ((x) * AUTOLAYOUT_WIDTH_SCALE)

// tableview分割线
#define kCuttingLineColor [UIColor colorWithRed:238/ 255.0 green:238 / 255.0 blue:238 / 255.0 alpha:1]
#define kTableHeaderBgColor [UIColor colorWithRed:69/ 255.0 green:120 / 255.0 blue:97 / 255.0 alpha:1]
#define kInitHeaderViewHeight 120 + AUTOLAYOUT_LENGTH(80)  //tableheaderview高度
#define kInitUserImageViewHeight AUTOLAYOUT_LENGTH(80)     //
#define kInitHeaderViewOriginY 0
#endif /* constant_h */

//
//  CustomNavigationBackButton.h
//  CustomNavigationBackButton
//
//  Created by Leo_hsu on 2016/7/25.
//  Copyright © 2016年 Leo_hsu. All rights reserved.
//
#import <UIKit/UIKit.h>

@interface CustomNavigationBackButton : UIView

- (id)initCustomNavigationBackButton:(NSString *)buttonIconName
                         buttonTitle:(NSString *)buttonTitle
                         withViewTag:(NSInteger)vTag
                         withBtnTag:(NSInteger)bTag
                        targetObject:(id)target
                            selector:(SEL)selectorName;

@end

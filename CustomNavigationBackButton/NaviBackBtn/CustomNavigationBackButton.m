//
//  CustomNavigationBackButton.h
//  CustomNavigationBackButton
//
//  Created by Leo_hsu on 2016/7/25.
//  Copyright © 2016年 Leo_hsu. All rights reserved.
//

#import "CustomNavigationBackButton.h"

@implementation CustomNavigationBackButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        
    }
    return self;
}

- (UIButton *)backButton:(NSString *)buttonIconName targetObject:(id)target selector:(SEL)selectorName
{
    CGFloat viewWidth = self.frame.size.width;
    UIImage *buttonLogoImage = [UIImage imageNamed:buttonIconName];
    CGFloat btnWidth = buttonLogoImage.size.width/2;
    CGFloat btnHeight = buttonLogoImage.size.height/2;
    UIButton *barButton = [[UIButton alloc] initWithFrame:CGRectMake(-2, 0, btnWidth, btnHeight)];
    //Arabian, Latin writing mode (Right to Left)
    if ([UIApplication sharedApplication].userInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionRightToLeft  &&
        [[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] == NSOrderedDescending) {
        buttonIconName = [NSString stringWithFormat:@"%@%@", buttonIconName, @"_arabic"];
        buttonLogoImage = [UIImage imageNamed:buttonIconName];
        barButton.frame = CGRectMake(viewWidth-(-2)-btnWidth, 0, btnWidth, btnHeight);
    }
    
    [barButton setBackgroundColor:[UIColor clearColor]];
    [barButton setImage:buttonLogoImage forState:UIControlStateNormal];
    
    NSString *buttonImageName = [NSString stringWithFormat:@"%@%@", buttonIconName, @"_highlighted"];
    UIImage *buttonLogoImageHighlighted = [UIImage imageNamed:buttonImageName];
    if (buttonLogoImageHighlighted) {
        [barButton setImage:buttonLogoImageHighlighted forState:UIControlStateHighlighted];
    }
    
    if (selectorName)
    {
        [barButton addTarget:target action:selectorName forControlEvents:UIControlEventTouchUpInside];
    }
    
    return barButton;
}

- (id)initCustomNavigationBackButton:(NSString *)buttonIconName
                         buttonTitle:(NSString *)buttonTitle
                         withViewTag:(NSInteger)vTag
                          withBtnTag:(NSInteger)bTag
                        targetObject:(id)target
                            selector:(SEL)selectorName
{
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    UIFont *fnt = [UIFont fontWithName:@"Helvetica" size:17];
    CGSize textSize = [buttonTitle sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
    CGFloat viewWidth = textSize.width + 46;
    self = [self initWithFrame:CGRectMake(0, 0, viewWidth, 44)];
    //Arabian, Latin writing mode (Right to Left)
    if ([UIApplication sharedApplication].userInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionRightToLeft &&
        [[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] == NSOrderedDescending) {
        self.frame = CGRectMake(screenWidth-viewWidth, 0, viewWidth, 44);
    }
    [self setBackgroundColor:[UIColor clearColor]];
    self.tag = vTag;
    
    UIButton *leftButtonItem = [self backButton:buttonIconName
                                   targetObject:target
                                       selector:selectorName];
    [self addSubview: leftButtonItem];
    
    CGFloat titleWidth = textSize.width;
    UIButton *topTitleButton = [[UIButton alloc] initWithFrame:CGRectMake(27, 1, titleWidth, 44)];
    [topTitleButton setBackgroundColor:[UIColor clearColor]];
    topTitleButton.titleLabel.font = fnt;
    topTitleButton.tag = bTag;
    
    [topTitleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [topTitleButton setTitle:buttonTitle forState:UIControlStateNormal];
    topTitleButton.titleLabel.textAlignment = NSTextAlignmentLeft;
    topTitleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //Arabian, Latin writing mode (Right to Left)
    if ([UIApplication sharedApplication].userInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionRightToLeft &&
        [[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] == NSOrderedDescending) {
        topTitleButton.frame = CGRectMake(viewWidth-27-titleWidth, 1, titleWidth, 44);
        topTitleButton.titleLabel.textAlignment = NSTextAlignmentRight;
        topTitleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    
    if (selectorName)
    {
        [topTitleButton addTarget:target action:selectorName forControlEvents:UIControlEventTouchUpInside];
    }
    
    [self addSubview: topTitleButton];
    
    return self;
}


@end

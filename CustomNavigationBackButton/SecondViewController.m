//
//  SecondViewController.m
//  CustomNavigationBackButton
//
//  Created by Leo_hsu on 2016/7/25.
//  Copyright © 2016年 Leo_hsu. All rights reserved.
//

#import "SecondViewController.h"
#import "CustomNavigationBackButton.h"

static const int NAVIGATION_BAR_TAG = 101;
static const int NAVIGATION_BUTTON_TAG = 102;
static NSString *BACK_ICON = @"bar_button_icon_back";
static NSString *BACK_TITILE = @"Back";

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Second";
    [self addCustomBackBtn];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self removeCustomBackButton];
}

- (void)addCustomBackBtn {
    [self.navigationItem setHidesBackButton:YES];
    UIView *leftButtonItemView = [[CustomNavigationBackButton alloc] initCustomNavigationBackButton:BACK_ICON buttonTitle:BACK_TITILE withViewTag:NAVIGATION_BAR_TAG withBtnTag:NAVIGATION_BUTTON_TAG targetObject:self selector:@selector(touchUpBackButton)];
    [self.navigationController.navigationBar addSubview:leftButtonItemView];
}

- (void)removeCustomBackButton {
    UIView *leftButtonItemView = [self.navigationController.navigationBar viewWithTag:NAVIGATION_BAR_TAG];
    NSArray *viewsToRemove = [leftButtonItemView subviews];
    for (UIView *v in viewsToRemove) {
        [v removeFromSuperview];
    }
    [leftButtonItemView removeFromSuperview];
}

- (void)touchUpBackButton {
    __weak typeof(self) weakSelf = self;
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle: nil
                                                                              message: @"Do you really want to leave?"
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
         [weakSelf.navigationController popViewControllerAnimated:YES];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

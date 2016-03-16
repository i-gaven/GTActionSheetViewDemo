//
//  ViewController.m
//  GTActionSheetViewDemo
//
//  Created by 赵国腾 on 16/3/14.
//  Copyright © 2016年 赵国腾. All rights reserved.
//

#import "ViewController.h"
#import "GTActionSheetView.h"

@interface ViewController () <GTActionSheetViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    
    
}


- (IBAction)buttonAction:(UIButton *)sender {
    
    GTActionSheetView *actionSheetView = [GTActionSheetView showActionSheetViewAtView:self.view];
    
    actionSheetView.delegate = self;
    
    actionSheetView.dataList = @[@"1~2个月", @"2~3个月", @"3~4个月", @"4~5个月", @"5~10个月", @"10个月以上"];
    
    [actionSheetView reloadData];
}

#pragma mark - <GTActionSheetViewDelegate>

- (void)gt_actionSheet:(GTActionSheetView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    
    NSLog(@"自定义ActionSheet: %ld", buttonIndex);
}

@end

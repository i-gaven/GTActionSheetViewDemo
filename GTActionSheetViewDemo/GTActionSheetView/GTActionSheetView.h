//
//  GTActionSheetView.h
//  GTActionSheetViewDemo
//
//  Created by 赵国腾 on 16/3/14.
//  Copyright © 2016年 赵国腾. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol GTActionSheetViewDelegate;

@interface GTActionSheetView : UIView

@property (nonatomic, weak) id<GTActionSheetViewDelegate> delegate;
@property (nonatomic, strong) NSArray *dataList;

+ (GTActionSheetView *)showActionSheetViewAtView:(UIView *)view;

- (void)reloadData;

@end


@protocol GTActionSheetViewDelegate <NSObject>

@optional

- (void)gt_actionSheet:(GTActionSheetView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex;
- (void)gt_actionSheetCancel:(GTActionSheetView *)actionSheet;

@end


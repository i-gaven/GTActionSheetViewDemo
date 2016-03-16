//
//  GTActionSheetCell.h
//  GTActionSheetViewDemo
//
//  Created by 赵国腾 on 16/3/14.
//  Copyright © 2016年 赵国腾. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GTActionSheetCell : UITableViewCell

@property (nonatomic, strong) NSString *title;

+ (NSString *)cellIdentifier;
+ (GTActionSheetCell *)createCell;

@end

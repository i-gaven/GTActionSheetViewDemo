//
//  GTActionSheetView.m
//  GTActionSheetViewDemo
//
//  Created by 赵国腾 on 16/3/14.
//  Copyright © 2016年 赵国腾. All rights reserved.
//

#import "GTActionSheetView.h"
#import "GTActionSheetCell.h"

const CGFloat bottomHeight = 54.0f;
const CGFloat contentViewMaxHeight = 350.0f;

@interface GTActionSheetView ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) CGFloat contentViewHeight;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIView *bgView;
@property (nonatomic, weak) IBOutlet UIView *contentView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentViewHeightConstraint;

@end


@implementation GTActionSheetView

- (void)awakeFromNib {
    
    self.bgView.alpha = 0.0f;
    self.contentViewHeightConstraint.constant = 0.0f;
}

- (void)layoutSubviews {
    

}

- (void)setDataList:(NSArray *)dataList {
    
    _dataList = dataList;
    
    self.contentViewHeight = self.dataList.count * 44 + bottomHeight;
    
    if (MIN(contentViewMaxHeight, self.contentViewHeight) == self.contentViewHeight) {
        self.tableView.scrollEnabled = NO;
    }
    
    
    self.contentViewHeightConstraint.constant = MIN(contentViewMaxHeight, self.contentViewHeight);
    
    [UIView animateWithDuration:0.25f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         
                         self.bgView.alpha = 0.3f;
                         
                     } completion:^(BOOL finished) {
                         
                         [UIView animateWithDuration:0.25f
                                               delay:0.0f
                                             options:UIViewAnimationOptionCurveEaseIn
                                          animations:^{
                                              
                                              [self.contentView layoutIfNeeded];
                                          }completion:NULL];
                     }];

}


#pragma mark - <UITableViewDataSource, UITableViewDelegate>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    GTActionSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:[GTActionSheetCell cellIdentifier]];
    
    if (cell == nil) {
        
        cell = [GTActionSheetCell createCell];
    }
    
    NSString *title = self.dataList[indexPath.row];
    
    cell.title = title;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [self cancleAnimate];
    
    if ([self.delegate respondsToSelector:@selector(gt_actionSheet:clickedButtonAtIndex:)]) {
        [self.delegate gt_actionSheet:self clickedButtonAtIndex:indexPath.row];
    }
}


+ (GTActionSheetView *)showActionSheetViewAtView:(UIView *)view {
    
    GTActionSheetView *actionSheetView = [[[NSBundle mainBundle] loadNibNamed:@"GTActionSheetView" owner:self options:nil] firstObject];
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:actionSheetView action:@selector(tapAction:)];
    [actionSheetView.bgView addGestureRecognizer:tapGestureRecognizer];
    
    actionSheetView.frame = view.bounds;
    [view addSubview:actionSheetView];
    
    return actionSheetView;
}

- (void)tapAction:(UITapGestureRecognizer *)gesture {
 
    [self cancleAnimate];
}

- (IBAction)cancelAction:(id)sender {
    
    [self cancleAnimate];
    
    if ([self.delegate respondsToSelector:@selector(gt_actionSheetCancel:)]) {
        [self.delegate gt_actionSheetCancel:self];
    }
}


- (void)cancleAnimate {
    
    [UIView animateWithDuration:0.25f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         
                         self.bgView.alpha = 0.0f;
                         
                         CGRect contentViewRect = self.contentView.frame;
                         contentViewRect.origin.y = CGRectGetHeight(self.frame);
                         self.contentView.frame = contentViewRect;
                         
                     } completion:^(BOOL finished) {
                         
                         [self removeFromSuperview];
                         
                     }];


}

- (void)reloadData {

    [self.tableView reloadData];
}

@end

















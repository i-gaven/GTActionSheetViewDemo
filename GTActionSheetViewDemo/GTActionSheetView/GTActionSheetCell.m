//
//  GTActionSheetCell.m
//  GTActionSheetViewDemo
//
//  Created by 赵国腾 on 16/3/14.
//  Copyright © 2016年 赵国腾. All rights reserved.
//

#import "GTActionSheetCell.h"

@interface GTActionSheetCell ()

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) CAShapeLayer *lineShapeLayer;


@end

@implementation GTActionSheetCell

+ (NSString *)cellIdentifier {
    return @"GTActionSheetCell";
}

+ (GTActionSheetCell *)createCell {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"GTActionSheetCell" owner:self options:nil] firstObject];
}

- (void)awakeFromNib {

}

- (void)layoutSubviews {
    
    [self.layer addSublayer:self.lineShapeLayer];
}


- (void)setTitle:(NSString *)title {
    
    _title = title;
    self.titleLabel.text = _title;
}

- (CAShapeLayer *)lineShapeLayer {
    
    if (_lineShapeLayer == nil) {
        
        CGFloat lineY = CGRectGetHeight(self.frame) - 1.0f;
        
        _lineShapeLayer = [CAShapeLayer layer];
        _lineShapeLayer.frame = CGRectMake(0, lineY, CGRectGetHeight(self.frame), 1.0f);
        _lineShapeLayer.lineWidth = 1.0f / [UIScreen mainScreen].scale;
        _lineShapeLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint:CGPointMake(0, 1 - 1.0f / [UIScreen mainScreen].scale)];
        [bezierPath addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), 1 - 1.0f / [UIScreen mainScreen].scale)];
        _lineShapeLayer.path = bezierPath.CGPath;
    }
    
    return _lineShapeLayer;
}

@end

//
//  LLGlowImageView.m
//  Pods-LLPopMenu
//
//  Created by 李观文 on 2018/8/13.
//
#import "LLGlowImageView.h"



@implementation LLGlowImageView

/**
 *  设置阴影的颜色
 */
- (void)setGlowColor:(UIColor *)newGlowColor {
    _glowColor = newGlowColor;
    if (newGlowColor) {
        [self setUpProperty];
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

/**
 *   根据阴影 设置图层 默认属性
 */
- (void)setUpProperty {
    self.layer.shadowColor = self.glowColor.CGColor;
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(-5, -5, CGRectGetWidth(self.bounds) + 10, CGRectGetHeight(self.bounds) + 10) cornerRadius:(CGRectGetHeight(self.bounds) + 10) / 2.0].CGPath;
    self.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    self.layer.shadowOpacity = 0.5;
    self.layer.masksToBounds = NO;
}

@end

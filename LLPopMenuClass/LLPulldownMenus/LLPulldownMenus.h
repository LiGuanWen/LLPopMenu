//
//  LLPulldownMenus.h
//  Pods-LLPopMenu
//
//  Created by 李观文 on 2018/8/13.
//

#import <UIKit/UIKit.h>

@interface LLPulldownMenus : UIView

@property (nonatomic, strong) NSArray *titlesArr;
@property (nonatomic, strong) NSArray *imagesArr;

@property (strong, nonatomic) UIColor *bgColor;      //背景颜色
@property (strong, nonatomic) UIColor *titleColor;    //title 的颜色
@property (strong, nonatomic) UIFont *titleFont;    //title 大小  默认15
@property (assign, nonatomic) NSInteger maxDisplaysCount;  //当前最多显示个数

@property (strong, nonatomic) UIColor *separatorColor;  //分割线颜色
@property (copy, nonatomic) void (^dismissWithCompletionBlock)(NSString *title, NSInteger index);

- (instancetype)initWithTitlesArr:(NSArray *)titlesArr imagesArr:(NSArray *)imagesArr arrowPoint:(CGPoint)arrowPoint width:(CGFloat)width rowHeight:(CGFloat)rowHeight;

- (void)addBgViewWithBgColor:(UIColor *)bgColor alpha:(float)alpha;
@end

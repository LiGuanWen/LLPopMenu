//
//  LLMenuItem.h
//  Pods-LLPopMenu
//
//  Created by 李观文 on 2018/8/13.

// ==========================================
//  LLMenuItem 菜单元素  数据模型
// ==========================================

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LLMenuItem : NSObject

/**
 *   标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  配图
 */
@property (nonatomic, strong) UIImage *iconImage;

/**
 *
 */
@property (nonatomic, strong) UIColor *glowColor;

/**
 *  按钮索引
 */
@property (nonatomic, assign) NSInteger index;

#pragma mark - 初始话 init

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName NS_AVAILABLE_IOS(2_0);

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor NS_AVAILABLE_IOS(2_0);

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                        index:(NSInteger)index NS_AVAILABLE_IOS(2_0);

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor
                        index:(NSInteger)index NS_AVAILABLE_IOS(2_0);

+ (instancetype)itemWithTitle:(NSString *)title
                     iconName:(NSString *)iconName NS_AVAILABLE_IOS(2_0);

+ (instancetype)itemWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor NS_AVAILABLE_IOS(2_0);

+ (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                        index:(NSInteger)index NS_AVAILABLE_IOS(2_0);

+ (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor
                        index:(NSInteger)index NS_AVAILABLE_IOS(2_0);

@end

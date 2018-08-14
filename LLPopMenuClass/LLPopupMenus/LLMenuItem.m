//
//  LLMenuItem.m
//  Pods-LLPopMenu
//
//  Created by 李观文 on 2018/8/13.


#import "LLMenuItem.h"

@implementation LLMenuItem

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName {
    return [self initWithTitle:title iconName:iconName glowColor:nil];
}

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor {
    return [self initWithTitle:title iconName:iconName glowColor:glowColor index:-1];
}

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                        index:(NSInteger)index {
    return [self initWithTitle:title iconName:iconName glowColor:nil index:index];
}

- (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor
                        index:(NSInteger)index {
    if (self = [super init]) {
        self.title = title;
        self.iconImage = [UIImage imageNamed:iconName];
        self.glowColor = glowColor;
        self.index = index;
    }
    return self;
}


+ (instancetype)itemWithTitle:(NSString *)title
                     iconName:(NSString *)iconName {
    return [self initWithTitle:title iconName:iconName glowColor:nil index:-1];
}

+ (instancetype)itemWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor {
    return [self initWithTitle:title iconName:iconName glowColor:glowColor index:-1];
}

+ (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                        index:(NSInteger)index {
    return [self initWithTitle:title iconName:iconName glowColor:nil index:index];
}

+ (instancetype)initWithTitle:(NSString *)title
                     iconName:(NSString *)iconName
                    glowColor:(UIColor *)glowColor
                        index:(NSInteger)index {
    LLMenuItem *item = [[self alloc ] initWithTitle:title iconName:iconName glowColor:glowColor index:index];
    return item;
}

@end

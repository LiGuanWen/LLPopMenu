//
//  LLMenuButton.h
//  Pods-LLPopMenu
//
//  Created by 李观文 on 2018/8/13.
// ==========================================
//  LLMenuButton 菜单视图 UIView  处理点击事件等
// ==========================================
#import <UIKit/UIKit.h>

@class MenuItem;

typedef void(^DidSelctedItemCompletedBlock)(MenuItem *menuItem);

@interface LLMenuButton : UIView

/**
 *  点击操作
 */
@property (nonatomic, copy) DidSelctedItemCompletedBlock didSelctedItemCompleted;

#pragma mark - init
- (instancetype)initWithFrame:(CGRect)frame menuItem:(MenuItem *)menuItem;

@end

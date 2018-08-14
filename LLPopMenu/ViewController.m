//
//  ViewController.m
//  LLLLPopMenu
//
//  Created by 李观文 on 2018/8/13.
//  Copyright © 2018年 第七代目. All rights reserved.
//

#import "ViewController.h"
#import "LLPulldownMenus.h"

#import "LLMenuItem.h"
#import "LLPopupMenus.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *pulldownBtn1;

@property (strong, nonatomic) IBOutlet UIButton *pulldownBtn2;
@property (strong, nonatomic) IBOutlet UIButton *pulldownBtn3;

@property (strong, nonatomic) LLPopupMenus *popupMenus;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)pulldownBtn1Action:(id)sender {
    LLPulldownMenus *pulldownMenu = [[LLPulldownMenus alloc] initWithTitlesArr:@[@"xxxxx",@"xxxsss",@"dfadfa"] imagesArr:@[@"right_menu_addFri",@"right_menu_addFri",@"right_menu_addFri"] arrowPoint:CGPointMake(self.pulldownBtn1.frame.origin.x+self.pulldownBtn1.frame.size.width/2, self.pulldownBtn1.frame.origin.y+self.pulldownBtn1.frame.size.height) width:150 rowHeight:44];
    pulldownMenu.dismissWithCompletionBlock = ^(NSString *title, NSInteger index) {
        
    };
    pulldownMenu.bgColor = [UIColor blueColor];
    pulldownMenu.titleColor = [UIColor redColor];
    [self.view addSubview:pulldownMenu];
}



- (IBAction)pulldownBtn2Action:(id)sender {
    LLPulldownMenus *pulldownMenu = [[LLPulldownMenus alloc] initWithTitlesArr:@[@"xxxxx",@"xxxsss",@"dfadfa"] imagesArr:nil arrowPoint:CGPointMake(self.pulldownBtn2.frame.origin.x+self.pulldownBtn2.frame.size.width/2, self.pulldownBtn2.frame.origin.y+self.pulldownBtn2.frame.size.height) width:150 rowHeight:44];
    pulldownMenu.dismissWithCompletionBlock = ^(NSString *title, NSInteger index) {
        
    };
    [self.view addSubview:pulldownMenu];
}
- (IBAction)pulldownBtn3Action:(id)sender {
    LLPulldownMenus *pulldownMenu = [[LLPulldownMenus alloc] initWithTitlesArr:@[@"xxxxx",@"xxxsss",@"dfadfa"] imagesArr:@[@"right_menu_addFri",@"right_menu_addFri",@"right_menu_addFri"] arrowPoint:CGPointMake(self.pulldownBtn3.frame.origin.x+self.pulldownBtn3.frame.size.width/2, self.pulldownBtn3.frame.origin.y+self.pulldownBtn3.frame.size.height) width:150 rowHeight:44];
    pulldownMenu.dismissWithCompletionBlock = ^(NSString *title, NSInteger index) {
        
    };
    [self.view addSubview:pulldownMenu];
}


- (IBAction)popupMenu1Action:(id)sender {
    [self showMenu:kLLPopupMenusAnimationTypeNetEase];
}


- (IBAction)popupMenu2Action:(id)sender {
    [self showMenu:kLLPopupMenusAnimationTypeSina];
}

- (void)showMenu:(LLPopupMenusAnimationType )type {
    NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:3];
    
    LLMenuItem *menuItem1 = [LLMenuItem itemWithTitle:@"Flickr" iconName:@"post_type_bubble_flickr"];
    [items addObject:menuItem1];
    
    LLMenuItem *menuItem2 = [LLMenuItem itemWithTitle:@"Googleplus" iconName:@"post_type_bubble_googleplus" glowColor:[UIColor colorWithRed:0.840 green:0.264 blue:0.208 alpha:0.800]];
    [items addObject:menuItem2];
    
    LLMenuItem *menuItem3 = [LLMenuItem itemWithTitle:@"Instagram" iconName:@"post_type_bubble_instagram" glowColor:[UIColor colorWithRed:0.232 green:0.442 blue:0.687 alpha:0.800]];
    [items addObject:menuItem3];
    
    LLMenuItem *menuItem4 = [LLMenuItem itemWithTitle:@"Twitter" iconName:@"post_type_bubble_twitter" glowColor:[UIColor colorWithRed:0.000 green:0.509 blue:0.687 alpha:0.800]];
    [items addObject:menuItem4];
    
    LLMenuItem *menuItem5 = [LLMenuItem itemWithTitle:@"Youtube" iconName:@"post_type_bubble_youtube" glowColor:[UIColor colorWithRed:0.687 green:0.164 blue:0.246 alpha:0.800]];
    [items addObject:menuItem5];
    
    LLMenuItem *menuItem6 = [LLMenuItem itemWithTitle:@"Facebook" iconName:@"post_type_bubble_facebook" glowColor:[UIColor colorWithRed:0.258 green:0.245 blue:0.687 alpha:0.800]];
    [items addObject:menuItem6];
    
    if (!_popupMenus) {
        _popupMenus = [[LLPopupMenus alloc] initWithFrame:self.view.bounds items:items];
        _popupMenus.menuAnimationType = kLLPopupMenusAnimationTypeSina;
    }
    
    _popupMenus.menuAnimationType = type;

    if (_popupMenus.isShowed) {
        return;
    }
    _popupMenus.didSelectedItemCompletion = ^(LLMenuItem *selectedItem) {
        NSLog(@"%@",selectedItem.title);
    };
    
    [_popupMenus showMenuAtView:self.view];
    
    //    [_LLPopMenu showMenuAtView:self.view startPoint:CGPointMake(CGRectGetWidth(self.view.bounds) - 60, CGRectGetHeight(self.view.bounds)) endPoint:CGPointMake(60, CGRectGetHeight(self.view.bounds))];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

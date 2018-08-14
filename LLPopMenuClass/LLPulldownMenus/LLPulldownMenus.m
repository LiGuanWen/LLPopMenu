//
//  LLPulldownMenus.m
//  Pods-LLPopMenu
//
//  Created by 李观文 on 2018/8/13.
//

#import "LLPulldownMenus.h"

#define TopToView 10.0f
#define LeftToView 10.0f
#define CellLineEdgeInsets UIEdgeInsetsMake(0, 10, 0, 10)
#define kScreenWidth        [UIScreen mainScreen].bounds.size.width
#define kScreenHeight        [UIScreen mainScreen].bounds.size.height

@interface LLPulldownMenus()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) CGPoint arrowPoint;
@property (nonatomic, assign) CGFloat rowHeight;
@property (nonatomic, assign) CGFloat rowWidth;

@property (nonatomic, strong) UITableView *tableView;

@end
@implementation LLPulldownMenus
- (void)layoutSubviews{
    [super layoutSubviews];
}

- (instancetype)initWithTitlesArr:(NSArray *)titlesArr imagesArr:(NSArray *)imagesArr arrowPoint:(CGPoint)arrowPoint width:(CGFloat)width rowHeight:(CGFloat)rowHeight{
    self = [super initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight)];
    if (self) {
        if (rowHeight <= 0) {
            rowHeight = 44;
        }
        self.backgroundColor = [UIColor clearColor];
        self.arrowPoint = arrowPoint;
        self.rowHeight = rowHeight;
        self.rowWidth = width;
        self.titlesArr = [titlesArr copy];
        self.imagesArr = imagesArr;
        float tabX = 0;
        if (arrowPoint.x < width/2.0) {
            //最左边
            tabX = arrowPoint.x - LeftToView - 5;
        }else if (arrowPoint.x > kScreenWidth - width/2.0){
            //最右边
            tabX = arrowPoint.x - width + LeftToView + 5;
        }else{
            //显示中间
            tabX = arrowPoint.x - width/2.0;
        }
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(tabX, arrowPoint.y + TopToView - 1, width, rowHeight * titlesArr.count) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        [self addSubview:_tableView];
        _tableView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:1];
        _tableView.layer.cornerRadius = 3;
        _tableView.bounces = NO;
        _tableView.separatorColor = [UIColor colorWithWhite:0.3 alpha:1];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"LLPulldownMenusCell"];
        if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [self.tableView setSeparatorInset:CellLineEdgeInsets];
        }
        if ([self.tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [self.tableView setLayoutMargins:CellLineEdgeInsets];
        }
    }
    return self;
}
//设置 高
- (void)setMaxDisplaysCount:(NSInteger)maxDisplaysCount{
    if (maxDisplaysCount > 0 ) {
        self.tableView.frame = CGRectMake(self.tableView.frame.origin.x, self.tableView.frame.origin.y, self.tableView.frame.size.width, self.rowHeight*maxDisplaysCount);
    }
}
//设置背景颜色
- (void)setBgColor:(UIColor *)bgColor{
    if (bgColor) {
        self.tableView.backgroundColor = bgColor;
    }
}

- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    [self.tableView reloadData];
}

- (void)setTitleFont:(UIFont *)titleFont{
    _titleFont = titleFont;
    [self.tableView reloadData];
}


#pragma mark tableviewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titlesArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.rowHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LLPulldownMenusCell"];
    cell.backgroundColor = [UIColor clearColor];
    if (self.titleColor) {
        cell.textLabel.textColor = self.titleColor;
    }else{
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    if (self.titleFont) {
        cell.textLabel.font = self.titleFont;
    }else{
        cell.textLabel.font = [UIFont systemFontOfSize:15];
    }
    cell.textLabel.text = self.titlesArr[indexPath.row];
    if (self.imagesArr.count > indexPath.row) {
        cell.imageView.image = [UIImage imageNamed:self.imagesArr[indexPath.row]];
    }
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor blackColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSInteger index = indexPath.row;
    NSString *title = self.titlesArr[index];
    if (self.dismissWithCompletionBlock) {
        self.dismissWithCompletionBlock(title,index);
    }
    [self dismissWithCompletion:nil];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:CellLineEdgeInsets];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:CellLineEdgeInsets];
    }
}

- (void)dismissWithCompletion:(void (^)(LLPulldownMenus *object))completion{
    self.titlesArr = nil;
    [self.tableView reloadData];
    __weak __typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.alpha = 0;
        float tabX = 0;
        if (weakSelf.arrowPoint.x < weakSelf.rowWidth/2.0) {
            //最左边
            tabX = weakSelf.arrowPoint.x - LeftToView - 5;
        }else if (weakSelf.arrowPoint.x > kScreenWidth - weakSelf.rowWidth/2.0){
            //最右边
            tabX = weakSelf.arrowPoint.x  + LeftToView + 5;
        }else{
            //显示中间
            tabX = weakSelf.arrowPoint.x;
        }
        weakSelf.tableView.frame = CGRectMake(tabX, weakSelf.tableView.frame.origin.y, 0, 0);
    } completion:^(BOOL finished) {
        [weakSelf removeFromSuperview];
        if (completion) {
            completion(weakSelf);
        }
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    if (![touch.view isEqual:self.tableView]) {
        [self dismissWithCompletion:nil];
    }
}

- (void)drawRect:(CGRect)rect{
    //    [colors[serie] setFill];
    //拿到当前视图准备好的画板
    CGContextRef
    context = UIGraphicsGetCurrentContext();
    //利用path进行绘制三角形
    CGContextBeginPath(context);//标记
    CGContextMoveToPoint(context,
                         self.arrowPoint.x, self.arrowPoint.y);//设置起点 顶部
    CGContextAddLineToPoint(context,
                             self.arrowPoint.x - LeftToView, self.arrowPoint.y + TopToView);  //左角
    CGContextAddLineToPoint(context,
                             self.arrowPoint.x + LeftToView, self.arrowPoint.y + TopToView); //右角
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    [self.tableView.backgroundColor setFill]; //设置填充色
    //    [self.tableView.backgroundColor setStroke]; //设置边框颜色
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
}

@end

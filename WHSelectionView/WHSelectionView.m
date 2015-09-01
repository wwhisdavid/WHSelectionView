//
//  WHSelectionView.m
//  WHSelectionViewDemo
//
//  Created by deyi on 15/9/1.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import "WHSelectionView.h"
#import "Masonry.h"
#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface WHSelectionView ()
/**
 *  选中的按钮
 */
@property (nonatomic, weak) UIButton *selectedButton;
@end

@implementation WHSelectionView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

#pragma mark - simple init

- (void)initAllViewsWithTitles:(NSArray *)titleArray
{
    _bgView = [[UIView alloc] init];
    _bgView.backgroundColor = [UIColor whiteColor];
    [self addSubview:_bgView];

    for (int i = 0; i < titleArray.count; i ++) {
        NSString *title = titleArray[i];
        UIButton *statementBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        statementBtn.userInteractionEnabled = YES;
        statementBtn.tag = i + 1;
        [statementBtn setTitle:title forState:UIControlStateNormal];
        [statementBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [statementBtn setTitleColor:[UIColor colorWithRed:254/255.0 green:208/255.0 blue:89/255.0 alpha:1] forState:UIControlStateSelected];
        [statementBtn setTitleColor:[UIColor colorWithRed:254/255.0 green:208/255.0 blue:89/255.0 alpha:1] forState:UIControlStateHighlighted];
        [statementBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];

        [self.bgView addSubview:statementBtn];
    }

    for (int i = 0; i < titleArray.count - 1; i ++) {
        UIView *lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        lineView.tag = i + 1;
        lineView.alpha = 0.5;
        [self.bgView addSubview:lineView];
    }

    self.bottomLine = [[UIView alloc] init];
    self.bottomLine.backgroundColor = [UIColor lightGrayColor];
    self.bottomLine.tag = 20;
    self.bottomLine.alpha = 0.5;
    [self.bgView addSubview:self.bottomLine];
}

- (void)setConstraintsWithTitles:(NSArray *)titleArray
{
    WeakSelf(ws);
    CGFloat margin = [UIScreen mainScreen].bounds.size.width / titleArray.count;

    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws);
    }];

    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.leading.equalTo(ws.bgView);
        make.height.equalTo(@1);
        make.centerY.equalTo(ws.bgView.mas_bottom);
    }];

    for (UIButton *btn in self.bgView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(ws.bgView);
                CGFloat btnMargin = margin * (btn.tag - 1 + 0.5);
                make.centerX.equalTo(ws.bgView.mas_leading).with.offset(btnMargin);
                make.width.mas_equalTo(margin);
            }];
        }
    }

    for (UIView *line in self.bgView.subviews) {
        if ([line isKindOfClass:[UIView class]] && ![line isKindOfClass:[UIButton class]] && line.tag != 20) {
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@1);
                make.leading.equalTo(ws.bgView.mas_leading).with.offset(margin * line.tag);
                make.top.bottom.equalTo(ws.bgView);
            }];
        }
    }
}

#pragma mark - imageButton init

- (void)initAllViewsWithTitles:(NSArray *)titleArray andIcons:(NSArray *)iconArray
{
    [self initAllViewsWithTitles:titleArray];
    CGFloat margin = [UIScreen mainScreen].bounds.size.width / titleArray.count;
    for (UIButton *btn in self.bgView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            [btn setImage:iconArray[btn.tag - 1] forState:UIControlStateNormal];
            CGFloat imageW = btn.imageView.image.size.width;
            btn.titleLabel.font = [UIFont systemFontOfSize:13.0];
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            btn.contentVerticalAlignment = UIControlContentVerticalAlignmentTop;
            CGSize titleSize = [titleArray[btn.tag - 1] sizeWithFont:[UIFont systemFontOfSize:13.0]];
            [btn setImageEdgeInsets:UIEdgeInsetsMake(- 10,  (margin - imageW) / 2, 0, 0)];
            [btn setTitleEdgeInsets:UIEdgeInsetsMake(14, (margin - titleSize.width) / 2 - imageW, 0, 0)];
        }
    }
}

#pragma mark - numberButton init
- (void)initAllViewsWithTitles:(NSArray *)titleArray andNumbers:(NSArray *)numberArray
{
    [self initAllViewsWithTitles:titleArray];
    for (UIButton *btn in self.bgView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
            btn.titleLabel.textAlignment = NSTextAlignmentCenter;
            [btn setTitle:[NSString stringWithFormat:@"%@\n%@", numberArray[btn.tag -1], titleArray[btn.tag - 1]] forState:UIControlStateNormal];
        }
    }
}

- (void)setConstraintsWithTitles2:(NSArray *)titleArray
{
    WeakSelf(ws);
    CGFloat margin = [UIScreen mainScreen].bounds.size.width / titleArray.count;

    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws);
    }];

    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.leading.equalTo(ws.bgView);
        make.height.equalTo(@1);
        make.centerY.equalTo(ws.bgView.mas_bottom);
    }];

    for (UIButton *btn in self.bgView.subviews) {
        if ([btn isKindOfClass:[UIButton class]]) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(ws.bgView);
                CGFloat btnMargin = margin * (btn.tag - 1 + 0.5);
                make.centerX.equalTo(ws.bgView.mas_leading).with.offset(btnMargin);
                make.width.mas_equalTo(margin);
            }];
        }
    }

    for (UIView *line in self.bgView.subviews) {
        if ([line isKindOfClass:[UIView class]] && ![line isKindOfClass:[UIButton class]] && line.tag != 20) {
            line.alpha = 0.5;
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.equalTo(@1);
                make.leading.equalTo(ws.bgView.mas_leading).with.offset(margin * line.tag);
                make.top.equalTo(ws.bgView).with.offset(10.0);
                make.bottom.equalTo(ws.bgView).with.offset(- 10.0);

            }];
        }
    }
}
#pragma mark - action

- (void)clickBtn:(UIButton *)btn
{
    if ([self.delegate respondsToSelector:@selector(circleContentSelectionView:clickFrom:to:)]) {
        [self.delegate circleContentSelectionView:self clickFrom:self.selectedButton.tag to:btn.tag];
    }
    self.selectedButton.selected = NO;
    btn.selected = YES;
    self.selectedButton = btn;
}

- (instancetype)initWithIcons:(NSArray *)iconArray andTitles:(NSArray *)titleArray andNumbers:(NSArray *)numberArray andStyle:(WHSelectionViewStyle)style
{
    self = [super init];

    switch (style) {
        case WHSelectionViewStyleSimple:{
            [self initAllViewsWithTitles:titleArray];
            [self setConstraintsWithTitles:titleArray];
            [self clickBtn:self.bgView.subviews[0]];
            break;
        }

        case WHSelectionViewStyleImageButton:{
            [self initAllViewsWithTitles:titleArray andIcons:iconArray];
            [self setConstraintsWithTitles:titleArray];
            break;
        }

        case WHSelectionViewStyleNumberButton:{
            [self initAllViewsWithTitles:titleArray andNumbers:numberArray];
            [self setConstraintsWithTitles2:titleArray];
            self.bgView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0];
            break;
        }
            
        default:
            break;
    }
    return self;
}
@end


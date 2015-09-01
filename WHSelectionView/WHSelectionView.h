//
//  WHSelectionView.h
//  WHSelectionViewDemo
//
//  Created by deyi on 15/9/1.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WHSelectionView;
@protocol WHSelectionViewDelegate <NSObject>

@optional
- (void)circleContentSelectionView:(WHSelectionView *)view clickFrom:(NSInteger) from to:(NSInteger)to;

@end

typedef enum {
    WHSelectionViewStyleSimple,//动态、圈子、玩伴
    WHSelectionViewStyleImageButton,//button上方图片，下方文字，用于圈子操作
    WHSelectionViewStyleNumberButton//button上方数字，下方文字，显示个人社交信息
} WHSelectionViewStyle;

@interface WHSelectionView : UIView


@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bottomLine;

///**
// *  simple的按钮
// */
//@property (nonatomic, strong) UIButton *simpleStyleBtn;
//
///**
// *  imageButtonStyle
// */
//@property (nonatomic, strong) UIButton *imageButtonStyleBtn;
//
///**
// *  numberButtonStyle
// */
//
//@property (nonatomic, strong) UIButton *numberButtonStyleBtn;


@property (nonatomic, assign) NSInteger selectedIndex;

@property (nonatomic, weak) id<WHSelectionViewDelegate> delegate;

/**
 *  提供构造方法
 *
 *  @param iconArray   图标数组，存放UIImage对象
 *  @param titleArray  标题
 *  @param numberArray 数字
 *  @param style       <#style description#>
 *
 *  @return selectionView
 */
- (instancetype)initWithIcons:(NSArray *)iconArray andTitles:(NSArray *)titleArray andNumbers:(NSArray *)numberArray andStyle:(WHSelectionViewStyle)style;

@end

//
//  ViewController.m
//  WHSelectionViewDemo
//
//  Created by deyi on 15/9/1.
//  Copyright (c) 2015年 deyi. All rights reserved.
//

#import "ViewController.h"
#import "WHSelectionView.h"
#import "Masonry.h"

#define WeakSelf(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    WeakSelf(ws);
    [super viewDidLoad];
    NSArray *titleArray = @[@"你好你好", @"你好你好", @"你好你好"];
    NSArray *iconArray = @[[UIImage imageNamed:@"circle_quit"], [UIImage imageNamed:@"circle_quit"], [UIImage imageNamed:@"circle_quit"]];

    WHSelectionView *view1 = [[WHSelectionView alloc] initWithIcons:iconArray andTitles:titleArray andNumbers:nil andStyle:WHSelectionViewStyleImageButton];

    WHSelectionView *view2 = [[WHSelectionView alloc] initWithIcons:nil andTitles:titleArray andNumbers:nil andStyle:WHSelectionViewStyleSimple];

    [self.view addSubview:view1];
    [self.view addSubview:view2];

    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.leading.equalTo(ws.view);
        make.centerY.equalTo(ws.view);
        make.height.equalTo(@50);
    }];

    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.leading.right.equalTo(ws.view);
        make.height.equalTo(@50);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

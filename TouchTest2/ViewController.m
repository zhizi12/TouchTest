//
//  ViewController.m
//  TouchTest2
//
//  Created by 张经兰 on 16/10/12.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "ViewController.h"
#import "OutScrollView.h"
#import "GrayView.h"


#define kBorderWidth   30

#define  kItemCount 5
#define  kBGColor  [UIColor grayColor]
@interface ViewController ()
@property (nonatomic, strong) OutScrollView *bigScrollView;
@property (nonatomic, strong) GrayView *bgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI{

    [self.view addSubview:self.bgView];
}

- (OutScrollView *)scrollView{
    if (!_bigScrollView) {
        _bigScrollView = [[OutScrollView alloc]init];
        
        _bigScrollView.clipsToBounds = NO;
        _bigScrollView.backgroundColor = kBGColor;
            _bigScrollView.frame = CGRectMake(kBorderWidth, 0, self.view.bounds.size.width  - kBorderWidth * 2, 170);
        _bigScrollView.pagingEnabled = YES;
        _bigScrollView.contentSize = CGSizeMake((self.view.bounds.size.width - kBorderWidth * 2) * kItemCount , 170);
        
        for (int i = 0; i < kItemCount; i++) {
            UIView *smallView = [[UIView alloc]initWithFrame:CGRectMake((i+1)*kBorderWidth + (self.view.bounds.size.width - kBorderWidth * 3) * i , 0, self.view.bounds.size.width - kBorderWidth * 4, 170)];
            [smallView setBackgroundColor:[UIColor yellowColor]];
            [_bigScrollView addSubview:smallView];
        }
    }
    return _bigScrollView;
}


- (GrayView *)bgView{
    if (!_bgView) {
        _bgView = [[GrayView alloc]init];
        _bgView.backgroundColor = kBGColor;
        _bgView.frame = CGRectMake(0, 100, self.view.bounds.size.width, 170);
        [_bgView addSubview:self.scrollView];
        _bgView.bigScrollView = _bigScrollView;

    }
    return _bgView;
}



@end

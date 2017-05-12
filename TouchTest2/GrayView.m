//
//  GrayView.m
//  TouchTest2
//
//  Created by 张经兰 on 16/10/13.
//  Copyright © 2016年 zhang. All rights reserved.
//

#import "GrayView.h"

@implementation GrayView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{

    return _bigScrollView;
//    return [super hitTest:point withEvent:event];
}

@end

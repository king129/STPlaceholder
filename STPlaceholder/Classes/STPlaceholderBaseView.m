//
//  TDXDPlaceholderBaseView.m
//  TDXDPlaceholderView
//
//  Created by legendry on 2018/1/15.
//  Copyright © 2018年 legendry. All rights reserved.
//

#import "STPlaceholderBaseView.h"

@implementation STPlaceholderBaseView
{
    BOOL _alreadyAddConstraints;
}

- (void)dealloc
{
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = NO ;
        _alreadyAddConstraints = NO ;
        _placeholderWidth = 200 ;
        _paddingBottom = 0 ;
    }
    return self;
}

- (void)show{
    [self addConstraintLayoutIfNeed] ;
    self.hidden = NO ;
    [self.superview bringSubviewToFront:self] ;
    CGFloat top = self.offsetTop + self.headerHeight ;
    [self updateVerticalContraint:top] ;
}

- (void)addConstraintLayoutIfNeed {
    
    if(self.subviews.count == 0) return ;
    if(_alreadyAddConstraints) return ;
    _alreadyAddConstraints = YES ;

    NSLayoutConstraint *_selfWidthConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:_placeholderWidth] ;
    _selfWidthConstraint.priority = UILayoutPriorityRequired ;
    [self addConstraint:_selfWidthConstraint] ;
    [self addConstraints:@[_selfWidthConstraint]] ;
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0] ;
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0] ;
    [self.superview addConstraints:@[centerXConstraint,centerYConstraint]] ;
    
    UIView *lastViewInSelf = self.subviews.lastObject ;
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:lastViewInSelf attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-_paddingBottom] ;
    [self addConstraint:bottom] ;
}
- (void)updateVerticalContraint:(CGFloat)constant{
    __block NSLayoutConstraint *centerYConstraint = nil ;
    NSArray<NSLayoutConstraint *> *constraints = self.constraints ;
    [constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if(obj.firstAttribute == NSLayoutAttributeCenterY) {
            centerYConstraint = obj ;
            *stop = YES ;
        }
    }];
    centerYConstraint.constant = constant ;
}

- (void)hide {
    self.hidden = YES ;
}



@end

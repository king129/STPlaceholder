//
//  STPlaceholderDefaultView.m
//  TDXDPlaceholderView
//
//  Created by legendry on 2018/1/15.
//  Copyright © 2018年 legendry. All rights reserved.
//

#import "STPlaceholderDefaultView.h"

#define _UIColorMake(r,g,b,a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]
#define _UIColorMakeAll(v)  _UIColorMake(v,v,v,1.0)
#define _TOP    20
#define _BOTTOM _TOP
#define _IconSize  CGSizeMake(100,100)

@implementation STPlaceholderDefaultView

+ (instancetype)defaultInstance {
    STPlaceholderDefaultView *instance = [[STPlaceholderDefaultView alloc] init] ;
    return instance ;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI] ;
        self.backgroundColor = [UIColor whiteColor] ;
        self.paddingBottom = _BOTTOM ;
        self.placeholderWidth = 300 ;
    }
    return self;
}

- (void)setupUI {
    [self addSubview:self.icon] ;
    [self addSubview:self.titleLabel] ;
    [self addSubview:self.detailsLabel] ;
    [self layout] ;
}

- (void)layout {
    
    NSLayoutConstraint *iconWidthConstraint = [NSLayoutConstraint constraintWithItem:self.icon attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:_IconSize.width] ;
    NSLayoutConstraint *iconHeighConstraint = [NSLayoutConstraint constraintWithItem:self.icon attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:_IconSize.height] ;
    NSLayoutConstraint *iconCenterXConstaint = [NSLayoutConstraint constraintWithItem:self.icon attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0] ;
    NSLayoutConstraint *iconTopConstaint = [NSLayoutConstraint constraintWithItem:self.icon attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:_TOP] ;
    [self.icon addConstraints:@[iconWidthConstraint,iconHeighConstraint]] ;
    [self addConstraints:@[iconCenterXConstaint,iconTopConstaint]] ;


    NSLayoutConstraint *titleTopConstaint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.icon attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15] ;
    NSLayoutConstraint *titleLeadingConstaint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:15] ;
    NSLayoutConstraint *titleTrailConstaint = [NSLayoutConstraint constraintWithItem:self.titleLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-15] ;
    [self addConstraints:@[titleTopConstaint,titleLeadingConstaint,titleTrailConstaint]] ;
    [self.titleLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical] ;
    [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical] ;

    NSLayoutConstraint *detailsTopConstaint = [NSLayoutConstraint constraintWithItem:self.detailsLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.titleLabel attribute:NSLayoutAttributeBottom multiplier:1.0 constant:15] ;
    NSLayoutConstraint *detailsLeadingConstaint = [NSLayoutConstraint constraintWithItem:self.detailsLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:15] ;
    NSLayoutConstraint *detailsTrailConstaint = [NSLayoutConstraint constraintWithItem:self.detailsLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-15] ;
    [self addConstraints:@[detailsTopConstaint,detailsLeadingConstaint,detailsTrailConstaint]] ;
    [self.detailsLabel setContentHuggingPriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical] ;
    [self.detailsLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical] ;
    
}

#pragma mark - lazy load

- (UIImageView *)icon {
    if(!_icon) {
        _icon = [[UIImageView alloc] init] ;
        _icon.contentMode = UIViewContentModeScaleAspectFit ;
        _icon.clipsToBounds = YES ;
        _icon.translatesAutoresizingMaskIntoConstraints = NO ;
    }
    return _icon ;
}
- (UILabel *)titleLabel {
    if(!_titleLabel) {
        _titleLabel = [[UILabel alloc] init] ;
        _titleLabel.textColor = _UIColorMakeAll(0x66);
        _titleLabel.backgroundColor = [UIColor clearColor] ;
        _titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth  ;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.numberOfLines = 0 ;
        [_titleLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical] ;
        [_titleLabel setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical] ;
        _titleLabel.textAlignment = NSTextAlignmentCenter ;
        _titleLabel.translatesAutoresizingMaskIntoConstraints = NO ;
    }
    return _titleLabel ;
}

- (UILabel *)detailsLabel {
    if(!_detailsLabel) {
        _detailsLabel = [[UILabel alloc] init] ;
        _detailsLabel.textColor = _UIColorMakeAll(0x77);
        _detailsLabel.backgroundColor = [UIColor clearColor] ;
        _detailsLabel.font = [UIFont systemFontOfSize:14];
        _detailsLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth  ;
        _detailsLabel.numberOfLines = 0 ;
        [_detailsLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultHigh forAxis:UILayoutConstraintAxisVertical] ;
        [_detailsLabel setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisVertical] ;
        _detailsLabel.textAlignment = NSTextAlignmentCenter ;
        _detailsLabel.translatesAutoresizingMaskIntoConstraints = NO ;
    }
    return _detailsLabel ;
}

@end

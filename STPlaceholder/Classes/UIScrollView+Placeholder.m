//
//  UIScrollView+Placeholder.m
//  TDXDPlaceholderView
//
//  Created by legendry on 2018/1/15.
//  Copyright © 2018年 legendry. All rights reserved.
//

#import "UIScrollView+Placeholder.h"
#import <objc/runtime.h>

NS_INLINE void _ExchangeMethod(Class target,SEL originSelector,SEL replaceSelector) {
    Method originMethod = class_getInstanceMethod( target, originSelector) ;
    Method replaceMethod = class_getInstanceMethod( target, replaceSelector) ;
    method_exchangeImplementations(originMethod, replaceMethod) ;
}


@implementation UIScrollView (Placeholder)

#pragma mark - get  set

- (void)setSt_holderView:(STPlaceholderBaseView *)st_holderView {
    if(![self isKindOfClass:[UITableView class]] && ![self isKindOfClass:[UICollectionView class]]) return ;
    if(!st_holderView || ![st_holderView isKindOfClass:[STPlaceholderBaseView class]]) return ;
    if(self.st_holderView) return ;
    SEL key = @selector(st_holderView) ;
    objc_setAssociatedObject(self, key, st_holderView, OBJC_ASSOCIATION_RETAIN) ;
    [self addSubview:st_holderView] ;
}
- (STPlaceholderBaseView *)st_holderView {
    return objc_getAssociatedObject(self, _cmd) ;
}

- (NSUInteger)_reloadDataCount {
    NSUInteger count = [objc_getAssociatedObject(self, _cmd) integerValue] ;
    return count ;
}
- (void)_reloadDataCountIncrease {
    NSUInteger count = [self _reloadDataCount] ;
    SEL key = @selector(_reloadDataCount) ;
    objc_setAssociatedObject(self, key , @(count + 1), OBJC_ASSOCIATION_COPY) ;
}

#pragma mark -

- (UITableView *)_tableView {
    return (UITableView *)self ;
}
- (UICollectionView *)_collectionView {
    return (UICollectionView *)self ;
}
- (BOOL)_isTableView {
    return [self isKindOfClass:[UITableView class]] ;
}
- (BOOL)_isCollectionView {
    return [self isKindOfClass:[UICollectionView class]] ;
}
- (CGFloat)_headerHeight {
    if([self _isTableView])
        return [self _tableView].tableHeaderView.frame.size.height ;
    else {
        UICollectionViewLayout *layout = [self _collectionView].collectionViewLayout ;
        if(!layout || ![layout isKindOfClass:[UICollectionViewFlowLayout class]]) return 0 ;
        UICollectionViewFlowLayout *_flowLayout = (UICollectionViewFlowLayout *)layout ;
        return _flowLayout.headerReferenceSize.height ;
    }
}
- (CGFloat)_footerHeight {
    if([self _isTableView])
        return [self _tableView].tableFooterView.frame.size.height ;
    else {
        UICollectionViewLayout *layout = [self _collectionView].collectionViewLayout ;
        if(!layout || ![layout isKindOfClass:[UICollectionViewFlowLayout class]]) return 0 ;
        UICollectionViewFlowLayout *_flowLayout = (UICollectionViewFlowLayout *)layout ;
        return _flowLayout.footerReferenceSize.height ;
    }
}

#pragma mark - place holder

- (NSUInteger)_rowSize {
    NSUInteger _total = 0 ;
    NSInteger sectionSize = 0 ;
    if([self _isTableView]) {
        sectionSize = [[self _tableView] numberOfSections] ;
    } else {
        sectionSize = [[self _collectionView] numberOfSections] ;
    }
    for(NSInteger i = 0 ; i < sectionSize ; i ++) {
        if([self _isTableView]) {
            _total += [[self _tableView] numberOfRowsInSection:i] ;
        } else {
            _total += [[self _collectionView] numberOfItemsInSection:i] ;
        }
    }
    return _total ;
}
- (BOOL)_isInitiativeInvoke {
    //刷新一次,数量增加一次,所以如果是0表示一次还没有刷新
    //第一次刷新是layoutSubviews的时候调用的
    return [self _reloadDataCount] == 0 ;
}

- (void)_showPlaceholderViewIfNecessary {
    BOOL _isInitiativeInvoke = [self _isInitiativeInvoke] ;
    NSUInteger rowSize = [self _rowSize] ;
    STPlaceholderBaseView *placeholderView = self.st_holderView ;
    //显示
    if(!_isInitiativeInvoke && rowSize == 0 && placeholderView) {
        [placeholderView setValue:@([self _headerHeight]) forKey:@"headerHeight"];
        [placeholderView setValue:@([self _footerHeight] ) forKey:@"footerHeight"] ;
        [placeholderView show] ;
    } else {
        [placeholderView hide] ;
    }
}
@end


@implementation UITableView (Placeholder)

+ (void)load
{
    _ExchangeMethod([self class], @selector(reloadData), @selector(_st_reloadData)) ;
    _ExchangeMethod([self class], @selector(insertSections:withRowAnimation:), @selector(_st_insertSections:withRowAnimation:)) ;
    _ExchangeMethod([self class], @selector(deleteSections:withRowAnimation:), @selector(_st_deleteSections:withRowAnimation:)) ;
    _ExchangeMethod([self class], @selector(insertRowsAtIndexPaths:withRowAnimation:), @selector(_st_insertRowsAtIndexPaths:withRowAnimation:)) ;
    _ExchangeMethod([self class], @selector(deleteRowsAtIndexPaths:withRowAnimation:), @selector(_st_deleteRowsAtIndexPaths:withRowAnimation:)) ;
}
- (void)_st_reloadData {
    [self _st_reloadData] ;
    if(!self.st_holderView) return ;
    [self _showPlaceholderViewIfNecessary] ;
    [self _reloadDataCountIncrease] ;
}
- (void)_st_insertSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    [self _st_insertSections:sections withRowAnimation:animation] ;
    if(!self.st_holderView) return ;
    [self _showPlaceholderViewIfNecessary] ;
    [self _reloadDataCountIncrease] ;
}
- (void)_st_deleteSections:(NSIndexSet *)sections withRowAnimation:(UITableViewRowAnimation)animation {
    [self _st_deleteSections:sections withRowAnimation:animation] ;
    if(!self.st_holderView) return ;
    [self _showPlaceholderViewIfNecessary] ;
    [self _reloadDataCountIncrease] ;
}
- (void)_st_insertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    [self _st_insertRowsAtIndexPaths:indexPaths withRowAnimation:animation] ;
    if(!self.st_holderView) return ;
    [self _showPlaceholderViewIfNecessary] ;
    [self _reloadDataCountIncrease] ;
}
- (void)_st_deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation {
    [self _st_deleteRowsAtIndexPaths:indexPaths withRowAnimation:animation] ;
    if(!self.st_holderView) return ;
    [self _showPlaceholderViewIfNecessary] ;
    [self _reloadDataCountIncrease] ;
}
@end

@implementation UICollectionView (Placeholder)

+ (void)load {
    _ExchangeMethod([self class], @selector(reloadData), @selector(_st_reloadData)) ;
    _ExchangeMethod([self class], @selector(insertSections:), @selector(_st_insertSections:)) ;
    _ExchangeMethod([self class], @selector(deleteSections:), @selector(_st_deleteSections:)) ;
    _ExchangeMethod([self class], @selector(insertItemsAtIndexPaths:), @selector(_st_insertItemsAtIndexPaths:)) ;
    _ExchangeMethod([self class], @selector(deleteItemsAtIndexPaths:), @selector(_st_deleteItemsAtIndexPaths:)) ;
}
- (void)_st_reloadData {
    [self _st_reloadData] ;
    if(!self.st_holderView) return ;
    [self _showPlaceholderViewIfNecessary] ;
    [self _reloadDataCountIncrease] ;
}
- (void)_st_insertSections:(NSIndexSet *)sections {
    [self _st_insertSections:sections] ;
    if(!self.st_holderView) return ;
    [self _showPlaceholderViewIfNecessary] ;
    [self _reloadDataCountIncrease] ;
}
- (void)_st_deleteSections:(NSIndexSet *)sections  {
    [self _st_deleteSections:sections] ;
    if(!self.st_holderView) return ;
    [self _showPlaceholderViewIfNecessary] ;
    [self _reloadDataCountIncrease] ;
}
- (void)_st_insertItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths  {
    [self _st_insertItemsAtIndexPaths:indexPaths ] ;
    if(!self.st_holderView) return ;
    [self _showPlaceholderViewIfNecessary] ;
    [self _reloadDataCountIncrease] ;
}
- (void)_st_deleteItemsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths  {
    [self _st_deleteItemsAtIndexPaths:indexPaths ] ;
    if(!self.st_holderView) return ;
    [self _showPlaceholderViewIfNecessary] ;
    [self _reloadDataCountIncrease] ;
}


@end


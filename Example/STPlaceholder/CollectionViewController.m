//
//  CollectionViewController.m
//  STPlaceholder_Example
//
//  Created by legendry on 2018/4/10.
//  Copyright © 2018年 czqasngit. All rights reserved.
//

#import "CollectionViewController.h"
#import <STPlaceholder/STPlaceholder.h>

@interface Cell : UICollectionViewCell

@end

@implementation Cell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor orangeColor] ;
    }
    return self;
}

@end

@interface CollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation CollectionViewController
{
    UICollectionView *_collectionView ;
    NSUInteger _count ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _count = 3 ;
    self.view.backgroundColor = [UIColor whiteColor] ;
    
    STPlaceholderDefaultView *placeholderView = [STPlaceholderDefaultView defaultInstance] ;
    placeholderView.icon.image = [UIImage imageNamed:@"empty"] ;
    placeholderView.titleLabel.text = @"没有网络123123123123123123123" ;
    placeholderView.detailsLabel.text = @"网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312";
    placeholderView.backgroundColor = [UIColor orangeColor] ;
//    _tableView.th_holderView = placeholderView ;
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init] ;
    flowLayout.minimumLineSpacing = 10 ;
    flowLayout.minimumInteritemSpacing = 10 ;
    flowLayout.itemSize = CGSizeMake(100, 100) ;
    
    
    
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 200, self.view.frame.size.width, self.view.frame.size.height - 200) collectionViewLayout:flowLayout] ;
    _collectionView.backgroundColor = [UIColor lightGrayColor] ;
    _collectionView.delegate = self ;
    _collectionView.dataSource = self ;
    [_collectionView registerClass:[Cell class] forCellWithReuseIdentifier:@"_Cell"] ;
    [self.view addSubview:_collectionView] ;
    _collectionView.st_holderView = placeholderView ;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _count = (_count > 0 ? 0 : 1) ;
//    [_collectionView reloadData] ;
    [_collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]] ;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _count ;
}
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:@"_Cell" forIndexPath:indexPath] ;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    _count -- ;
    if(_count < 0) {
        _count = 3;
    }
//    [_collectionView reloadData] ;
    [_collectionView deleteItemsAtIndexPaths:@[indexPath]] ;
}

@end


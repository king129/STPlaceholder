//
//  ViewController.m
//  TDXDPlaceholderView
//
//  Created by legendry on 2018/1/15.
//  Copyright © 2018年 legendry. All rights reserved.
//

#import "PVViewController.h"
#import <STPlaceholder/STPlaceholder.h>
@interface PVViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray* _arr;
    UITableView *_tableView ;
    int index ;
}
@end

@implementation PVViewController

- (void)dealloc
{
    NSLog(@"%s",__func__) ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    _arr = @[].mutableCopy ;
    self.view.backgroundColor = [UIColor whiteColor] ;
    _arr = @[@"1",@"2"].mutableCopy ;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,200, self.view.frame.size.width, self.view.frame.size.height - 200)] ;
    _tableView.delegate = self ;
    _tableView.dataSource = self ;
    STPlaceholderDefaultView *placeholderView = [STPlaceholderDefaultView defaultInstance] ;
    placeholderView.icon.image = [UIImage imageNamed:@"empty"] ;
    placeholderView.titleLabel.text = @"没有网络123123123123123123123" ;
    placeholderView.detailsLabel.text = @"网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312网络WIFI或者4G不可用，请认真检查网络1231231231231231233112312";
    placeholderView.backgroundColor = [UIColor orangeColor] ;
    _tableView.st_holderView = placeholderView ;
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)] ;
    header.backgroundColor = [UIColor yellowColor] ;
    _tableView.tableHeaderView = header ;
    
//    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)] ;
//    footer.backgroundColor = [UIColor orangeColor] ;
//    _tableView.tableFooterView = footer ;
    [self.view addSubview:_tableView] ;
}

- (void)testReload {
    if(index % 2 == 0) {
        _arr = @[@"数据1",@"数据2",@"数据3"].mutableCopy ;
    } else {
        _arr = @[].mutableCopy ;
    }
    index ++ ;
    [_tableView reloadData] ;
}

- (void)testDelete {
    
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testReload] ;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _arr.count ;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *name = @"name" ;
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:name] ;
    if(!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:name] ;
    }
    cell.textLabel.text = _arr[indexPath.row] ;
    return cell ;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_arr removeObjectAtIndex:indexPath.row] ;
//    [tableView beginUpdates] ;
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft] ;
//    [tableView endUpdates] ;
//    [_tableView reloadData] ;
}

@end

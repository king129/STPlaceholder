//
//  TDXDPlaceholderBaseView.h
//  TDXDPlaceholderView
//
//  Created by legendry on 2018/1/15.
//  Copyright © 2018年 legendry. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface STPlaceholderBaseView : UIView

/**宽,默认为200*/
@property (nonatomic,assign)CGFloat placeholderWidth;
/**上偏移(空视图与UIScrollView在Y方向上的偏移量)*/
@property (nonatomic,assign)CGFloat offsetTop ;
/**头部高(自动填充)*/
@property (nonatomic,assign,readonly)CGFloat headerHeight ;
/**尾部高(自动填充)*/
@property (nonatomic,assign,readonly)CGFloat footerHeight ;
/**视图底部的空隙(默认为0),用于自动计算垂直方向高度时填充底部空隙*/
@property (nonatomic,assign)CGFloat paddingBottom;


- (void)show ;
- (void)hide ;

@end

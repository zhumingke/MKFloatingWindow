//
//  MKFloatingWindow.h
//  DokeDemo
//
//  Created by Ke on 2020/5/25.
//  Copyright © 2020 mk. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, MKDragDirection) { 
    MKDragDirectionAny,          /**< 任意方向 */
    MKDragDirectionHorizontal,   /**< 水平方向 */
    MKDragDirectionVertical,     /**< 垂直方向 */
};

NS_ASSUME_NONNULL_BEGIN

@interface MKFloatingWindow : UIWindow

/** 拖拽方向 */
@property (nonatomic , assign) MKDragDirection dragDirection;
/** 黏贴顶部/底部的有效吸附高度,默认stickySideH = 20 */
@property (nonatomic , assign) CGFloat stickySideH;
/** 默认浮动view */
@property (nonatomic , strong) UIImageView *defImageView;

/** 自定义view */
@property (nonatomic , strong) UIView *customView;

/** 点击事件 */
@property (nonatomic , copy) void (^TouchActionBlock) (void);

@end

NS_ASSUME_NONNULL_END

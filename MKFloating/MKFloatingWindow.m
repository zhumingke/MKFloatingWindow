//
//  MKFloatingWindow.m
//  DokeDemo
//
//  Created by Ke on 2020/5/25.
//  Copyright © 2020 mk. All rights reserved.
//

#import "MKFloatingWindow.h"

#define BoundW [UIScreen mainScreen].bounds.size.width
#define BoundH [UIScreen mainScreen].bounds.size.height


@implementation MKFloatingWindow

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.windowLevel = UIWindowLevelAlert + 10;
        [self makeKeyAndVisible];
    
        self.backgroundColor = UIColor.clearColor;
        
        self.defImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BundleTest.bundle/refreshing@2x.png"]];
        self.defImageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [self addSubview:self.defImageView];
        self.defImageView.userInteractionEnabled = YES;
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(dragView:)];
        [self addGestureRecognizer:pan];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
- (void)dragView:(UIPanGestureRecognizer *)pan {
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:{//开始拖动

            [pan setTranslation:CGPointZero inView:self];
            break;
        }
        case UIGestureRecognizerStateChanged:{//拖动中
            
            CGPoint point = [pan translationInView:self];
            float dx;
            float dy;
            switch (self.dragDirection) {
                case MKDragDirectionAny:
                    dx = point.x;
                    dy = point.y;
                    break;
                case MKDragDirectionHorizontal:
                    dx = point.x;
                    dy = 0;
                    break;
                case MKDragDirectionVertical:
                    dx = 0;
                    dy = point.y;
                    break;
                default:
                    dx = point.x;
                    dy = point.y;
                    break;
            }
            
            CGPoint newCenter = CGPointMake(self.center.x + dx, self.center.y + dy);
            self.center = newCenter;
            [pan setTranslation:CGPointZero inView:self];
            break;
        }
        case UIGestureRecognizerStateEnded:{//拖动结束
            
            float endX = self.center.x;
            float endY = self.center.y;
            float W = self.frame.size.width;
            float H = self.frame.size.height;
            if (endX > (BoundW - W/2)) {
                endX = BoundW - W/2;
            } else if (endX < W/2) {
                endX = W/2;
            }
            if (endY > (BoundH - H/2)) {
                endY = BoundH - H/2;
            } else if (endY < H/2) {
                endY = H/2;
            }
            
            if (endX > (BoundW/2 - W/2)) {
                
                if (endY >= BoundH - H/2 - self.stickySideH) {
                    endY = BoundH - H/2;
                } else {
                    if (endY <= self.stickySideH + H/2) {
                        endY = H/2;
                    } else {
                        endX = BoundW - W/2;
                    }
                }
            } else {
    
                if (endY >= BoundH - H/2 - self.stickySideH) {
                    endY = BoundH - H/2;
                } else {
                    if (endY <= self.stickySideH + H/2) {
                        endY = H/2;
                    } else {
                        endX = W/2;
                    }
                }
            }
            
            [UIView animateWithDuration:0.2 animations:^{
                self.center = CGPointMake(endX, endY);
            }];
            
            [pan setTranslation:CGPointZero inView:self];
            break;
        }
        default:
            break;
    }
}
- (void)tapView:(UITapGestureRecognizer *)tap {
    NSLog(@"tap gesture");
    if (self.TouchActionBlock) {
        self.TouchActionBlock();
    }
}
- (CGFloat)stickySideH {
    if (_stickySideH == 0) {
        _stickySideH = 20;
    }
    return _stickySideH;
}

- (void)setCustomView:(UIView *)customView {
    _customView = customView;
    
    [self.defImageView removeFromSuperview];
    [self addSubview:_customView];
    
}
@end

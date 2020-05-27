//
//  ViewController.m
//  DokeDemo
//
//  Created by Ke on 2020/5/26.
//  Copyright © 2020 mk. All rights reserved.
//

#import "ViewController.h"
#import "MKFloatingWindow.h"

@interface ViewController (){
    MKFloatingWindow *_ball;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor.redColor colorWithAlphaComponent:0.3];
    
    _ball = [[MKFloatingWindow alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-50, [UIScreen mainScreen].bounds.size.height/2+50, 50, 50)];
    _ball.TouchActionBlock = ^{
        NSLog(@"dj");
    };
    
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor.greenColor colorWithAlphaComponent:0.3];
    [btn setTitle:@"+" forState:UIControlStateNormal];
    btn.frame = CGRectMake(self.view.frame.size.width/2-25, 200, 50, 50);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(pushAction) forControlEvents:(UIControlEventTouchUpInside)];
}
- (void)pushAction {
    [self.navigationController pushViewController:[UIViewController new] animated:YES];
}


@end

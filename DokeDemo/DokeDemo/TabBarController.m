//
//  TabBarController.m
//  DokeDemo
//
//  Created by Ke on 2020/5/26.
//  Copyright © 2020 mk. All rights reserved.
//

#import "TabBarController.h"
#import "ViewController.h"
#import "SecondViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:[ViewController new]];
    nav1.tabBarItem.title = @"home";
    nav1.tabBarItem.image = [UIImage imageNamed:@"homeLeftIcon"];
    [self addChildViewController:nav1];
    
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:[SecondViewController new]];
    nav2.tabBarItem.title = @"wo";
    nav2.tabBarItem.image = [UIImage imageNamed:@"homeLeftIcon"];
    [self addChildViewController:nav2];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

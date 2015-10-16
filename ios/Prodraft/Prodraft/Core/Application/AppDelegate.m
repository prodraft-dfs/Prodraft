//
//  AppDelegate.m
//  Prodraft
//
//  Created by Mark Evans on 10/15/15.
//  Copyright © 2015 Pro Draft, LLC. All rights reserved.
//

#import "AppDelegate.h"
#import "LaunchController.h"
#import "HomeController.h"
#import "ContestsController.h"
#import "ProfileController.h"
#import "MoreController.h"
#import <KinveyKit/KinveyKit.h>
#import "Services.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    
    [[KCSClient sharedClient] initializeKinveyServiceForAppKey:@"kid_Zk-MxAFKwe"
                                                 withAppSecret:@"9b54aa3d58a142fe9b177aa77c158947"
                                                  usingOptions:nil];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor darkGrayColor];
    [self initControllers];
    if ([[Services sharedInstance] checkAuth]) {
        self.window.rootViewController = self.tabBarController;
    }
    else {
        self.window.rootViewController = [self customNavbar:[[LaunchController alloc] initWithNibName:@"LaunchController" bundle:nil]];
    }
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - Custom Methods

- (void)initControllers {
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = @[[self customNavbar:[[HomeController alloc] initWithNibName:@"HomeController" bundle:nil]],
                                              [self customNavbar:[[ContestsController alloc] initWithNibName:@"ContestsController" bundle:nil]],
                                              [self customNavbar:[[ProfileController alloc] initWithNibName:@"ProfileController" bundle:nil]],
                                              [self customNavbar:[[MoreController alloc] initWithNibName:@"MoreController" bundle:nil]]];
    
    self.tabBarController.selectedIndex = 0;
    
    [[UITabBar appearance] setTintColor:[UIColor CustomBlueColor]];
    [[UITabBar appearance] setBarTintColor:[UIColor CustomTabGrayColor]];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont CustomRegularFontSize:10.0],
                                                        NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont CustomRegularFontSize:10.0],
                                                        NSForegroundColorAttributeName:[UIColor CustomBlueColor]} forState:UIControlStateHighlighted];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont CustomRegularFontSize:10.0],
                                                        NSForegroundColorAttributeName:[UIColor CustomBlueColor]} forState:UIControlStateSelected];
    
    for(UITabBarItem *item in _tabBarController.tabBar.items) {
        item.image = [item.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
}

- (UINavigationController*)customNavbar:(UIViewController*)vc {
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [nav.navigationBar setBarTintColor:[UIColor CustomNavGrayColor]];
    [nav.navigationBar setTranslucent:NO];
    [nav.navigationBar setShadowImage:[[UIImage alloc] init]];
    [nav.navigationBar setTintColor:[UIColor whiteColor]];
    [nav.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont CustomBoldFontSize:17],
                                                NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    // Enable Back Button Pop on Nav Stack
    if ([nav respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        nav.interactivePopGestureRecognizer.enabled = YES;
        nav.interactivePopGestureRecognizer.delegate = nil;
    }
    
    return nav;
}

@end

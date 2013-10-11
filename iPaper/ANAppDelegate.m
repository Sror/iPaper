//
//  ANAppDelegate.m
//  iPaper
//
//  Created by Avinash Nehra on 10/9/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import "ANAppDelegate.h"
#import "ANViewController.h"
#import "ANNewsPaperIIViewController.h"

@implementation ANAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.tabBar.barTintColor = [UIColor blackColor];
    
    
    ANViewController *rootViewController = [[ANViewController alloc] init];
    UINavigationController *entryPointApp = [[UINavigationController alloc] initWithRootViewController:rootViewController];
    entryPointApp.navigationBar.backgroundColor = [UIColor colorWithRed:0.95 green:0.45 blue:0.56 alpha:1.0];
    
    ANNewsPaperIIViewController *newsPaperIIViewController = [[ANNewsPaperIIViewController alloc] init];
    UINavigationController *entryPointAppII = [[UINavigationController alloc] initWithRootViewController:newsPaperIIViewController];
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:entryPointApp, entryPointAppII, nil];
    
    [(UITabBarItem *)[self.tabBarController.tabBar.items objectAtIndex:1] setImage:[UIImage imageNamed:@"showToolBarImage"]];
    [(UITabBarItem *)[self.tabBarController.tabBar.items objectAtIndex:1] setTitle:@"Next"];
    
    
    self.tabBarController.selectedViewController = entryPointApp;
    
    self.window.rootViewController = self.tabBarController;
    self.window.tintColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end

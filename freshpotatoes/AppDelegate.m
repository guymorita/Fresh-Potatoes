//
//  AppDelegate.m
//  freshpotatoes
//
//  Created by Guy Morita on 6/6/14.
//  Copyright (c) 2014 geemoo. All rights reserved.
//

#import "AppDelegate.h"
#import "MoviesViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    MoviesViewController *viewcon = [[MoviesViewController alloc] init];
    MoviesViewController *viewcon2 = [[MoviesViewController alloc] init];
    MoviesViewController *viewcon3 = [[MoviesViewController alloc] init];
    
    viewcon.title = @"Top Rentals";
    viewcon2.title = @"New Releases";
    viewcon3.title = @"Upcoming";
    
    viewcon.url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    viewcon2.url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/new_releases.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    viewcon3.url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/upcoming.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
    
    UITabBarController *tabController = [[UITabBarController alloc] init];
    [tabController setViewControllers:@[viewcon, viewcon2, viewcon3]];
    
    UINavigationController *navViewController = [[UINavigationController alloc] initWithRootViewController:tabController];
    
    navViewController.navigationBar.translucent = NO;
    navViewController.navigationBar.barTintColor = [UIColor brownColor];
    tabController.navigationItem.title = @"Fresh Potatoes";
    // setting the self.window.rootViewController tells the appdelegate which view controller to start with.

    self.window.rootViewController = navViewController;
    
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
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

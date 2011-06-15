//
//  IntelligentTemplateAppDelegate.m
//  IntelligentTemplate
//
//  Created by Timothy Fazio on 15/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "IntelligentTemplateAppDelegate.h"
//#import "IntelligentSplitViewController.h"
#import "FirstViewController.h"
#import "FirstMasterViewController.h"
//#import "FirstDetailViewController.h"
#import "SecondMasterViewController.h"
//#import "SecondDetailViewController.h"
#import "SecondViewController.h"


@implementation IntelligentTemplateAppDelegate


@synthesize window=_window;

@synthesize tabBarController=_tabBarController;

@synthesize tab1VC, tab2VC, tab3VC, tab4VC;



#pragma mark -
#pragma mark Convenience Methods / Accessors

////// IPAD ONLY
- (UISplitViewController *) splitViewController {
	if (![self.tabBarController.selectedViewController isKindOfClass:[UISplitViewController class]]) {
		NSLog(@"Unexpected navigation controller class in tab bar controller hierarchy, check nib.");
		return nil;
	}
	return (UISplitViewController *)self.tabBarController.selectedViewController;
}

- (UINavigationController *) masterNavigationController {
	UISplitViewController *split = [self splitViewController];
	if (split && split.viewControllers && [split.viewControllers count])
		return [split.viewControllers objectAtIndex:0];
	return nil;
}

- (UINavigationController *) detailNavigationController {
	UISplitViewController *split = [self splitViewController];
	if (split && split.viewControllers && [split.viewControllers count]>1)
		return [split.viewControllers objectAtIndex:1];
	return nil;
}

- (UIViewController *) currentMasterViewController {
	UINavigationController *nav = [self masterNavigationController];
	if (nav && nav.viewControllers && [nav.viewControllers count])
		return [nav.viewControllers objectAtIndex:0];
	return nil;
}


#pragma mark -
#pragma mark UITabBarControllerDelegate methods

- (BOOL)tabBarController:(UITabBarController *)tbc shouldSelectViewController:(UIViewController *)viewController {
	if (!viewController.tabBarItem.enabled)
		return NO;
	
	if (![viewController isEqual:tbc.selectedViewController]) {
		//debug_NSLog(@"About to switch tabs, popping to root view controller.");
		UINavigationController *nav = [self detailNavigationController];
		if (nav && [nav.viewControllers count]>1)
			[nav popToRootViewControllerAnimated:YES];
	}
	
	return YES;
}


#pragma mark -
#pragma mark Setup App Tabs / Splits

- (void)setupSplitViews {
	
    NSMutableArray *tabViewControllers = [[NSMutableArray alloc] initWithCapacity:4];
	
    //first tab (UIViewController)
    
    UIViewController *vc1 = self.tab1VC;
    UITabBarItem *tempTab1 = [[UITabBarItem alloc] initWithTitle:@"First View" 
                                                          image:nil 
                                                            tag:0];
    vc1.tabBarItem = tempTab1;
    [tempTab1 release];
    
    [tabViewControllers addObject:vc1];
    
    
    //second tab (IntelligentSplitViewController)
    UISplitViewController *vc2 = [self.tab2VC splitViewController];
    UITabBarItem *tempTab2 = [[UITabBarItem alloc] initWithTitle:@"First Split" 
                                                          image:nil 
                                                            tag:1];
    vc2.tabBarItem = tempTab2;
    [tempTab2 release];
    
    [tabViewControllers addObject:vc2];
    
    //third tab (IntelligentSplitViewController)
    UISplitViewController *vc3 = [self.tab3VC splitViewController];
    UITabBarItem *tempTab3 = [[UITabBarItem alloc] initWithTitle:@"Second Split" 
                                                           image:nil 
                                                             tag:2];
    vc3.tabBarItem = tempTab3;
    [tempTab3 release];
    
    [tabViewControllers addObject:vc3];

    
    //fourth tab (UIViewController)
    UIViewController *vc4 = self.tab4VC;
    UITabBarItem *tempTab4 = [[UITabBarItem alloc] initWithTitle:@"Fourth View" 
                                                           image:nil 
                                                             tag:3];
    vc4.tabBarItem = tempTab4;
    [tempTab4 release];
    
    [tabViewControllers addObject:vc4];
    
    
    [self.tabBarController setViewControllers:tabViewControllers];
	[tabViewControllers release];
    
}

#pragma mark -
#pragma mark Application lifecycle



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    // Add the tab bar controller's current view as a subview of the window
    
    
    [self setupSplitViews];
    
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

- init {
	if ((self = [super init])) {
		// initialize  to nil
		//mainWindow = nil;
	}
	return self;
}

- (void)dealloc
{
    [_window release];
    [_tabBarController release];
    [tab1VC release];
    [tab2VC release];
    [tab3VC release];
    [tab4VC release];
    
    [super dealloc];
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end

//
//  IntelligentTemplateAppDelegate.h
//  IntelligentTemplate
//
//  Created by Timothy Fazio on 15/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FirstViewController;
@class FirstMasterViewController;
@class SecondMasterViewController;
@class SecondViewController;

@interface IntelligentTemplateAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    FirstViewController *tab1VC;
    FirstMasterViewController *tab2VC;
    SecondMasterViewController *tab3VC;
    SecondViewController *tab4VC;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;

@property (nonatomic, retain) IBOutlet FirstViewController *tab1VC;
@property (nonatomic, retain) IBOutlet FirstMasterViewController *tab2VC;
@property (nonatomic, retain) IBOutlet SecondMasterViewController *tab3VC;
@property (nonatomic, retain) IBOutlet SecondViewController *tab4VC;

// Convenience Methods / Accessors
@property (nonatomic, readonly) UISplitViewController *splitViewController;
@property (nonatomic, readonly) UIViewController *currentMasterViewController;
@property (nonatomic, readonly) UINavigationController *masterNavigationController;
@property (nonatomic, readonly) UINavigationController *detailNavigationController;


@end

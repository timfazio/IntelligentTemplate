//
//  FirstDetailViewController.h
//  IntelligentTemplate
//
//  Created by Timothy Fazio on 15/06/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FirstDetailViewController : UIViewController <UISplitViewControllerDelegate> {
    UILabel *detailItem;
    UIPopoverController *masterPopover;
}

@property (nonatomic, retain) IBOutlet UILabel *detailItem;
@property (nonatomic, retain) UIPopoverController *masterPopover;

@end
